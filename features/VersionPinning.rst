.. _version-pinning:

Versions and Version Pinning
============================

Your project can contain more than one version of the same profile or extension definition, for example when two
versions of a package are installed side by side (see :ref:`managing-package-versions`). This page explains which
version a reference uses, and how you can pin a reference to a specific version.

How references resolve
----------------------

Profiles and extension definitions are referenced by their canonical URL, e.g.
*http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient*. Forge writes such a reference, for example, as
the base profile of a derived profile or as the profile of an extension in your profile.

An **unpinned** reference does not have a version and resolves to the first definition Forge finds, in this order:

1. the FHIR core data types and resources;
2. the files in your project folder;
3. the packages your project depends on, including packages that are installed because another package depends
   on them. When more than one package contains the definition, Forge uses the highest version.

A **pinned** reference has a version after a vertical bar, e.g.
*http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient|3.1.1*. It always resolves to that exact
version, wherever it is found. A shorter version also matches, e.g. *|3.1* matches version 3.1.1.
Version ranges are not supported: a reference such as *...|2.x* or *...|>=2.0.0* matches no version.
If the pinned version is not available in your project, the reference does not resolve. Forge reports it like any
other reference that cannot be resolved, e.g. when generating the snapshot or in Quality Control. Forge never uses
another version instead.

The version in a reference is the version of the profile or extension definition itself, not the version of the
package it comes from. Usually they are the same.

You can type a pinned reference in a canonical field yourself, or let Forge write it when you select a profile or an
extension definition, as described below.

.. note::
  Canonical pinning is not supported in STU3. STU3 defines these references as URIs and does not define a version
  in them, so Forge for STU3 does not write pinned references. A pinned reference that you type yourself does
  resolve in Forge, but other tools do not have to support it.

Selecting a version
-------------------

Two dialogs let you select a version:

- the **Create a new StructureDefinition** dialog, when you create a derived profile (see :ref:`derived-profiles`);
- the **Add Extension** dialog, when you add an extension to your profile (see :ref:`extension-version-pinning`).

Both dialogs show one row per profile or extension definition, however many versions your project contains.
The **Available versions** column lists its versions:

- first the version an unpinned reference resolves to;
- then the other versions in your project folder, highest first;
- then the versions in packages, highest first.

The tooltip of the column shows where each version comes from: the package, or the file in your project folder.
When a row has more than one version, the version an unpinned reference resolves to is marked with
*Used when no version is pinned*. A definition that declares no version is shown as *(no version)*. A definition
from the FHIR core package that declares no version shows the version of the core package in brackets, e.g.
*(3.0.2)*.

When you select a row, the version an unpinned reference resolves to is selected. When the reference can
only resolve with a pinned version (see `The same canonical URL in more than one file`_), the highest version you
can pin is selected. The fields in the details panel describe the selected version.

Pinning a version
-----------------

By default, Forge writes an unpinned reference: the canonical URL without a version. To pin the reference to a
specific version:

1. Select the profile or extension definition.
2. In the details panel, check **Enable version pinning**. It is shown below **Canonical url** in the **Add Extension**
   dialog and below **Base profile** in the **Create a new StructureDefinition** dialog. Forge remembers this setting
   for the next time.
3. The label of the check box changes to **Pin to this version:** and a list of versions appears next to it. Select
   the version. The list shows the versions in the same order and with the same descriptions as the tooltip of the
   **Available versions** column. Versions that declare no version are dimmed and cannot be selected. When there is
   only one version, the list is disabled.
4. Click ``OK``. Forge writes the canonical URL followed by the version.

You can also pin the version that is already used, so that installing a newer version of the package later does not
change what the reference resolves to.

When version pinning is not available
-------------------------------------

Forge does not offer version pinning:

- in STU3;
- for FHIR core structures;
- when you create a profile that is not a derived profile: its base always comes from the FHIR specification;
- when you add an extension to the extension list of a resource: the reference is then stored in
  **Extension.url**, which cannot contain a version. The **Add Extension** dialog explains this below
  **Canonical url**;
- when none of the versions of a definition declares a version.

When some versions of a definition declare a version and the selected one does not, you can check
**Enable version pinning**, but the dialog shows *This definition declares no version, so its version cannot be
pinned.* Select a version in **Pin to this version:**, or click ``OK`` to write an unpinned reference.

The same canonical URL in more than one file
--------------------------------------------

When more than one file in your project folder declares the same canonical URL, an unpinned reference cannot
resolve, because Forge cannot choose between the files. The tooltip of the **Available versions** column names each
file by its path in your project folder.

- If the files declare different versions, Forge checks **Enable version pinning** and you cannot uncheck it for this
  definition. The dialog shows *More than one file in your project declares this canonical URL, so the selected version is
  pinned to keep the reference resolving to one of them.*
- If more than one file declares the selected version, the reference cannot resolve and you cannot click ``OK``.
  The dialog shows *More than one file in your project declares this canonical URL, so this reference cannot
  resolve. Select a version that only one file declares, or remove the duplicate.* When selecting another version
  cannot help, e.g. in STU3, the dialog asks you to remove the duplicate.

Definitions for another FHIR version
------------------------------------

The **FHIR Version** column shows the FHIR release Forge uses for a definition.

- In the **Add Extension** dialog, extension definitions for another FHIR release than your version of Forge are
  shown disabled. Their tooltip explains why, e.g. *This definition is targeting FHIR version R5, which is not
  supported in Forge for R4.*
- In the **Create a new StructureDefinition** dialog, selecting a profile for another FHIR release shows *The
  selected profile is targeting a FHIR version that is incompatible with this application release.* and you cannot
  click ``OK``.

Some packages declare a different FHIR version in their definitions than in the package itself. For example, some
versions of the HL7 extension packages for STU3 and R4 contain extension definitions that declare FHIR version R5.
Forge uses the FHIR version of the package for these definitions, so you can select them. The tooltip of the
**FHIR Version** column shows the difference, e.g. *Declared as R5 in the artifact; hl7.fhir.uv.extensions.r4@1.0.0
targets R4.*
