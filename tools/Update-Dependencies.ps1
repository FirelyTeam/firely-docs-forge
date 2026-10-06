<#
.SYNOPSIS
    Regenerates generated/dependencies.rstinc from the .deps.json files of Forge Release builds.

.DESCRIPTION
    A .deps.json file in the build output of Forge.UI lists every NuGet package the build ships,
    with its exact version. The .deps.json files of the Release build of each FHIR version are
    passed to SPDXtoRST (https://github.com/FirelyTeam/SPDXtoRST), which looks up the license of
    each package and writes the rst include file, with a Version column.

    The .deps.json files of the Release builds of the test projects are passed as the UnitTest
    section: packages only the tests use are listed under "For unit testing".

    Licenses are read from the .nuspec files in the local NuGet package cache first, so run this
    script on the machine that made the builds.

    Requires Release builds of Forge for the configurations listed in -Configurations, and the
    .NET SDK to run SPDXtoRST.

.EXAMPLE
    ./tools/Update-Dependencies.ps1

.EXAMPLE
    ./tools/Update-Dependencies.ps1 -ForgePath K:\dev\Firely\Forge -SpdxToRstPath K:\dev\Firely\SPDXtoRST
#>
[CmdletBinding()]
param(
    # Folder of the Forge repository clone that holds the builds.
    [string] $ForgePath = (Join-Path $PSScriptRoot '..\..\Forge'),

    # Build configurations to read, one per FHIR version Forge is released for.
    [string[]] $Configurations = @('ReleaseR3', 'ReleaseR4', 'ReleaseR4B', 'ReleaseR5'),

    # Test projects whose packages are listed under "For unit testing".
    [string[]] $TestProjects = @('Forge.Test.Common', 'Forge.Test.ViewModels'),

    # Folder of the SPDXtoRST project (a clone of FirelyTeam/SPDXtoRST).
    [string] $SpdxToRstPath = (Join-Path $PSScriptRoot '..\..\SPDXtoRST'),

    [string] $OutputFile = (Join-Path $PSScriptRoot '..\generated\dependencies.rstinc'),

    # Forge specific SPDXtoRST config, applied on top of SPDXtoRST's own config.json.
    [string] $ConfigFile = (Join-Path $PSScriptRoot 'dependencies.config.json')
)

$ErrorActionPreference = 'Stop'

$project = Join-Path $SpdxToRstPath 'SPDXtoRST.csproj'
if (-not (Test-Path $project)) {
    throw "SPDXtoRST project not found at '$project'. Clone https://github.com/FirelyTeam/SPDXtoRST or pass -SpdxToRstPath."
}

# Returns the newest <Filter> file of a project build. Forge.UI and Forge.Test.ViewModels name their
# configurations e.g. ReleaseR4, Forge.Test.Common names the same configuration R4Release.
function Find-DepsJson([string] $ProjectName, [string] $Filter, [string] $Configuration) {
    $folders = @($Configuration, ($Configuration -replace '^Release(.+)$', '$1Release')) | Select-Object -Unique |
        ForEach-Object { Join-Path $ForgePath "$ProjectName\bin\$_" }

    $depsJson = Get-ChildItem -Path $folders -Filter $Filter -Recurse -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1

    if (-not $depsJson) {
        throw "No $Filter found for $Configuration under '$ForgePath\$ProjectName\bin'. Build Forge in the $Configuration configuration first."
    }

    Write-Host ("{0,-11} {1,-32} (built {2:yyyy-MM-dd HH:mm})" -f $Configuration, $depsJson.Name, $depsJson.LastWriteTime)
    $depsJson.FullName
}

$files = @(foreach ($configuration in $Configurations) {
    Find-DepsJson 'Forge.UI' 'Forge.UI-*.deps.json' $configuration
})

$testFiles = @(foreach ($testProject in $TestProjects) {
    foreach ($configuration in $Configurations) {
        Find-DepsJson $testProject "$testProject.deps.json" $configuration
    }
})
$sections = @('--section', "UnitTest=$($testFiles -join [IO.Path]::PathSeparator)")

$branch = git -C $ForgePath branch --show-current 2>$null
$commit = git -C $ForgePath log -1 --format='%h %cd' --date=short 2>$null
if ($commit) {
    Write-Host "Forge clone is on '$branch' at $commit. Make sure the builds above are from the release you document."
}

Write-Host 'Running SPDXtoRST...'
$output = [IO.Path]::GetFullPath($OutputFile)
dotnet run --project $project --configuration Release -- @files @sections --config ([IO.Path]::GetFullPath($ConfigFile)) --show-version --output $output
if ($LASTEXITCODE -ne 0) {
    throw "SPDXtoRST failed with exit code $LASTEXITCODE."
}

Write-Host "Updated $output"
