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
  2. `Updated dependencies` – regenerate `generated/dependencies.rstinc` from the Forge Release builds with `tools/Update-Dependencies.ps1` (see *Dependencies* below); do not hand-edit it.
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
- Mark UI elements (including buttons and menu items), dialogs, panels and FHIR resource names in **bold**; file extensions and literal values in *italics*. The release notes never use ``code`` style for UI names, unlike the feature pages (see *Use Forge UI names*).
- Prefix items that apply to one FHIR version only with **[STU3]**, **[R4]**, **[R4B]**, **[R5]** (or a combination such as **[R4/R4B/R5]**).
- Nested lists need a blank line before and after and a two-space indent.
- Link to other Firely docs via intersphinx, e.g. `` `text <simplifier_docs:package_feeds>`_ ``; external links as `` `text <https://...>`_ ``.
- Whenever a new version is added to `ReleaseNotes.rst`, move the section of the oldest version (the last `Release ...` section at the bottom) to the top of `OldReleaseNotes.rst`, directly below its `Old release notes` title. Move it verbatim (heading, subsections and all bullets), so both files stay ordered newest first and `ReleaseNotes.rst` keeps a constant number of releases.

### Other things to check per release

- `conf.py` `copyright` year when the release is in a new year.
- `InstallingForge.rst` if system requirements (e.g. .NET version) change.
- Feature pages and screenshots for any changed UI mentioned in the release notes.

## Dependencies

`generated/dependencies.rstinc` is generated by [SPDXtoRST](https://github.com/FirelyTeam/SPDXtoRST) from the `.deps.json` files of the Forge Release builds. A `.deps.json` lists every NuGet package the build ships, with its exact version, so the list shows what Forge actually installs, including what the Firely libraries (Simplifier.*, Firely SDK) bring in.

- Build the Forge solution (Forge repository, local clone `..\Forge`) in the `ReleaseR3`, `ReleaseR4`, `ReleaseR4B` and `ReleaseR5` configurations, from the commit being released. Build the whole solution, so the test projects are built too.
- Run `pwsh tools/Update-Dependencies.ps1` on the machine that made the builds. It prints the date of each build and the branch and commit of the Forge clone; check they match the release. It then runs SPDXtoRST from a sibling clone (`..\SPDXtoRST`, or `-SpdxToRstPath`) with `--show-version`, which adds a **Version** column.
- The `.deps.json` files of the test projects (`Forge.Test.Common`, `Forge.Test.ViewModels`) are passed with `--section UnitTest=…`: packages only the tests use are listed under *For unit testing*.
- Licenses are read from the `.nuspec` of the exact version in the local NuGet package cache first, then from nuget.org, so the license matches the version Forge ships.
- Private packages (not on nuget.org, e.g. Simplifier.*) and packages without files in the output (meta packages, packages provided by .NET itself) are not listed.
- The `runtime.*` packages (platform-specific native parts of packages that are listed, e.g. `System.Data.SqlClient`) are ignored in the Forge config.
- Requires the .NET SDK (8 or later, to build SPDXtoRST with `dotnet run`) and the .NET 8 runtime (to run it), and an SPDXtoRST version with `.deps.json`, `--config` and `--section` support (FirelyTeam/SPDXtoRST#1).
- Never edit the generated file by hand. Configure it instead:
  - Forge specific settings go in `tools/dependencies.config.json`, passed to SPDXtoRST with `--config` (e.g. `Hl7.Fhir.R6` is ignored because there is no R6 release of Forge; remove that entry once there is).
  - General settings that apply to every product (e.g. a license missing from nuget.org) go in SPDXtoRST's own `Config.json`.
  - Both use the SPDXtoRST config format; see the SPDXtoRST README. Set `"Ignore": true` to leave a package out.

## Use Forge UI names

In release notes and documentation, refer to the UI by the labels and titles Forge actually shows: dialog titles, menu items, buttons, tabs, views, column headers and field labels. Do not use names from Jira tickets, PR descriptions, commit messages or code (e.g. "profile picker", "extension picker", "package manager", "browse row", class or view model names).

- Look the text up in the Forge repository: `Forge.ViewModels/Properties/Resources.resx` holds most labels; the XAML under `Forge.UI` shows where each is used. Drop access-key underscores and shortcut suffixes (`_New Profile...|Ctrl+N` is **New Profile...**).
- Examples: the "profile picker" is the **Create a new StructureDefinition** dialog; the "extension picker" is the **Add Extension** dialog (opened with ``Extend...``); the "package manager" is the ``Dependencies`` tab with its ``Installed``, ``Public`` and ``Feeds`` views.
- Where the UI has no name for something, describe it in plain words the user can recognize on screen instead of inventing a term.
- Spell and capitalize UI names exactly as shown. In the feature pages (`features/*.rst`), the markup depends on what the name is:
  - ``code`` style for things you click or choose: buttons, menu items, menus, tabs and views, e.g. click ``OK``, click ``Extend...``, the ``Dependencies`` tab, the ``Public`` view, the ``Options`` menu.
  - **bold** for named parts of the window and for values: dialogs, panels, fields, options and check boxes, columns, toolbars and statuses, and values you select or type, e.g. the **Add Extension** dialog, the **Element Properties** panel, the **Search** field, **Enable version pinning**, the **Available versions** column, **hl7.fhir.us.core**, and keyboard shortcuts such as **Ctrl+N**. Choices that are the values of an option stay bold even when the same choice is also a menu item, e.g. **When Constrained** (a value in the **Show element properties details** drop-down list and a command in the ``Options`` menu).
  - In the release notes, all UI names are **bold** (see *Release notes format*).

## Style

- Files are UTF-8 with BOM in several places (`ReleaseNotes.rst`, `OldReleaseNotes.rst`, `generated/dependencies.rstinc`) and use CRLF line endings; preserve both.
- Keep edits minimal and match the surrounding wording; don't reflow unrelated text.
