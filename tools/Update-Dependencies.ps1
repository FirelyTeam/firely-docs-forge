<#
.SYNOPSIS
    Regenerates generated/dependencies.rstinc from the GitHub SBOMs of Forge and the Firely packages it uses.

.DESCRIPTION
    Downloads the SPDX SBOM of each repository through the GitHub REST API
    (GET /repos/{owner}/{repo}/dependency-graph/sbom), which returns the same document as
    Insights > Dependency graph > Export SBOM, wrapped in an "sbom" property.

    Each SBOM is unwrapped. By default all packages it lists are kept, including the transitive
    dependencies listed by repositories with GitHub's Automatic Dependency Submission enabled
    (e.g. Simplifier.Bcl). With -DirectOnly, each SBOM is reduced to the direct dependencies of
    the repository: the packages the root package DEPENDS_ON.

    The SBOM files are then passed to SPDXtoRST (https://github.com/FirelyTeam/SPDXtoRST),
    which writes the rst include file.

    Requires the GitHub CLI (gh), logged in with access to the FirelyTeam repositories, and the
    .NET SDK to run SPDXtoRST.

.EXAMPLE
    ./tools/Update-Dependencies.ps1

.EXAMPLE
    ./tools/Update-Dependencies.ps1 -SbomDirectory K:\Dependencies\2026.3.0 -SpdxToRstPath K:\dev\Firely\SPDXtoRST
#>
[CmdletBinding()]
param(
    # Repositories to read SBOMs from, in the order they are passed to SPDXtoRST.
    [string[]] $Repositories = @('Forge', 'Simplifier.Bcl', 'Simplifier.QualityControl', 'Simplifier.Connect'),

    [string] $Owner = 'FirelyTeam',

    # Folder of the SPDXtoRST project (a clone of FirelyTeam/SPDXtoRST).
    [string] $SpdxToRstPath = (Join-Path $PSScriptRoot '..\..\SPDXtoRST'),

    # Where the downloaded SBOM files are kept. Defaults to a temporary folder.
    [string] $SbomDirectory = (Join-Path ([IO.Path]::GetTempPath()) 'forge-sbom'),

    [string] $OutputFile = (Join-Path $PSScriptRoot '..\generated\dependencies.rstinc'),

    # Forge specific SPDXtoRST config, applied on top of SPDXtoRST's own config.json.
    [string] $ConfigFile = (Join-Path $PSScriptRoot 'dependencies.config.json'),

    # Keep only the direct dependencies of each repository and leave out transitive ones.
    [switch] $DirectOnly
)

$ErrorActionPreference = 'Stop'

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw 'The GitHub CLI (gh) is required. See https://cli.github.com.'
}

$project = Join-Path $SpdxToRstPath 'SPDXtoRST.csproj'
if (-not (Test-Path $project)) {
    throw "SPDXtoRST project not found at '$project'. Clone https://github.com/$Owner/SPDXtoRST or pass -SpdxToRstPath."
}

New-Item -ItemType Directory -Force $SbomDirectory | Out-Null

$files = foreach ($repository in $Repositories) {
    Write-Host "Downloading SBOM of $Owner/$repository..."

    $json = gh api "repos/$Owner/$repository/dependency-graph/sbom"
    if ($LASTEXITCODE -ne 0) {
        throw "Could not download the SBOM of $Owner/$repository."
    }

    $sbom = ($json | ConvertFrom-Json -Depth 100).sbom

    if ($DirectOnly) {
        $root = ($sbom.relationships | Where-Object relationshipType -eq 'DESCRIBES' | Select-Object -First 1).relatedSpdxElement
        $direct = @($sbom.relationships |
            Where-Object { $_.relationshipType -eq 'DEPENDS_ON' -and $_.spdxElementId -eq $root } |
            ForEach-Object relatedSpdxElement)

        $total = $sbom.packages.Count
        $sbom.packages = @($sbom.packages | Where-Object { $_.SPDXID -eq $root -or $direct -contains $_.SPDXID })
        $sbom.relationships = @($sbom.relationships | Where-Object { $_.spdxElementId -eq $root })

        if ($sbom.packages.Count -lt $total) {
            Write-Host "  Kept $($sbom.packages.Count - 1) direct dependencies, skipped $($total - $sbom.packages.Count) transitive ones."
        }
    }

    # GitHub fills in LicenseRef-github-* placeholders (e.g. LicenseRef-github-OTHER) where it found no
    # SPDX license. Clear them so SPDXtoRST falls back to nuget metadata and Config.json, as for the
    # SBOMs exported from the UI before GitHub added these placeholders.
    foreach ($package in $sbom.packages) {
        if ($package.licenseConcluded -like 'LicenseRef-github-*') {
            $package.PSObject.Properties.Remove('licenseConcluded')
        }
    }

    $file = Join-Path $SbomDirectory "$repository.json"
    $sbom | ConvertTo-Json -Depth 100 | Set-Content -Path $file -Encoding utf8NoBOM
    $file
}

Write-Host 'Running SPDXtoRST...'
$output = [IO.Path]::GetFullPath($OutputFile)
dotnet run --project $project --configuration Release -- @files --config ([IO.Path]::GetFullPath($ConfigFile)) --output $output
if ($LASTEXITCODE -ne 0) {
    throw "SPDXtoRST failed with exit code $LASTEXITCODE."
}

Write-Host "Updated $output"
