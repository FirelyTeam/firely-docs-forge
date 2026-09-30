# Forge documentation

Sphinx (reStructuredText) source for the Forge user documentation, published on Read the Docs at https://docs.fire.ly/projects/Forge. Forge is Firely's Windows desktop editor for FHIR profiles; the Forge code lives in a separate repository; this repo is documentation only.

## Layout

- `index.rst` – landing page and top-level toctree.
- `InstallingForge.rst`, `LaunchingForge.rst`, `ManagingForgelicenses.rst`, `LicenseAgreement.rst` – general pages.
- `Features.rst` + `features/*.rst` – feature documentation (profiles, extensions, slicing, constraints, Quality Control, options, Simplifier integration, R4B, ...).
- `ReleaseNotes.rst` – release notes for recent releases (newest first).
- `OldReleaseNotes.rst` – archive of older release notes (newest first), linked from `ReleaseNotes.rst`.
- `Dependencies.rst` includes `generated/dependencies.rstinc` – the NuGet dependency/license tables, generated from the Forge solution.
- `images/` – screenshots referenced by the `.rst` pages.
- `_templates/`, `_static/` – theme overrides (banner, breadcrumbs, CSS). Not part of release updates.
- `conf.py` – Sphinx config (`sphinx_rtd_theme`, intersphinx to other Firely docs); `.readthedocs.yaml` + `requirements.txt` – RTD build.

## Building

- `build.bat` – `sphinx-build -b html . .\_build\html`
- `autobuild.bat` – live preview via `sphinx-autobuild` on http://localhost:7000
- `_build/` is git-ignored. Build locally and check for warnings before opening a PR.

## Release workflow

Every Forge release gets its own branch and PR to `master`:

- Branch name: `update/Forge_<version with dots replaced by underscores>`, e.g. `update/Forge_2026_3_0` for Forge 2026.3.0.
- Versioning is `YYYY.N.P` (e.g. 2025.1.3, 2026.2.0). Releases before 2025 used `NN.N[.N]` (e.g. 32.0.3).
- Typical commits on a release branch (keep them separate and small):
  1. `Updated release notes for <version>` – `ReleaseNotes.rst` (and `OldReleaseNotes.rst` when archiving).
  2. `Updated dependencies` – regenerate `generated/dependencies.rstinc` with `tools/Update-Dependencies.ps1` (see *Dependencies* below); do not hand-edit it.
  3. Feature doc updates in `features/*.rst` for new/changed functionality, with new or refreshed screenshots in `images/`.
  4. Follow-up fixes such as the final SDK version (`Updated SDK version`).

### Gathering release notes from the Forge repository

Release notes are drafted from the commits and pull requests of the Forge source repository (`FirelyTeam/Forge`, local clone `K:\dev\Firely\Forge`), not from Jira.

1. `git fetch` in the Forge clone. Work from `origin/develop`; recent releases are not tagged.
2. The start of the range is the previous release's branch, `release/<previous version>` (e.g. `origin/release/2026.2.0` for 2026.3.0). Everything on that branch shipped in the previous release. Check with `git log origin/develop..origin/release/<previous version>` for commits that exist only on the release branch; when it is empty, its tip is where `develop` continued. The Forge version itself is set in `Forge.Version.props` (`ForgeVersionPrefix`).
3. List what landed since then:
   - everything: `git log --first-parent --format='%h %ad %s' --date=short origin/release/<previous version>..origin/develop`;
   - read each merged PR (`gh pr view <n> --repo FirelyTeam/Forge`), including PRs stacked on feature branches that reach `develop` through another PR's merge (e.g. #294/#295 through #297);
   - read direct commits (no PR) from their message and diff.
4. Read each PR description (`gh pr view <n>`) for the user-visible behavior. PR bodies are very detailed; the release note is one or two sentences in UI terms.
5. Write only what a Forge user notices:
   - Include: new features, changed behavior, bug fixes of behavior that existed in the previous release, SDK/.NET/validator upgrades, changes to the built-in Quality Control rules.
   - Leave out: ADRs, `CLAUDE.md` changes, tests, refactorings, CI/pipeline work, internal build/version tooling, fixes to features that are new in the same release (fold those into the feature's entry), and fixes for regressions introduced during the same release cycle.
   - Before listing a bug fix, check that the bug was in the previous release: compare the fixed code with `origin/release/<previous version>`, and find the commit that introduced it (`git log -S'<buggy line>'`, then `git merge-base --is-ancestor <commit> origin/release/<previous version>`). If that commit is not in the previous release, it is a regression from this cycle and gets no release note.
6. Use the names the UI shows; see *Use Forge UI names* below.
7. Cross-check against the Jira sprint for the release (`project = "FOR" AND sprint = "Forge - 2026.3"`; `FOR` must be quoted in JQL). Sprint tickets without commits on `develop` are not in the release yet; commits whose ticket is outside the sprint need confirming. Ticket descriptions often explain the user-visible effect better than the diff.
8. List anything whose release membership is uncertain (e.g. merged around the previous release date) for the user to confirm.

### Release notes format

Add the new release at the top of `ReleaseNotes.rst`, directly below the `OldReleaseNotes` toctree:

```rst
Release 2026.3.0
----------------
.. important::
  Optional: breaking or notable changes users must be aware of.

Changes
^^^^^^^
* Upgrade to Firely .NET SDK x.y.z.
* ...

Bug fixes
^^^^^^^^^
* ...
```

Conventions:
- Heading underline (`---`) and section underlines (`^^^`) must be at least as long as the title text.
- Only include the `Changes` / `Bug fixes` sections that have content. Other optional sections seen in the past: a feature section (e.g. `R6 Support`) with a `.. note::`.
- The first `Changes` bullet is usually the Firely .NET SDK / .NET upgrade.
- Write bug fixes in past tense describing the faulty behavior ("... was not shown."); changes in present/past tense describing the new behavior.
- Mark UI elements, menu items, dialogs, panels and FHIR resource names in **bold**; file extensions and literal values in *italics*.
- Prefix items that apply to one FHIR version only with **[STU3]**, **[R4]**, **[R4B]**, **[R5]** (or a combination such as **[R4/R4B/R5]**).
- Nested lists need a blank line before and after and a two-space indent.
- Link to other Firely docs via intersphinx, e.g. `` `text <simplifier_docs:package_feeds>`_ ``; external links as `` `text <https://...>`_ ``.
- Whenever a new version is added to `ReleaseNotes.rst`, move the section of the oldest version (the last `Release ...` section at the bottom) to the top of `OldReleaseNotes.rst`, directly below its `Old release notes` title. Move it verbatim (heading, subsections and all bullets), so both files stay ordered newest first and `ReleaseNotes.rst` keeps a constant number of releases.

### Other things to check per release

- `conf.py` `copyright` year when the release is in a new year.
- `InstallingForge.rst` if system requirements (e.g. .NET version) change.
- Feature pages and screenshots for any changed UI mentioned in the release notes.

## Dependencies

`generated/dependencies.rstinc` is generated by [SPDXtoRST](https://github.com/FirelyTeam/SPDXtoRST) from the GitHub SBOMs (SPDX) of Forge and the Firely packages it uses: Simplifier.Bcl, Simplifier.QualityControl and Simplifier.Connect.

- Run `pwsh tools/Update-Dependencies.ps1`. It downloads the SBOMs through the GitHub API (`gh api repos/FirelyTeam/<repo>/dependency-graph/sbom`, the same document as *Insights > Dependency graph > Export SBOM*), unwraps them, and runs SPDXtoRST from a sibling clone (`..\SPDXtoRST`, or `-SpdxToRstPath`).
- Requires `gh` logged in with access to the private FirelyTeam repos, and the .NET 8 runtime.
- All packages in the SBOMs are included, transitive ones too. Simplifier.Bcl has GitHub's Automatic Dependency Submission enabled, so its SBOM also lists its transitive packages. Use `-DirectOnly` to keep only each repository's direct dependencies.
- GitHub's `LicenseRef-github-*` placeholder licenses are cleared, so the license comes from nuget.org or SPDXtoRST's `Config.json`.
- Never edit the generated file by hand. Configure it instead:
  - Forge specific settings go in `tools/dependencies.config.json`, passed to SPDXtoRST with `--config` (e.g. `Hl7.Fhir.R6` is ignored because there is no R6 release of Forge; remove that entry once there is).
  - General settings that apply to every product (e.g. a license missing from nuget.org) go in SPDXtoRST's own `Config.json`.
  - Both use the SPDXtoRST config format; see the SPDXtoRST README. Set `"Ignore": true` to leave a package out.
- The SBOM reflects each repo's default branch (`develop`), so run it once `develop` holds the release's dependencies.

## Use Forge UI names

In release notes and documentation, refer to the UI by the labels and titles Forge actually shows: dialog titles, menu items, buttons, tabs, views, column headers and field labels. Do not use names from Jira tickets, PR descriptions, commit messages or code (e.g. "profile picker", "extension picker", "package manager", "browse row", class or view model names).

- Look the text up in the Forge repository: `Forge.ViewModels/Properties/Resources.resx` holds most labels; the XAML under `Forge.UI` shows where each is used. Drop access-key underscores and shortcut suffixes (`_New Profile...|Ctrl+N` is **New Profile...**).
- Examples: the "profile picker" is the **Create a new StructureDefinition** dialog; the "extension picker" is the **Add Extension** dialog (opened with **Extend...**); the "package manager" is the **Dependencies** tab with its **Installed**, **Public** and **Feeds** views.
- Where the UI has no name for something, describe it in plain words the user can recognize on screen instead of inventing a term.
- Write UI names in **bold**, spelled and capitalized exactly as shown.

## Style

- Files are UTF-8 with BOM in several places (`ReleaseNotes.rst`, `OldReleaseNotes.rst`, `generated/dependencies.rstinc`) and use CRLF line endings; preserve both.
- Keep edits minimal and match the surrounding wording; don't reflow unrelated text.
