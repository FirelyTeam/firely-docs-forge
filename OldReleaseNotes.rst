.. _old-release-notes:

Old release notes
=================

Release 28.0
------------
Changes
^^^^^^^
* Upgrade to Firely .NET SDK 3.8.1.
* Added support for synchronizing project files with Simplifier.net.
  Removed Import from/Publish to Simplifer.net/FHIR Server.
* Improved performance

  - opening/closing files
  - switching between tabs/documents
  - editing with many documents opened
  - editing profiles with many nested sections
* Added support for multi selection in the project list for opening multiple files.
* Added Reload/Save/Close All commands to the project context menu in the session bar.
* Improved visual feedback for resources that cannot be opened.
* The creation of modifier extensions is now possible.
* The default path value for Discriminator type pattern is now set to $this.
  Added $this and resolve() to the path dropdown list.
* The Initialize global mappings option is now turned off by default.
* Removed the shortcut option for adding fixing system and codes.
* Moved release notes to https://docs.fire.ly/.

Bug fixes
^^^^^^^^^
* Fixed various minor UI styling issues.
* If a logical model violates sdf-1, Forge does not open the file. Illegal slicing elements are now removed.
* Adding Extensions in Forge doesn't show the cardinality.
* Forge gives errors when creating polymorphic elements in logical models.
* Derived profile contains wrong Min cardinality even though it was not changed in regards to the base profile.
* When creating an extension and limiting the value[x] the comment: "A stream of bytes, base64 encoded" is shown.
* Missing invariant check txt-2 on Narrative.div.
* Forge adds unexplainable slicing details in the differential.
* Snapshot generator removes or ommits an extension when the element type has a custom profile.
* After slicing a choice element and saving it, the names of the slices are reset to "no name" after reloading.
* You could open the same project folder multiple times.
* The project list view was not updated after creating a new Search Parameter or Operation Definition resource.
* **[STU3]** Not possible to create/edit Logical Models in Forge 27.3.1.
* **[R4-R5]** Extensions don't show in what context they are supposed to be used
* **[R4-R5]** Forge allows definition of default values in Profiles. Constraint sdf-21 is now enforced.

Release 27.3.1
--------------
Bug fixes
^^^^^^^^^
* Forge prerequisite check did not take .NET 5 updates into account.

Release 27.3
------------
R4B Support
^^^^^^^^^^^
The first release of Forge for FHIR R4B. This alpha release is based on FHIR 
preview release 4.1.0, which is part of the FHIR R4B version range.

.. note::
  Please note that as both the FHIR version and this Forge alpha version are 
  far from definitive, Forge 27.3 alpha may or may not contain unexpected errors 
  and missing functionality.

There is experimental support for migrating R4 profiles to R4B.

Changes
^^^^^^^
* Upgrade to Firely .NET SDK 3.4.0.
* Upgrade to .NET 5.

Bug fixes
^^^^^^^^^
* Faulty slicing behaviour in extension.
* Extension misplacement.
* Forge not enforcing slicing rules element.
* StructureDefinition.name regex should be warning only.
  This was already a warning but the tooltip suggested that it was an error. Changed tooltip title to "Validation messages:".
* Index was out of range error when saving profile.
* Forge now calculates the minimum cardinality for extension arrays.
  Note that in order to update your existing profiles in this regard you need to open and then save a profile again. 
* Removed "New Implementation Guide" menu option (feature was not supported anyway).
* **[R4-R5]** Forge cannot extend choice[x] elements.

Release 27.1
------------
Changes
^^^^^^^
* New user interface styling.
* Upgrade to Firely .NET SDK 3.2.0.
* Forge is now compatible with the latest version of Firely Terminal regarding package cache and 
  resolving canonicals in dependencies.
* The filter option for the Extend element dialog has been moved to the toolbar.

Bug fixes
^^^^^^^^^
* Some user interface elements did not scale properly when the font size was changed.

Release 26.1
------------
Changes
^^^^^^^
* Upgrade to Firely .NET SDK 2.0.1.
* 'Must support' is now possible on Extension definitions and their element definitions.

Bug fixes
^^^^^^^^^
* If you had profiled any of the common resource elements (e.g. id, meta) those elements would not show up on top of the XML/JSON.
* Extending elements now show up in the right order.
* **[STU3]** In some edge cases, elements would be duplicated. This is no longer the case.
* **[R4-R5]** Logical models with an empty root type can now be opened.

Release 25.1
------------
Changes
^^^^^^^
* Core extensions are no longer included in profiled elements.
* Manually added extensions to ElementDefinition or its children are retained.
* The 'FHIR version' profile field is now editable. For new profiles, it is initialized to 4.0.1 (R4) or 3.0.2 (STU3) (but can thus be changed).
* For profiles containing 'versioned' references (http://a.org/b|x.y.z), the version is now ignored when resolving the dependency.
* **[STU3]** When opening a profile for a deprecated FHIR version, you now have the option to leave the version unchanged.

Bug fixes
^^^^^^^^^
* Invalid package versions do not lead to unstable behavior anymore
* Additional slices would inadvertantly copy info from an existing slice
* The XML order of extension definitions within a slice was wrong and has been corrected
* **[R4-R5]** Removed duplicate 'Type(s)' in Element Property

Release 24.2
------------

R5 Support
^^^^^^^^^^
The first release of Forge for FHIR R5 on April 7, 2020. This alpha release is 
based on FHIR preview release 4.2.0, which is part of the FHIR R5 version range

.. note::
  Please note that as both the FHIR version and this Forge alpha version are 
  far from definitive, Forge 24.2 alpha may or may not contain unexpected errors 
  and missing functionality.

Changes
^^^^^^^
* A link has been added pointing to your portal page on Simplifier.net (in the menu under your profile picture)
* **[R4]** Forge would inherit normative extensions from the FHIR specification. Although formally correct, inheritance has been disabled for now
  Extensions in existing profiles can be removed by opening and then saving the profile.

Bug fixes
^^^^^^^^^
* Unjustified message 'Cannot further constrain a fixed value that is defined in a base profile' when using an extension in a profile has been removed.
* Forge no longer reports an error when FHIR Core extensions are referenced.
* Selecting particular extension contexts in Forge 24.1 would lead to some nasty errors, which have been corrected.
* FHIR path expressions in JSON or XML now contain 'or' instead of the faulty '|' as a logical operator.
* Preview packages now show up again in the package search.
* **[STU3]** Upon creating a subsequent slice, Forge would inadvertedly copy values from the existing slice .

Release 24.1
------------
Updating to .NET API 1.5, which incorporates the technical correction in FHIR release 4.0.1 (R4) or 3.0.2 (STU3).

Changes
^^^^^^^
* Opening and editing FHIR 4.0.1 (R4) and 3.0.2 (STU3) profiles is now possible.
* New profiles are automatically FHIR 4.0.1 (R4) and 3.0.2 (STU3) profiles.
* **[STU3]** Forge now retains manually added extensions to a profile.
* **[R4]** Restored the slicing header element for sliced elements of type value[x], since implicit slicing
  is not supported by other tools (yet).

Bug fixes
^^^^^^^^^
* Forge is signed with a renewed certificate.
* Edited cardinality on a type slice would not be loaded from a profile correctly.
* Any overridden slicing detail would remove all remaining slicing details.

Release 24.0 
------------
This Sydney 2020 Edition release introduces a tighter coupling with Simplifier.net, simplifying the way Forge integrates with Simplifier.net.

Changes
^^^^^^^
* The new Forge license makes the new pricing model official, differentiating between paid license plans 
  and Forge Community Edition, which remains free for non-commercial use.
* You now log in to Simplifier.net when you start Forge. The separate logins for import/export from/to
  Simplifier.net are removed.
* Incompatible packages are omitted from the package result list. Package versions implementing a FHIR 
  version not supported by Forge can not be added anymore.
* A package search without results now clears the result list.
* Clickthrough on resource warnings (bottom pane) is restored.

Forge 23.0 for R4 - Fall 2019 Edition
-------------------------------------
This is a stability release that fixes a couple of issues in the previous release.
We recommend all our customers to install this update.

Dependencies
^^^^^^^^^^^^

* FHIR API


  Update to .NET API 1.4.0 for FHIR R4 (official build)
  Provides bug fixes for the Snapshot Generator:

  - #1116 initialize [...].extension.url fixed value, if missing
  - #1123 ElementDefinition.base empty for contentReference children

Changes
^^^^^^^

* IMPORTANT! Update to Forge End User License Agreement

  To ensure continuity of Forge, we decided to make Forge part of the paid plans on Simplifier.
  On January 1st, 2020, we will issue a new license for Forge, replacing the current license.
  Forge will remain free for non-commercial use.
  Commercial use of Forge will be linked to the Simplifier pricing plans,
  which also give access to our support team and advanced features on Simplifier.
  Starting with the next release, Forge will require you to sign in to Simplifier with your personal user account,
  with a grace period to allow for offline usage.
  We are updating our Privacy Policy per Nov 1, 2019 to reflect that we are logging this contact.

  Visit our Firely company blog to read about our new licensing terms:
  https://blog.fire.ly/2019/10/03/securing-the-future-of-forge/

* Update Simplifier integration
  The Import from / Publish to Simplifier commands have been updated to support the latest Simplifier API.
  Simplifier now also provides a FHIR R4 compatible API endpoint, enabling the integration features in Forge R4.

* Fix common errors
  Forge tries to automatically correct some known profile errors during load,
  especially in extension definitions (details below).
  You may notice subtle differences when opening and immediately saving back a profile to disk.


Bug fixes
^^^^^^^^^

* FOR-196 Ctrl+C on validation warning may cause freeze
  Some users reported that copying a validation message to the clipboard would freeze the application,
  possibly because the Clipboard was unavailable. Forge now catches unexpected exceptions while copying.

* FOR-316 Expand elements with complex types
  In some circumstances, the previous release would not always expand children of elements with a complex type.
  For example, Forge would not expand children of Extension.extension.value[x] when constrained to CodeableConcept.
  This was caused by (overly) aggressive cycle detection, which is required to prevent infinite recursion.
  The cycle detection logic has been improved to allow child element expansion whenever applicable.
  Also, Forge now dynamically expands the child elements of a type choice element ("value[x]") when constrained
  to a single complex type - unless the type choice element is (type) sliced.

* FOR-332 Show all element properties for closed slice
  Forge no longer hides some element properties for a sliced element with Slicing.Rules = closed

* FOR-334 Do not show extension definition selector for complex extension child elements
  For profile extension elements that reference an external extension definition,
  instead of a list of element types (fixed to Extension), Forge displays a command button
  that allows you to quickly open the target extension definition for editing.
  Forge now hides the Open... button for complex extension child elements (type.profile is empty),
  as you cannot directly open a single child element of a structure.
  The Open... button is only visible on the root element of the referenced external extension.

* FOR-335 Forge sometimes does not rename choice type elements when constrained?
  This issue has been solved by #1123 (ElementDefinition.base empty for contentReference children)

* FOR-337 StructureDefinition.type is editable for logical models
  For constraining profiles and extension definitions, Forge auto-generates a read-only structure type code.
  However for logical models, StructureDefinition.type should specify a fully-qualified Uri
  that uniquely identifies the logical type (similar to canonical url).
  Forge now exposes the structure type property of a logical model as an editable TextBox control,
  allowing the author to specify and modify the custom logical type Uri.
  By convention, the last segment of the type Uri should match the name of the root element,
  otherwise Forge will generate a warning.

* FOR-339 Generate fixedUri for Extension.url (instead of fixedString)
  Extension.url elements are automatically generated by Forge and invisible in the UI.
  The previous 22.1 release introduced a bug where Forge would incorrectly generate Extension.url
  elements with a fixed value of the wrong type (fixedString instead of fixedUri).
  This has now been fixed. Forge will also try to auto-correct invalid input, i.e.
  convert existing fixedString properties on Extension.url elements to fixedUri.

  Note: The core spec defines the Extension.url element with system type "xsd:string".
  Actually, the element value represents an Uri. However, this is "hard coded" knowledge
  that cannot be programatically derived from the core type definitions.
  FHIR R4 Technical Correction will address this issue by introducing improved system types declarations.

* FOR-342 Hide SliceName property for type slice entry element
  Only show the SliceName property for the actual type slices of type choice element ('[x]').
  Forge will automatically generate standard sliceName when slice is constrained to a single datatype (`valueString').
  Always hide the SliceName property for the original '[x]' element (even if constrained to a single type),
  to prevent the author from inadvertently specifying a sliceName on the slice entry element itself.

* FOR-344 sliced element can't be unsliced when cardinality is set to 0..0
  Forge would prevent you from unslicing a sliced element if maximum cardinality is constrained to 0.
  This has been fixed.


Forge 23.0 for STU3 - Fall 2019 Edition
---------------------------------------
This release is a major update with new features, improvements and important bug fixes.
We recommend all users to update to this release.

Dependencies
^^^^^^^^^^^^

* FHIR API


  Update to FHIR STU3 .NET API 1.4.0
  Provides a number of bug fixes and improvements:

  - #1069 Fix incorrect base for profile extension root element
  - #1090 SnapshotGenerator supports Logical Models
  - #1101 Handle element constraint without a path
  - #1116 initialize [...].extension.url fixed value, if missing
  - #1123 ElementDefinition.base empty for contentReference children

Changes
^^^^^^^

* IMPORTANT! Update to Forge End User License Agreement

  To ensure continuity of Forge, we decided to make Forge part of the paid plans on Simplifier.
  On January 1st, 2020, we will issue a new license for Forge, replacing the current license.
  Forge will remain free for non-commercial use.
  Commercial use of Forge will be linked to the Simplifier pricing plans,
  which also give access to our support team and advanced features on Simplifier.
  Starting with the next release, Forge will require you to sign in to Simplifier with your personal user account,
  with a grace period to allow for offline usage.
  We are updating our Privacy Policy per Nov 1, 2019 to reflect that we are logging this contact.

  Visit our Firely company blog to read about our new licensing terms:
  https://blog.fire.ly/2019/10/03/securing-the-future-of-forge/

* Copy global mappings
  The configuration option "Copy global mappings" is now enabled by default.
  This option affects newly created profiles.
  Enabled: initialize new profiles by copying global mappings over from selected base profile
  Disabled: new profiles are initialized with empty global mappings

* Serialize Logical Model to differential component
  After some discussion within the community, we have changed the serialization of logical models in Forge,
  in order to harmonize the behavior of different kinds of StructureDefinitions.
  Previous Forge releases would serialize logical model constraints to the StructureDefinition.snapshot component.
  As of this release, Forge will now serialize logical models to the StructureDefinition.differential component,
  similar to regular resource profiles. This allows a FHIR API to generate (calculate) the snapshot component
  of the logical model, based on the author-specified constraints included in the differential component and by
  resolving any referenced external structures, again similar to regular resource profiles.

* Update Simplifier integration
  The Import from / Publish to Simplifier commands have been updated to support the latest Simplifier API.

Improvements
^^^^^^^^^^^^

* Improved rendering of named slices
  The rendering of named slices has been updated, similar to the official FHIR website & build tool.
  The element tree now displays named slices as "elementName:sliceName", to clearly indicate slice groups.
  This also affects extension elements, which are now displayed as "extension:sliceName".
  
* Save dialog: select output serialization format (XML or JSON)
  The Save dialogs now provide distinct file type selection options (XML or JSON).
  Saving an existing profile to a different serialization format will automatically create a separate copy;
  the active document will still refer to the original file with the original format.

  Note: when opening a Folder, the user can select a preferred serialization format (XML or JSON).
  In case a project folder contains duplicates of the same profile in different serialization formats, then
  Forge will only resolve and display the version with the preferred format and ignore/exclude all other versions.
  Generally, it is recommended to use a single serialization format per project.

* Show package versions in descending order
  The Package Manager shows a drop-down combobox with the available versions for each package.
  The package versions are now sorted in descending order, with the highest (latest) version on top.

Bug fixes
^^^^^^^^^

* Fix application freezes/hangs after Save
  In some circumstances, the application could freeze/hang after saving a profile.
  This was caused by infinite recursion in broken cache invalidation logic.
  The relevant cache invalidation logic has been completely rewritten and optimized.
  Save operations more efficient, faster and no longer cause deadlocks.

* Fix copy to clipboard crash
  In some circumstances, when copying the message of a popup (error) dialog to the clipboard
  (using Ctrl+C), the application could crash with an unhandled runtime exception.
  This has been fixed.

* FOR-196 Ctrl+C on validation warning may cause freeze
  Some users reported that copying a validation message to the clipboard would freeze the application,
  possibly because the Clipboard was unavailable. Forge now catches unexpected exceptions while copying.

* FOR-316 Expand elements with complex types
  In some circumstances, the previous release would not always expand children of elements with a complex type.
  For example, Forge would not expand children of Extension.extension.value[x] when constrained to CodeableConcept.
  This was caused by (overly) aggressive cycle detection, which is required to prevent infinite recursion.
  The cycle detection logic has been improved to allow child element expansion whenever applicable.

* FOR-332 Show all element properties for closed slice
  Forge no longer hides some element properties for a sliced element with Slicing.Rules = closed

* FOR-333 Validate slicing components during load
  Forge would not validate the ElementDefinition.slicing component nor report violations during load,
  e.g. when the mandatory Slicing.rules property is empty. This has been fixed.
  Forge now explicitly validates slicing components and reports validation errors during load.

* FOR-335 Forge sometimes does not rename choice type elements when constrained?
  This issue has been solved by #1123 (ElementDefinition.base empty for contentReference children)

* FOR-344 sliced element can't be unsliced when cardinality is set to 0..0
  Forge would prevent you from unslicing a sliced element if maximum cardinality is constrained to 0.
  This has been fixed.

Forge 22.1 for R4 - Atlanta 2019 Edition
----------------------------------------
This release is a major update with important improvements to conformancy,
including a significant revision of type slicing according to the new R4 behavior.

Dependencies
^^^^^^^^^^^^

* FHIR API

  Update to FHIR .NET API 1.4.0-forge4 (internal build)
  Provides a number of bug fixes and improvements, especially for the Snapshot Generator:

  - #1074 Derive implicit type constraint from renamed choice type element.
    Example: "valueString" implies element type constrained to String
  - #1051 Normalize type slices in snapshot
    Transform renamed choice type elements ("valueString") in differential
    to fully expanded type slice ("value[x]:valueString") in snapshot
    (generated snapshot will never contain renamed elements, making it easier to process & compare)
  - #1051 Generate default Slicing component for slice entry of type slice to snapshot, even if missing from differential
  - #1051 Initialize default sliceNames for renamed choice type elements, if missing from differential
    Example: value[x] constrained to "Quantity" implies sliceName "valueQuantity"
  - #1051 Fix incorrect expansion of resliced elements
  - #1051 Implement official HL7 FHIR Snapshot Generator unit tests
    https://github.com/hapifhir/org.hl7.fhir.core/tree/master/org.hl7.fhir.r5/src/test/resources/snapshot-generation
  - #1052 Initialize ElementDefinition.constraint.source
  - #1067 Fix incorrect base for profile extension root element
  - #1090 SnapshotGenerator supports Logical Models
  - #1101 Handle element constraint without a path

Improvements
^^^^^^^^^^^^

* Improved rendering of named slices
  The rendering of named slices has been updated, similar to the official FHIR website & build tool.
  The element tree now displays named slices as "elementName:sliceName", to clearly indicate slice groups.
  Type slices only display the slice name ("valueString"), not the original choice type element name ("value[x]"),
  as the common element name prefix ("value") already indicates the slice group.

* Save dialog: select output serialization format (XML or JSON)
  The Save dialogs now provide distinct file type selection options (XML or JSON).
  Saving an existing profile to a different serialization format will automatically create a separate copy;
  the active document will still refer to the original file with the original format.

  Note: when opening a Folder, the user can select a preferred serialization format (XML or JSON).
  In case a project folder contains duplicates of the same profile in different serialization formats, then
  Forge will only resolve and display the version with the preferred format and ignore/exclude all other versions.
  Generally, it is recommended to use a single serialization format per project.

* Copy global mappings
  The configuration option "Copy global mappings" is now enabled by default.
  This option affects newly created profiles.
  Enabled: initialize new profiles by copying global mappings over from selected base profile
  Disabled: new profiles are initialized with empty global mappings

* Serialize Logical Model to differential component
  After some discussion within the community, we have changed the serialization of logical models in Forge,
  in order to harmonize the behavior of different kinds of StructureDefinitions.
  Previous Forge releases would serialize logical model constraints to the StructureDefinition.snapshot component.
  As of this release, Forge will now serialize logical models to the StructureDefinition.differential component,
  similar to regular resource profiles. This allows a FHIR API to generate (calculate) the snapshot component
  of the logical model, based on the author-specified constraints included in the differential component and by
  resolving any referenced external structures, again similar to regular resource profiles.

* Show package versions in descending order
  The Package Manager shows a drop-down combobox with the available versions for each package.
  The package versions are now sorted in descending order, with the highest (latest) version on top.

Bug fixes
^^^^^^^^^

* Generate Extension.url element for Extension definitions
  Fixed a bug that caused the Extension.url element definition to be omitted from the generated differential component.
  Forge now always ensures that the Extension.url element is in sync with StructureDefinition.url and included in the output.
  When opening an existing extension definition, Forge will automatically fix missing/invalid Extension.url element.
  Note: this bug was caused by a subtle change in the FHIR spec that broke some existing application logic.
  Originally, in STU3, the Extension.url element was defined with type Uri.
  In FHIR R4, the Extension.url element type is now specified using special "compiler magic" extensions.
  (because Extension.url is not a complex FHIR Uri, but a plain Uri string that does not allow extensions)

* Improve compliancy for type slicing in FHIR R4
  FHIR R4 introduces new behavior and rules for type slicing.
  This version improves compliancy of type slicing according to new R4 rules.
  For more details, see the FHIR API change log above.

* Fix application freezes/hangs after Save
  In some circumstances, the application could freeze/hang after saving a profile.
  This was caused by infinite recursion in broken cache invalidation logic.
  The relevant cache invalidation logic has been completely rewritten and optimized.
  Save operations more efficient, faster and no longer cause deadlocks.

* Fix constraint detection (yellow pen)
  The logic to aggregate element constraints was not working properly. In some circumstances, this would
  prevent the yellow pen from showing and exclude elements from the output that should be included.
  For example, if a derived profile introduces constraints on child elements of a named slice that is
  inherited from the base profile, then Forge would incorrectly exclude the parent slice from the output.
  This has now been fixed. Named parent slices of constrained elements are always included in the output.

* Fix sdf-0
  Fixed invariant sdf-0 for validating StructureDefinition.Name to also accept underscore characters ("_")

* Fix eld-19
  Fixed invariant eld-19 for validating element names (in logical models)


Forge 22.0 for R4 - Redmond 2019 Edition
----------------------------------------
This release is a minor update with some usability & stability improvements.

Dependencies
^^^^^^^^^^^^

* FHIR API
  Update to FHIR .NET API 1.3.0-alpha-20190604-4
  Provides a number of bug fixes and improvements

Bug fixes
^^^^^^^^^

* Fix lookup list for Identifier.system and Coding.system
  When moving focus away after change, the drop-down combobox control no longer clears the property value.

* Type slicing: do not rename slicing introduction element
  Forge only renames named slices of a type slice element, constrained to a single type.
  Forge no longer renames the original type slice element, even if constrained to a single type.
  Note: In R4, the original ("[x]") type slice element may specify constraints on the list of allowed types.

* Type slicing: do not initialize default discriminator when slicing description is specified
  When slicing a choice type ("[x]") element, Forge will automatically initialize the default discriminator,
  but only if both the discriminator and the slicing description are empty.

* Type slicing: fix child extension on named type slice
  Fix a bug where Forge would mangle the element path of a profile extension element that is a direct child
  of a type slice constraint with a renamed path, e.g. Observation.effectiveDatetime.extension instead of
  Observation.effective[x].extension

* Show Reference type properties also for type Canonical
  Show the Type.TargetProfiles, Type.Aggregation & Type.Versioning properties when Type.Code equals "Canonical"
  Note: these properties only apply to reference types. Forge hides these properties for non-reference types.
  FHIR R4 introduces the new Canonical type, representing a reference to a conformance resource based on the canonical url.

* Exclude core extensions on ElementDefinition from output
  Special extensions on ElementDefinition as specified on the core resource and type profiles,
  such as http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable,
  are no longer included in the generated output.
  Note: extensions on ElementDefinition itself are not visible in the user interface.
  We are considering implementing support for a limited set of well-known core extensions
  on ElementDefinition and StructureDefinition in a future release.

* Invalidate extension context after save
  The Add Extension dialog would not detect updates to the context of an extension definition
  after saving changes to disk, due to aggressive caching. This has now been fixed.
  Note: DirectorySource.Refresh() now also invalidates the ArtifactSummary of modified files

* Allow selection of read-only text
  You can now select and copy the content of a read-only TextBox control.

* Package Manager: improved error handling


Forge 22.0 for STU3 - Redmond 2019 Edition
------------------------------------------

Dependencies
^^^^^^^^^^^^

* FHIR API
  Update to FHIR .NET API 1.3.0-alpha-20190604-4
  Provides a number of bug fixes and improvements

Bug fixes
^^^^^^^^^

* Fix lookup list for Identifier.system and Coding.system
  When moving focus away after change, the drop-down combobox control no longer clears the property value.

* Type slicing: do not initialize default discriminator when slicing description is specified
  When slicing a choice type ("[x]") element, Forge will automatically initialize the default discriminator,
  but only if both the discriminator and the slicing description are empty.

* Exclude core extensions on ElementDefinition from output
  Special extensions on ElementDefinition as specified on the core resource and type profiles,
  such as http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable,
  are no longer included in the generated output.
  Note: extensions on ElementDefinition itself are not visible in the user interface.
  We are considering implementing support for a limited set of well-known core extensions
  on ElementDefinition and StructureDefinition in a future release.

* Invalidate extension context after save
  The Add Extension dialog would not detect updates to the context of an extension definition
  after saving changes to disk, due to aggressive caching. This has now been fixed.
  Note: DirectorySource.Refresh() now also invalidates the ArtifactSummary of modified files

* Allow selection of read-only text
  You can now select and copy the content of a read-only TextBox control.

* Package Manager: improved error handling


Forge 21.0 for R4 - Montreal 2019 Edition
-----------------------------------------
A major new release introducing support for FHIR R4!
Supports the same feature set as earlier Forge releases, updated to support FHIR R4.

Release information
^^^^^^^^^^^^^^^^^^^

We publish separate Forge releases for FHIR DSTU2, STU3 and R4.
Each release only supports a single FHIR version and is updated separately.
Different releases can be installed side-by-side on the same machine.
Visit http://simplifier.net/forge to download the latest versions.

Dependencies
^^^^^^^^^^^^

* .NET Framework:
  Forge now requires the .NET Framework 4.7.2 (updated from 4.6).
  The .NET Framework 4.7.2 is fully .NET Standard 2.0 compliant, without any additional dependencies.

* FHIR API:
  Update to FHIR R4 .NET API 1.3.0-r4forge5 (internal release)

Known limitations
^^^^^^^^^^^^^^^^^

* Simplifier connectivity for FHIR R4 is almost, but not yet ready and will be made available soon.
  You can manually upload R4 resources to Simplifier by visiting the website.
  Enable snapshot generation in Forge to ensure that Simplifier can render the full profile.
  Once Simplifier connectivity for FHIR R4 is available, we will publish an announcement
  and possibly also a minor update to enable the Simplifier integration features.

* FHIR NPM Package Manager
  Forge provides a package manager for managing and installing FHIR NPM packages from Simplifier.
  Currently, the package manager does not indicate which FHIR version(s) each package supports.
  To find detailed information about each package, visit the Simplifier website.
  In a future Forge update, we will improve the package manager to display and filter by supported FHIR version.

Important changes
^^^^^^^^^^^^^^^^^

* Canonical urls
  FHIR R4 introduces a new datatype "Canonical" that represents a reference to a conformance resource.
  The new datatype is used in many places, e.g. for specifying element type profile constraints.
  This Forge release supports manual input and editing of canonical urls.
  An updated UI for visually selecting a target resource is planned for a future update.

* Type profiles
  FHIR R4 introduces a breaking change in the way element types are specified.
  In FHIR STU3, an element definition can specify a list of type components.
  Each type component specifies a type code and an optional type profile and/or target profile (for references).
  In FHIR R4, type constraints are grouped by type code; duplicate codes are no longer allowed.
  Each type component can specify 0...* profiles and/or 0...* target profiles (for references).

  Because of this, Forge R4 provides a new UI component for editing element types.
  It is no longer possible to represent element types in a flattened list, as in Forge for STU3.
  Instead, each type component now provides an editable child collection of type profile constraints.
  An improved UI for managing type profile constraints is planned for a future update.

* Type slicing
  FHIR R4 introduces some changes with respect to type slicing.
  This Forge release fully supports the new R4 type slicing behavior.
  However the UI is a bit crude and may be improved in a future release.
  We will look into improving the UI to facilitate type slicing in a future update.

  In FHIR STU3, when a choice type element is constrained to a single type, the element is renamed.
  The type constraint also implies a restriction and any other datatypes are not allowed.
  In FHIR R4, a profile may introduce multiple renamed elements constrained to a single type.
  Each renamed element represents a constraint for a specific datatype.
  The original choice type element (with "[x]" suffix) specifies/constrains the list of allowed datatypes.
  The default type slicing discriminator is implied and may be omitted from the differential
  Forge currently supports both single-type and multi-type constraints.
  To specify a single type constraint, restrict the choice type to a single datatype.
  Forge will rename the choice type element.
  Note that a renamed element does NOT restrict the list of allowed types, as it would in FHIR STU3.
  To restrict the list of allowed types and specify one or more type constraints,
  first toggle the choice type element into slicing mode,
  then manually add named slices constrained to a specific datatype.

* Validation
  The FHIR core datatypes and resources define a set of validation constraints (via fhirpath expressions).
  Forge implements validation support for most of the (applicable) constraints defined by FHIR,
  and also performs some additional sanity checks.
  FHIR R4 introduces severity levels for validation constraints.
  This initial Forge R4 release still reports all validation conflicts as warnings.
  In a future update, we will update (bump) the severity level of the core validation constraints,
  according to the specification.

Forge 21.0 for STU3 - Montreal 2019 Release
-------------------------------------------
This is a major update that introduces a number of new features and improvements.

Note: this release is compatible with FHIR STU3.
Visit https://simplifier.net/forge to download a brand new Forge release that supports FHIR R4.

Dependencies
^^^^^^^^^^^^

* .NET Framework 4.7.2
  Forge now requires .NET Framework 4.7.2 (upgraded from 4.6).
  The .NET Framework 4.7.2 is fully .NET Standard 2.0 compliant, without any additional dependencies.

* FHIR API
  Update to FHIR .NET API 1.3.0-forge1 (internal release)
  Some bug fixes and improvements
  e.g. generate summaries for unrecognized/invalid resources

New
^^^

* Edit SearchParameter
* Edit OperationDefinition
  This release introduces authoring support for two additional conformance resources.
  Forge performs basic validation of the content, e.g. verify the associated invariants.

Improvements
^^^^^^^^^^^^

* Edit and validate logical model type
  For logical models, the StructureDefinition.type property is now user-editable.
  When creating a new logical model, Forge initializes the type to the specified canonical url.
  Forge validates that the root element path equals the last segment of the type url.

* Configure choice type property value
  Forge now supports editing the value of a choice type property,
  providing a drop-down list with available property type options.
  This improvement allows you to configure the following properties:
  - [...]UsageContext.value[x]
  - [...]Timing.repeat.bounds[x]

* Validate choice type element name
  When authoring a logical model, Forge now verifies that polymorphic choice type elements
  (that support multiple distinct type codes) have an element name that ends with "[x]".

User interface & usability
^^^^^^^^^^^^^^^^^^^^^^^^^^

* Updated file icons
  - New: OperationDefinition (cog wheels)
  - New: SearchParameter (magnifying glass + cog wheel)
  - New: Bundle Entry (cabinet with files)
  - Changed: Logical Model (brick)
  - Changed: Generic FHIR Resource (flame)
  - Changed: Project Folder (folder + flame)
  - Changed: Slice command (layers)
  - Changed: Named Sliced (bucket)

* Project Explorer, Session Explorer: Copy path / url
  The Project Explorer and Session Explorer context menu provides additional commands
  to quickly copy the file path or the canonical url of the selected item to the clipboard.

* Project Explorer: async
  The project & package explorer is now fully asynchronous (load & refresh are non-blocking).
  The ListView control displays a busy animation while (down)loading resources and packages.

* Project Explorer: sortable columns
  Grid columns are now sortable. Click on column headers to toggle the sort order.

* Project Explorer: bundle entries
  The Project Explorer now indicates bundle entries with a special icon.
  You cannot open Bundle entries for editing, but you can open a duplicate.
  You cannot open or modify the containing Bundle resource.

* Project Explorer: dependencies
  A blue file name in the Project Explorer indicates an external dependency from
  an imported package reference (as opposed to an internal project resource).
  Project dependencies are considered read-only external artifacts.
  You cannot open a dependency for editing, but you can open a duplicate.

* Project Explorer: invalid/unrecognized files
  A gray text line in the Project Explorer indicates a file that is unrecognized,
  unsupported and/or invalid. A yellow warning icon indicates files with parsing errors.
  The Name column displays any error messages, also the warning icon tooltip.

  Note: due to a technical limitation, the FHIR API is unable to scan/load a resource
  without any resource id or canonical url. The Project Explorer clearly indicates such
  resources and shows an informative error message, explaining required id/url is missing.

* Project Explorer: maintain current selection after Refresh
  The Project Explorer Refresh command now maintains the currently selected item.

* Project Explorer: maintain selection after toggle view
  The Project Explorer Toggle View Mode command now maintains the current selection
  and ensures that the selected item is visible (scroll into view).

* Project Dependency Manager: new icons

* Project Dependency Manager: package version
  The Dependency Manager now allows you to select and install a specific package version
  from a list of package versions published on Simplifier.

* Project Dependency Manager: context menu
  You can now also add/remove project dependencies using the context menu.

* Project Dependency Manager: async
  Improved asynchronous logic and lazy resolving of project dependencies, for responsive UI

* Open Target Extension Definition
  Profile extension elements show a new command button next to the extension url
  (ElementDefinition.type[0].profile) that allows you to quickly open the referenced
  extension definition from the current project folder, if available.

* Improved error reporting
  Snapshot generation requires access to the referenced base profile.
  If the base profile cannot be resolved, then Forge is unable to open a profile.
  Forge now detects this situation and displays a friendly error message.

* Validation warning messages: improved context path format
  Validation warnings specify a context path that identifies the invalid target resource,
  element, component and/or property. The formatting of the target path is now based on the 
  ElementId syntax, as defined by FHIR, appending additional custom path segments
  to indicate specific child properties.

* Open already opened file
  When you try to open a file that is already opened, Forge will select and
  activate the open file (instead of displaying an annoying error message).

* Add Item
  The Add command ("+" button) now scrolls the new item into view and sets
  keyboard focus to the new item, or to the first editable child node.

* Options Menu: Open FHIR package cache folder
  Start Windows Explorer and open the global, system-wide FHIR package cache folder.
  The package cache folder is a central storage location on your machine for FHIR NPM packages.
  The cache folder is shared by all FHIR package clients running on your machine, including Forge.
  Packages downloaded from Simplifier are installed to the global package cache folder.
  Project dependencies are resolved from the global package cache folder.
  Forge will automatically try to resolve any missing dependencies from Simplifier.

* Improved control chrome
  Highlight focused controls
  Highlight default buttons
  Mouse hover effects

* New splash screen

* New about box

Bug fixes
^^^^^^^^^

* Refresh list of project dependencies after add/remove
  After adding or removing a package dependency, Forge will redetermine the transitive closure
  of the full project dependency graph. The dependency list will be updated to show the
  new installation status of the selected package and any indirect package references.
  In order to keep the application responsive, dependency resolving is performed asynchronously
  on a background thread. The UI will automatically update after the (remote) operation completes.

* Prevent removal of indirect dependencies
  Forge only allows removal of packages that are a direct dependency of the current project.
  Forge disallows removal of indirect dependencies, i.e. packages referenced by other packages.

* Fix invariant sdf-11
  Invariant sdf-11 defines rules for the StructureDefinition.type property.
  Forge now takes into account that this invariant does not apply to logical models.

* Support (unofficial) FHIR version 3.1.0
  Forge determines if profiles are compatible by comparing the stated fhirVersion property value
  against a built-in list of officially published FHIR release versions.
  Forge for STU3 supports only profiles with a fhirVersion that is recognized and compatible with STU3.
  It turns out that some profiles have been published with fhirVersion="3.1.0", which is not an official
  FHIR release: http://www.hl7.org/fhir/directory.cfml
  This Forge release has been updated to recognize and support this unofficial FHIR version,
  i.e. Forge now allows you to apply extensions and derive from profiles with fhirVersion="3.1.0".

  When creating a new (derived) profile or extension, Forge always initializes fhirVersion to "3.0.1"
  by default, which represents the final official FHIR STU3 release; the user cannot change this value.

* Fix configuration option: Resolve resource from subdirectories
  The Project Explorer is capable of indexing FHIR resources from (nested) subdirectories of the
  selected project folder. However this behavior is disabled by default.
  The Open Folder dialog window displays a custom checkbox that controls this behavior for the selected folder.
  When opening a folder from the Recent Documents menu, Forge will use the previously selected setting.
  The Options menu also provides a global configuration option setting "Resolve resource from subdirectories"
  to control the default behavior. If you enable this option, then the Open Folder dialog will
  include subdirectories by default.

* Gracefully handle incompatible resources
  Improved error handling in case the selected file cannot be opened.

* Fix error when opening file from disk
  Fixed a path parsing error in the File Open command.

* Fix narrative tab header
  Fixed incorrect header text for Narrative tab (from "Properties" to "Narrative")

* Fix dependency manager toolbar buttons
  Fixed incorrect icon for Search Dependencies toolbar button

* Wrap long member names in tooltips

Forge 19.7 FHIR DevDays 2018 Amsterdam Edition
----------------------------------------------
This release is a major update that introduces a couple of new features.
Want to learn more? Join us at FHIR DevDays Amsterdam!

FHIR API
^^^^^^^^

* Update to FHIR .NET API 1.0.0-alpha6 (internal release)
  Improved access to parser configuration settings, to relax input validation.
  Forge is now fully based on the new flexible API parsing logic based on ISourceNode.

User Interface
^^^^^^^^^^^^^^

* NEW! Project Dependency Manager
  This release introduces support for FHIR NPM packages, versioned published 
  containers for conformance resources such as profiles, extension definitions etc.

  The Project Browser provides a new Dependency Manager tab page.
  A project can define one or more package dependencies.
  Add project dependencies by browsing packages from Simplifier.
  Downloaded packages are managed in a global FHIR package cache.
  Forge resolves all external references from the list of dependencies.
  Add profile extensions from extension definitions in package dependencies.
  Derive a new profile from a base profile in a package dependency.
  Publish your project to Simplifier and create a new package for others to consume.
  
  Note: this initial release fetches the highest package version from Simplifier.
  Future Forge updates will introduce improved support for versioning dependencies.

* NEW! Help menu - Visit FHIR DevDays website @ https://www.fhirdevdays.com/
* NEW! Help menu - Visit Simplifier downloads page @ https://simplifier.net/downloads

Improvements
^^^^^^^^^^^^

* NEW! JSON Support
  Forge now also supports FHIR resources in JSON format.
  When opening a project folder, you can now also configure the preferred format (XML or JSON).
  This folder-specific configuration setting controls which format should take precedence, in case
  the project folder contains multiple representations of the same profile with the same canonical url.
  Note that JSON support in Forge has some limitations:

  - Directory listing in Folder Explorer is optimized for XML.
    The XML format is ordered, allowing Forge to quickly scan existing profiles for relevant metadata (from beginning of each file).
    The JSON format is unordered, as a result scanning can be (much) slower and/or extract only partial information.
    This limitation is inherent to the JSON format. Therefore, we recommend to use the XML format with Forge.
  - The XML tab always renders Xml preview, independent of the actual serialization format on disk.
    We might also introduce JSON preview in a future release of Forge, depending on demand.

* Relaxed input validation
  The previous FHIR API release introduced a completely new (de-)serialization layer.
  The new parsing logic is much more flexible and supports e.g. custom/invalid resources.
  However by default, the new parsers are strict and abort/throw on syntax error.
  As a result, the previous Forge release would fail to open invalid resources.
  This Forge release applies custom parser settings to relax input validation, allowing
  users to open invalid artifacts and correct syntax errors (such as empty values).

Bug fixes
^^^^^^^^^

* Folder Explorer - show links to intermediate empty subfolders
  When browsing a directory in folder view mode, intermediate subfolders without any artifacts
  would be excluded from the display list. This would also prevent the user from navigating to
  nested subfolders (which may contain artifacts).
  In this release, intermediate subfolders are now explicitly included in the display list.
  This ensures that the user can navigate the complete folder structure of the content directory.

* Folder Explorer - sort subfolders first
  In some circumstances, when toggling View mode from List to Folders, the Folder Explorer would
  display subfolders last, after all discovered artifacts.
  This bug has now been fixed. In Folder mode, subfolders are always displayed first.

* Remove existing slices after toggling slicing mode
  The previous release introduced a bug that occured when the user toggles the state of a sliced
  element from sliced to unsliced. Forge then discards all existing named slices from the element
  tree, however the associated element constraints would remain present in the underlying xml.
  This has been fixed, discarded slicing constraints are also removed from the xml.

* Folder Explorer fails for profiles with relative canonical url's
  In some circumstances, when the content directory contains one or more profiles with a relative
  canonical url, the directory browser would fail to display a list of files and remain empty.
  This issue has now been fixed.

* Support compatible extension definitions on named slices
  Forge now allows you to add compatible extensions to named slices.
  The previous release would never match a compatible extension context to a named slice,
  due to a bug in the matching algorithm. This issue has now been fixed.

* Open Folder in File Explorer
  File Explorer would actually open to the immediate parent folder of the selected project folder.
  This has now been fixed.

Forge 19.4
----------
This release introduces a revamped main user interface.

FHIR API
^^^^^^^^

* Update to FHIR .NET API 1.0.0-alpha3 (internal release)
  See below for more details on this major update.

User Interface
^^^^^^^^^^^^^^

* NEW! Folder Explorer

  We have redesigned the main user interface and integrated a new Folder Explorer
  that provides a detailed overview of all profiles in a common project folder.

  Start by opening or creating a profile project folder on your machine.
  We recommended that you manage related profiles in separate dedicated project folders.
  Forge resolves profile dependencies, such as extensions, from the project folder.
  To ensure proper resolving, verify that the project folder does not contain
  any duplicates or backups of profiles, as this will cause resolving conflicts.

  The new Folder Explorer lists all FHIR conformance resources discovered in the project folder,
  showing both file attributes and FHIR metadata such as resource type, name and canonical url.
  You can easily browse, filter, sort and search the list for specific profiles.
  Open or derive from an existing profile, or create a new profile in the project folder.
  You can also import from and publish to projects on Simplifier.

  Optionally, Forge also indexes all subfolders of the working folder (recursively).
  This allows you to manage e.g. extensions and valuesets in separate subfolders.
  A checkbox "Include Subfolders" in the Open Folder dialog controls this behavior.
  Toggle the view mode of the Folder Explorer to easily navigate projects with subfolders.
  Do NOT enable subfolder indexing on deeply nested or mixed folders, such as My Documents.

  Visit our online documentation to read more about the new Folder Explorer:
  http://docs.simplifier.net/forge/forgeFeaturesOpenFolder.html

  In following Forge releases, we are going to introduce the concept of a Forge project file.
  This will allow us to further improve the Forge user interface and smoothly integrate
  Forge projects with Simplifier.

* NEW! Add Extension

  We also implemented a completely new user interface for managing profile extensions.
  The new extension selection dialog list all of the extension definitions discovered
  in the project folder, with core metadata such as title and canonical url.
  You can easily browse, filter, sort and search the list for specific extensions.
  Forge validates the extension context and restricts the selection to extensions
  that are compatible with the receiving profile element.

  Visit our online documentation to read more about the new extension selection dialog:
  http://docs.simplifier.net/forge/forgeFeaturesExtensions.html

FHIR API
^^^^^^^^

  Ewout Kramer, maintainer of the FHIR .NET API, has rewritten significant parts of
  the API code base in order to introduce the new ElementModel classes:
  http://docs.simplifier.net/fhirnetapi/parsing/intro-to-elementmodel.html

  The new ElementModel-based approach is highly flexible and facilitates dealing with
  possibly invalid or incompatible data in different representations and formats.
  The API now uses ElementModel internally to read and manipulate data.

  This API release also introduces a new interface for flexible error collecting and reporting.
  Initially, the new interface is used internally by the new (de-)serialization logic.
  Future updates will further integrate the new interface with various other API services,
  such as the summary generator and snapshot generator. This will allow us to improve error
  handling and reporting in Forge.
  
  The ArtifactSummaryGenerator classes extract some additional relevant metadata from profiles
  and extensions in your project folder, displayed by the Forge Folder Explorer.

  The DirectorySource now catches duplicate canonical url conflicts during resolving,
  without preventing access to other resources in the containing folder.

Features
^^^^^^^^

* New configuration option: UTF-8 Byte Order Mark (BOM)
  Previous versions would always save XML files in UTF-8 encoding with Byte Order Mark (BOM) prefix.
  Forge now provides a application configuration option to control the output format.
  Enable this option to include the Byte Order Mark in the output, or disable to suppress.

Bug fixes
^^^^^^^^^

* Fix memory leaks
  Refactored significant parts of UI chrome to prevent databinding memory leaks.

* Introduced some new bugs, as this is a huge rewrite...
  We welcome you to report issues at forge@fire.ly

Happy profiling!


Forge 19.3
----------
Hotfix release with bug fixes for issues reported by customers.

Bug fixes
^^^^^^^^^

* Fix "Add" extension element toolbar button for complex extensions
  In the previous release, Forge would generate a runtime exception when trying
  to add a new element to a complex extension using the "Add" toolbar button.
  The Add command has now been fixed.

* Fix incomplete element expansion
  In some circumstances, Forge would not fully expand all the child elements of a profile,
  specifically Forge would not further expand any child elements of a nested BackBoneElement
  (e.g. Careplan.activity.detail). This has now been fixed.

Improvements
^^^^^^^^^^^^

* Implement support for Google Analytics
  Hyperlinks to Firely websites (such as Simplifier, Profiling Academy and our company website)
  now provide custom query string parameters that specify the application name (Forge) and
  release version number to Google Analytics. These metrics allow us to improve our
  products and service. We collect and aggregate only application-specific metrics.
  These metrics do not identify you personally.

Forge 19.2
----------
Hotfix release that fixes broken Simplifier integration

FHIR API
^^^^^^^^

* Update to FHIR .NET API 0.96.1-alpha2 (custom Forge release)
  Provides a number of bug fixes and improvements, including:  

  - Snapshot Generator supports (expands) custom element type profiles for datatype Reference
  - Generated summaries of StructureDefinition resources now include the root element definition property value

New
^^^

* New configuration option: "Show child elements when sliced"
  According to FHIR, constraints on regular child elements of a slice group represent common
  slice constraints that apply to all indivual named slices in the group.  This approach is more
  efficient and convenient than having to repeat the same common constraints on all named slices.
  By default, when an element is sliced, Forge will hide all regular child elements in the
  element tree, instead showing the associated named slices as children of the sliced element.
  This design simplifies and declutters the UI, but also prevents authors from specifying
  and/or editing common child element constraints on a slice group.
  This release introduces a new application configuration setting "Show child elements when sliced"
  that controls the visibility of regular child elements of sliced elements (including extensions).
  The new option is disabled by default, to maintain the behavior of the previous Forge releases.
  Advanced users can toggle this option to manage profiles with global slicing constraints.

Improvements
^^^^^^^^^^^^

* Prevent conflicting canonical urls for newly created profiles
  When the user creates a new StructureDefinition, Forge verifies if the specified canonical url is unique.
  If the url conflicts with another StructureDefinition that is currently loaded in the application,
  then Forge will automatically add a unique index number to the specified canonical url and name.

* Generate appropriate name for new logical models
  When creating a new logical model, Forge would propose the confusing name "MyElement".
  Forge will now assign the default name "MyModel" to newly created logical models.

* New StructureDefinition page
  Some improvements to the New StructureDefinition dialog window:

  - Update canonical url and filename after name change
    If the user modifies the generated new profile name,
    then Forge will automatically update the generated canonical url and filename accordingly.
  - Display current search text
    The list of resources/datatypes supports text search by name (when focused); 
    Start typing to quickly select the first item (if any) with a matching name prefix.
    Forge now displays the current search text (when searching) above the list.
  - Display root element definition
    Forge now displays the root element definition of the selected resource,
    equal to the introduction text of each resource page on the official FHIR specification website.

* Initialize default discriminator path expression for selected types
  When you select a specific discriminator type, Forge now automatically initializes the associated
  default discriminator path expression:

  - type = "Type"    => path = "$this"
  - type = "Profile" => path ="resolve()"

* Validate discriminator fhir path expressions
  Forge now validates discriminator.path constraints to verify that the specified values
  are valid FHIR path expressions.

* Enable Http Compression
  Forge now supports Http response compression when connecting to a FHIR server or Simplifier.
  By default, Forge will accept compressed responses.
  You can toggle Http Compression via the Options menu.

Bug fixes
^^^^^^^^^

* Restore broken Simplifier integration
  Sometimes the Publish to / Import from Simplifier commands in Forge are broken,
  due to some small variations in the capability statement of our Simplifier environment.
  This release implements a workaround that restores Simplifier connectivity.

* Immediately expand child elements of newly created BackBoneElement slices
  In the previous release, when the user adds a new named slice of a BackBoneElement, Forge
  would not immediately expand the (complex) child elements of the new slice, until the user saves
  and reloads the profile. This has now been fixed. When you add a new named slice, Forge now
  immediately expands all child elements of the new slice.

* Support type profiles for elements with datatype Reference
  Forge now supports resolving and expanding references to external profiles on datatype Reference
  (i.e. expand children of elements with ElementDefinition.code="Reference" and .profile non-empty).
  This allows you to author a custom user profile on datatype Reference, and then constrain
  generic Reference elements in other profiles by linking to the custom Reference profile.
  With this improvement, Forge now fully supports all combinations of element type profiles
  (profile on value element; profile on reference element and/or profile on reference target).

* Force delete binary disk cache after update
  Forge internally generates a binary cache of all core resource and datatype structures,
  to accelerate resource resolving and application startup. In some circumstances, the
  binary cache could become obsolete after updating the application to a newer version.
  Therefore, Forge now always recreates the binary cache during the first launch after
  the installation of an application update.

Forge 19.1 - DevDays Boston 2018 Edition
----------------------------------------

FHIR API
^^^^^^^^

* Update to FHIR .NET API 0.96.1-alpha1 (custom Forge release)
  Release notes: http://docs.simplifier.net/fhirnetapi/releasenotes.html
  Stability update with some bug fixes and improvements.
  Includes two bug fixes for the snapshot generator:

  - #611 Snapshot Generator fails for derived profiles with sparse constraints on _some_ existing named slices
    https://github.com/ewoutkramer/fhir-net-api/issues/611
  - #620 Snapshot Generator ignores multiple codings with only display value
    https://github.com/ewoutkramer/fhir-net-api/pull/620
  
Features
^^^^^^^^

* Add HAPI FHIR STU3 server address to list of default servers
  http://hapi.fhir.org/baseDstu3

Improvements
^^^^^^^^^^^^

* Suppress SimpleQuantity error
  The FHIR STU3 core specification contains a bug in the official definition of the SimpleQuantity datatype;
  the root element specifies a non-empty SliceName = "SimpleQuantity", which is invalid. This causes the
  snapshot generator to emit an error message when expanding any profile that (indirectly) references the
  SimpleQuantity datatype, such as an Observation profile. Strictly, the error is correct. However in Forge,
  this is confusing and not useful for the end user at all, since the issue originates from the spec itself.
  Forge now automatically fixes the core SimpleQuantity datatype definition during startup, by removing
  the invalid SliceName from the root element. By stripping the SliceName from the core definition, the
  snapshot generator no longer reports an error and user profiles no longer inherit the invalid SliceName.


* Improve OS detection
  On the first run, detect the OS and automatically disable hardware rendering on non-Windows platforms.
  The About box displays the detected OS.
  User can then manually toggle hardware/software rendering via the Options menu.

* New StructurePage - initialize focus
  When the New Structure dialog page is displayed, initialize the keyboard focus to the ListView control
  to allow immediate selection of the base type via the arrow keys.

* Improved display of server connection errors
  The dialog windows for connecting to a FHIR Server and Simplifier now display
  a friendly error message when unable to connect using the specified credentials.

Bug fixes
^^^^^^^^^

* Fix root element type corruption
  Forge 18.6 introduced a bug where any change to a root element would also cause the root element
  type to change to "Resource", subsequently triggering a validation error.
  This issue now been fixed.

* Fix NullReferenceException in method IsInheritedExtensionElement

* Fix empty authorization header
  In some circumstances, when connecting to a FHIR server anonymously, without specifying any credentials,
  Forge would add an empty authorization response header. The empty header would prevent connections to
  e.g. the HAPI FHIR server. The issue has now been fixed.

* Fix invalid interpretation of derived profile with constraints on existing named slices
  Note: a derived profile is allowed to append, not insert, new named slices to an existing slice group.
  https://github.com/ewoutkramer/fhir-net-api/issues/611

* Fix for snapshot generator issue concerning multiple codings with only a display value (reported by Carrick Gillespie)
  For a profile element that defines a list of codings with only display values, the generated
  snapshot would only include the first coding entry; remaining codings would be missing from
  the snapshot. This issue has now been fixed in the snapshot generator.
  https://github.com/ewoutkramer/fhir-net-api/issues/620

* Allow extensions on root element of a DataType profile

* Enable IsModifier property for all elements of an extension definition

* Referencing profile should not inherit isModifier property from extension definition root
  When a profile references an external (primitive) extension definition marked with isModifier = true,
  then the the isModifier property value should NOT be inherited by the .extension element in the
  referencing profile.

* Fix losing input focus after change
  Fixed a bug in release 18.6 where the user interface was reloaded after each commit.
  This caused a significant delay and prevented input focus away from moving to the next control.

* Update resource filepath after Save As command
  After saving a document to a new location and/or filename, the open document would still be associated
  with the original filepath. The Save As command will now update the document filepath accordingly.

* Restore ".StructureDefinition" suffix in generated file names
  When you create a new profile, Forge now appends a resource type suffix to the generated file name,
  for example "MyPatient.StructureDefinition.xml".

* Restore access to IG package properties
  You can now edit the name and description of ImplementationGuide.package components.

* Fix Remove IG Package command
  Fix NullReferenceException when removing ImplementationGuide package component.

Forge 18.6 For STU3 - Colonia 2018 Edition
------------------------------------------
This release is a major update that is published for the May 2018 HL7 WGM in Köln.
Release 18.6 introduces a set of new features, and also contains a large number of
usability, stability and performance improvements.
We recommend that you update your local Forge installation(s) to the new 18.6 release
at your earliest convenience.

FHIR API
^^^^^^^^

* Update to FHIR .NET API 0.95.1-alpha2 (local development build)
  Release notes: http://docs.simplifier.net/fhirnetapi/releasenotes.html
  Stability update with some bug fixes and improvements.
  Includes a fix for the snapshot generator concerning contentReference resolving.
  Also supports harvesting artifact summaries from ZIP files, which allows for
  efficient indexing and resolving of core resource profiles.

Editing
^^^^^^^

* Improved editor support for data types ContactDetails, SampledData, Timing (partial) & UsageContext
  Specify and edit (complex) fixed/default/example values on elements constrained to one of these datatypes.

  Forge provides built-in editor UI templates for allmost all FHIR datatypes, except:

  - Timing.repeat.bounds[x] element
  - Base64binary
  - Attachment, Annotation, Signature
  - Contributor, DataRequirement, ParameterDefinition, RelatedArtifact, TriggerDefinition
  - Dosage

User Interface
^^^^^^^^^^^^^^

* Create New Structure
  Finally, the New Profile page received an overhaul that was long overdue.
  This release introduces a common New Structure page that is now used to
  create all types of StructureDefinitions:

  - Profile on core resource/datatype
  - Extension Definition
  - Derived profile
  - Logical Model

  Select a base type from the listview control.
  You can toggle the listview mode between tiles and rows.
  For creating a Derived Profile, open a base profile from disk.
  After selecting the base profile, Forge will pre-fill some default properties (name, canonical url, filename).
  You can inspect and optionally customize the generated properties.
  Press Enter or click Ok to confirm the selection and create the new structure.
* Select Extension Context
  A new and improved dialog window for selecting an extension context value.
  Select core resource or datatype from the listview on the left.
  Optionally select a child element from the treeview on the right.

* The help menu now provides direct links to navigate to:

  - The official HL7 FHIR Profile Registry at https://registry.fhir.org/
  - The official HL7 FHIR Implementation Guide Registry at http://www.fhir.org/guides/registry
  - The HL7 FHIR Implementation Guide repository on Github at https://github.com/FHIR/ig-registry

* Font sizing in dialog windows
  Font sizing keyboard shortcuts (Ctrl +, Ctrl -, Ctrl 0) are now also effective in dialog windows.
  In previous releases, font sizing keyboard shortcuts would only be effective in the main window.

* Improved user interface implementation logic
  Some outdated UI logic has been rewritten to improve stability and performance.
  UI caching is now a bit less aggressive, e.g. tab pages are (un)loaded on demand.
  This decreases the application memory consumption, at the expense of some cpu cycles.

* Improved support for MacOS
  You can install and run Forge on Mac and Linux systems, using WINE.
  However on Mac systems, some rendering issues may occur due to issues with hardware acceleration.
  As a workaround, Forge now provides a new application configuration option "Disable hardware rendering".
  If you experience any rendering issues, try to enable this option.
  During startup, Forge now tries to detect the platform. If the application can determine to be running
  on MacOS, then Forge will automatically disable hardware rendering for the application.
  
Validation
^^^^^^^^^^

* Clean up and improve validation logic

* Implement some additional validation rules for datatypes, as defined by the FHIR spec.
  In the context of profiling, these rules mainly apply to e.g. fixed values and examples.

  - Implement validation rules for datatypes Id, Code and Oid
    If you constrain a choice type '[x]' element to one of the above datatypes and specify a fixed value,
    then Forge will validate that the fixed value conforms to the rules of the selected datatype.
  - Implement validation rule sqty-1 for datatype SimpleQuantity: "The comparator is not used on a SimpleQuantity"
    Forge now hides the Quantity.comparator property if the type is constrained to SimpleQuantity
  - Implement validation rule qty-3 for datatype Quantity: "If a code for the unit is present, the system SHALL also be present"
  - Implement validation rules age-1, cnt-3, dis-1, drt-1 and mny-1 for Quantity subtypes Age, Count, Distance, Duration and Money
  - Implement validation rule rng-2 for datatype Range: "If present, low SHALL have a lower value than high"
  - Implement validation rule rat-1 for datatype Ratio: "Numerator and denominator SHALL both be present, or both are absent."
    Forge also generates a (custom) warning if the denominator value equals zero.
  - Implement validation rule cpt-2 for datatype ContactPoint: "A system is required if a value is provided."
  - Improve validation message target path for Ratio/Range/Period
  - Implement validation rules tim-1 to tim-10 for datatype Timing

* Validate type slice names
  Forge now validates slice names of choice type elements constrained to a single type.
  When you constrain a choice type element to a single type, Forge will automatically assign the
  slice name and disable the textbox control to prevent you from editing the generated value.
  However if Forge detects an invalid slicename when opening a profile, then the sliceName
  textbox control will be enabled to allow you to correct the invalid value.

Performance
^^^^^^^^^^^

* Optimized indexing of resources on disk
  Forge now leverages a new technology in the FHIR .NET API that allows for quick and efficient
  indexing of FHIR resources on disk (including ZIP archives).
  During the initial run, Forge fetches all core resources from the specification.zip archive,
  extracts the associated summary information and persists all data into a (static) binary
  application database. The database is designed to optimize and accelerate the retrieval of
  core profiles and summary information, during all subsequent executions.
  The new optimized resource indexing mechanism also decreases application memory consumption.

Bug fixes
^^^^^^^^^

* Fix memory leaks
  Windows provides a built-in accessibility layer called "UI Automation".
  The layer is automatically activated on supported devices (e.g. with a touch screen).
  Unfortunately, the technology is known to cause memory leaks in client applications, including Forge.
  Effectively, this turned out to prevent Forge from freeing consumed memory after closing a profile.
  Therefore, in order to prevent memory leaks, UI Automation is now disabled for the whole application.
  Some other minor memory leaks also have been fixed.
  And we've implemented some additional debugging logic that allows us to detect any future memory leaks,
  in case Windows introduces some new flaky technology.

* Improved structural profile expansion
  In this release, the internal post-snapshot expansion algorithm has been re-implemented.

  On opening a profile, Forge first calls the API to (re-)generates the snapshot component.
  The snapshot contains all elements constraints inherited from the base profile, merged with 
  all element constraints introduced by the current profile.
  Constrained elements are always expanded in the snapshot; unconstrained elements are not expanded.
  However, in order to allow the user to author new constraints on any element, Forge displays all
  structural elements and child elements, constrained as well as unconstrained. This requires Forge
  to further processes the generated snapshot and recursively expand any remaining unconstrained elements.
  The new expansion algorithm fixes some issues and limitations in the old, obsolete logic.
  Forge now automaticallyy detects and handles infinitely nested element hierarchies, such as:

  - Reference.identifier <=> Identifier.assigner
  - Questionnaire.item[...].item

  Expansion automatically terminates at elements with a recursive type or contentReference.
  The new logic also fixes an issue with derived profiles, where previous Forge releases would
  sometimes fail to expand some unconstrained elements in a derived profile.

* Fix type slicing issue (reported by David McKillop)
  When modifying a choice type element that is part of a type slicing group, Forge would
  sometimes generate an invalid element path and id. This issue has now been fixed.
  Forge only renames choice type elements if constrained to a single type and not part of a type slice.

* Fix slicing issue (reported by Ardon Toonstra)
  When opening a derived profile based on a profile that introduces slicing,
  Forge would sometimes clear unconstrained, non-empty slicing components inherited from the base profile.
  This issue has now been fixed.

* Fix issue with contentReference resolving (API)
  The snapshot generator now resolves contentReferences from the core StructureDefinition that introduces
  the referenced element.
  In previous versions, contentReferences would be resolved from the current, referencing StructureDefinition,
  incorrectly inheriting element constraints from the referenced element in the profile itself.

* Validate all invariants on load
  Validation logic has been refactored to ensure that all invariants are verified immediately after loading a profile.
  Previous Forge releases would sometimes show incomplete validation results after load;
  Some broken invariants would not be reported initially, until the user applied a change and triggered re-validation.

* Hide extension selection property on child elements of a referenced complex extension definition
  The extension selection property maps a profile extension to a specific extension definition.
  In previous releases, Forge would also display the extension selection property for child extension
  elements inherited from a referenced complex extension definition. This does not make sense,
  as a profile cannot re-map inherited complex extension child elements to another extension definition.
  Forge now only displays the extension selection property where it applies, i.e. on extension elements
  in a profile that actually refer to an (external) extension definition; however the property is not
  available on child extension elements inherited from the selected complex extension definition.

* Ensure visibility of target element after double click on validation message
  A double click on a validation message selects the associated target element in the treeview control.
  However common resource elements (id, meta, ...) are hidden by default, depending on the value
  of the global application configuration option "Show Common Resource Elements" (Options menu).
  If the target of a validation message is a common resource element, then Forge now explicitly
  enables the global "Show Common Resource Elements" application setting before selecting the
  element in the treeview control, to ensure that the element is actually visible.

* Improved support for ranged types
  The minValue[x] and maxValue[x] properties only apply to a limited subset of ranged datatypes.
  Forge now dynamically determines the compatible set of ranged datatypes during startup, by inspecting the core profiles.
  This ensures that the MinValue and MaxValue properties are only made accessible when the element has a ranged datatype.

* Disallow extensions on Binary & Bundle root elements
  Forge now verifies if the constrained type is derived from DomainResource.
  If not, then disable Extend button on the root element.
  Note: Binary and Bundle are derived from Resource; don't support extensions on root element

* Save new profile
  After saving a new document, Forge now properly updates the internal state:

  - Clear dirty flag (yellow star icon)
  - Update file properties (Location uri and Last modified date)

* Open profile from private Simplifier project
  The previous release was unable to download resources from private Simplifier projects.
  This has been fixed.

* Update publication date only when publishing to Simplifier (configurable)
  Previous Forge releases would always initialize the .date property when creating
  a new StructureDefinition (or ImplementationGuide) resource.
  However this behavior is invalid, as the FHIR spec defines the .date property as
  "The date (and optionally time) when the structure definition was published".
  Forge now updates the .date property right before publishing to Simplifier.
  Forge will never update the .date property when publishing to any other FHIR server.
  You can toggle this behavior via the new application configuration setting "Auto update publication date".
  Disable this setting if you prefer to control the publication date manually.

* Fix XML attribute rendering
  Fixed a bug in the XML rendering (previous version would render attributes with repeated equal signs)

* Fix lose focus after saving
  If you press Ctrl+S to save while the focus is on the last focusable control in the properties window
  (i.e. comment text of the last element mapping), then Forge would activate the Properties tab.
  This has now been fixed.

* Fix status icons appearing after close dialog
  In some circumstances, after closing a dialog window, the main window would display inappropriate
  static icons (such as the yellow pen). This has now been fixed.


Forge 18.2.1 - HIMSS 2018 Edition
---------------------------------
This is a hotfix release that solves a single issue reported by the community.

Bug fixes
^^^^^^^^^

* Clear dirty flag after saving with snapshot
  The previous release introduced a bug where after saving a profile with snapshot component,
  Forge would not clear the yellow star icon that indicates unsaved changes. As a result,
  the application would continue to bug the user about saving the profile. This annoying
  behavior would only occur if the Generate Snapshot Component configuration option was
  enabled. The bug has now been fixed.


Forge 18.2 - HIMSS 2018 Edition
-------------------------------
This release is a minor update with some improvements and bug fixes.

New
^^^

* Profiling Academy
  The header bar now displays a toolbar button (with square academic cap) to visit
  our online Profiling Academy at https://simplifier.net/guide/ProfilingAcademy/.
  The Firely Profiling Academy is an extensive knowledge base with detailed information and best
  practices about FHIR profiling, created and maintained by our seasoned FHIR consultants.
  The Help menu also includes a new hyperlink to the Profiling Academy.

* Validation

  - Validate that slice names in a common slice group are unique
  - Validate that global profile mapping ids are unique
  - Validate that element conditions are unique
  - Validate logical model element names (alphanumeric, distinct)

* Disable invalid cardinality buttons
  Forge now disables element cardinality buttons when they would violate the cardinality constraints
  of the associated base element, improving usability and visual feedback.
  Textbox controls provide unconstrained access to the actual Min / Max property values.

Bug fixes
^^^^^^^^^

* Improved import/publish commands
  We've made some improvements to the import/publish commands, to try and encourage you to always work
  on local copies of profiles (instead of directly updating published versions on remote servers)
  and to prevent inadvertent loss of information.

  - After importing a profile from a FHIR server or Simplifier, Forge will reset the profile location (to blank),
    encouraging you to save a copy of the imported profile to local disk.
  - After successfully publishing a profile to a FHIR server or Simplifier, Forge will:

    - initialize the profile .id property from the server-assigned value
    - update the values of the common .meta.lastModified and .meta.version elements accordingly
    - mark the profile as being "dirty" (= having unsaved changes)
    - maintain the local file path where you previously opened/saved the profile from/to

    This ensures that:

    - the Save command will be (re-)enabled after publishing
    - the Save command will update and sync your local copy of the profile
    - Forge will request save confirmation when closing the application
    - you don't inadvertently lose the new server assigned profile id
    - you don't inadvertently overwrite the published version on the remote server

* Fix validation rule eld-12: ValueSet binding
  Correctly validate valueset binding urls, depending on the element type:

  - .binding.valueSetReference => accept http | https
  - .binding.valueSetUri       => accept http | https | urn

* Fix validation rule eld-16: slice names

  - Verify correct use of forward slashes; only valid for reslices; may not occur at start, end or repeating
  - For reslices, verify that the base (everything before the last '/' character) matches the parent slice name
  - Accept special name "@default", to indicate the default slice
    The @default slice constraints apply to instance data that does not match any named slice.
    See: http://hl7.org/fhir/STU3/profiling.html#default-slice

* Fix incorrect reference type options
  For choice type elements, Forge tries to generate suitable type selection options based on compatible profiles
  that are currently opened in the application.
  Forge would initialize the type options by assigning the compatible profile url to the type.profile property.
  However for reference types, this is incorrect; Forge should initialize the type.targetProfile property instead.
  This issue has been fixed. Forge now correctly initializes type profiles, depending on the category:

  - Value types:         { Code = "<type>", Profile = "<url>" }
  - Resource references: { Code = Reference, TargetProfile = "<url>"}

* Render encoded XML entities in Xml tab
  The XML view now renders encoded XML entities (&amp; &quot; &apos; &lt; &gt;)
  in attribute values as-is, without decoding.
  Previously, the XML view would render attribute values in decoded form.
  The actual entity encoding would not be visible, misleading the end user.
  Copying the rendered text to the clipboard could therefore capture invalid xml.
  This was purely a display issue; saved/published output is always encoded correctly.

* Fix broken link in help menu
  The help menu now provides a command "Firely website" which navigates to https://fire.ly.
  This command replaces the broken "Firely FHIR Tooling" command that navigated to a non-existing page (404).

Forge 18.1
----------
This release is a minor update that introduces our new company name and branding.
It also provides some stability improvements and bug fixes.
If you find any issues, then please submit a bug report to forge@fire.ly

New
^^^

* NEW! Firely rebranding

  We have changed our company name.
  Furore Health Informatics, the FHIR team of Furore, is now Firely.
  Only the name, website, twitter handle and email addresses have changed.
  Our focus on FHIR, tools, team, address, legal entity, etc. remain the same.
  We hope you like our name.
  Please take a look at our website https://fire.ly and follow us on Twitter: @FirelyTeam

* New code signing certificate

  The Forge binaries and installer are signed using PKI technology in order to securely identify Firely as the original publisher.
  The code signing certificate has been renewed and now refers to the new company name.

  Issued to: Firely B.V.
  Issued by: COMODO RSA Code Signing CA
  Expiration Date: 2020-01-25
  SHA1 hash: ‎4C 39 21 8E 75 36 C5 39 2D F8 00 02 23 70 0F 6F D5 B9 35 95

  Initially, the renewed certificate may trigger a warning from Windows SmartScreen.
  After confirming that the displayed publisher credentials identify Firely,
  you can safely click on More information... / Run Anyway to continue.
  Eventually the warning should eventually disappear, as the application has gained sufficient Smartscreen "reputation".

* NEW! Support command line arguments

  You can now specify one or more file paths on the command line (surrounded with quotes if necessary):

    Forge.exe [file] [file] [file] ...

  After startup, Forge will try to open all the specified files one by one.

* Auto-generate slice names for complex extension child elements
  When you add a new child element to a complex extension, Forge will now automatically generates a unique slice name
  for the extension element (of the form "elemNNN"). Users are encouraged to update the generated default value to
  a more descriptive name.

* Add validation for empty slice names
  According to FHIR, all slice elements, including complex extension child elements, must be assigned a slice name.
  Forge now validates required slice names and generates a warning when a required slice name is empty or missing.

* Add validation for duplicate slice names
  According to FHIR, slice names of sibling elements must be unique.
  Forge now validates slice names of sibling slice elements and generates a warning in case of duplicate slice names.

FHIR API
^^^^^^^^

* Update FHIR API library to 0.95.0-alpha1
  Stability update that provides some bugfixes for the snapshot generator.

UI Improvements
^^^^^^^^^^^^^^^

* Derived profiles based on a logical model are not supported.
  Forge now detects if you try to derive from a logical model and aborts the operation with an error message.

* Save & restore window position
  Forge now automatically remembers and restores the window position and state

Bug fixes
^^^^^^^^^

* Faster loading
  When opening a profile, Forge will first (re-)generate the snapshot component and then perform
  additional post-processing in order to fully expand the element tree for display in the UI.
  The responsible post-processing logic has been rewritten and optimized, to decrease memory
  usage and increase loading speed.

* Respect global configuration setting "Resolve resources from subdirectories"
  Previous Forge releases would sometimes ignore the actual value of the global configuration setting
  "Resolve resources from subdirectories" and try to resolve external profile references from subfolders
  of the selected open/save file folder regardless, e.g. when generating snapshot for saving.
  Forge now always tries to respect the value of this setting when loading and saving profiles
  from/to disk.
  Note: If you toggle the "Resolve resources from subdirectories" configuration setting, then you
  should restart the application for the new value to take effect.

* Update element id's of expanded child elements after changing element type
  When you change the type constraints of an element, Forge will dynamically
  try to re-expand the associated child elements, depending on the selected type.
  In some circumstances, Forge would not immediately update the element id's of
  the generated child elements. This has been fixed.

* Expand snapshot for profile without any constraints
  Forge will now happily expand the snapshot of a trivial profile without any element constraints
  (no differential).

* Don't try to expand snapshot for logical models
  In the previous release, Forge would sometimes try to (re-)generate the snapshot component for a logical model.
  However a logical model is always defined via the snapshot component, per definition.
  The differential component of a logical model is always empty.
  So it doesn't make sense to try and (re-)generate the snapshot for a logical model.
  Forge now detects logical models when saving and automatically bypasses snapshot generation.

* Support Default|Fixed|Pattern properties for elements with complex datatype derived from Quantity
  (Age, Distance, SimpleQuantity, Duration, Count, Money).

* Properly clear numeric values
  The previous release did not properly handle the clearing of a numeric value (e.g. Integer).
  Due to a databinding issue, Forge would always restore the original numeric value.
  This has now been fixed.

* Correctly persist manually added (custom) code systems in example values
  To facilitate constraining code systems, Forge provides a drop-down list of standard code systems
  and manually added custom user systems. In some circumstances, if the user manually typed in a
  new system url (e.g. when specifying a complex example value for a CodeableConcept element), Forge
  would not persist the new value to the underlying FHIR model.
  This issue has now been fixed.

* Suppress duplicate warnings from snapshot generation
  In some circumstances, after opening a profile, Forge would display duplicate warning
  messages originating from the snapshot generator, e.g. about missing extension definitions.
  Internally, Forge will actually call the snapshot generator twice,
  first to (re-)generate the regular snapshot, then again to expand the child
  elements of any remaining (unconstrained) elements with complex datatypes.
  Forge aggregates the generated warning messages from both runs.
  However subsequent executions can emit similar warning messages.
  The Forge user interface now removes any duplicate issues before display.

* Fix broken support for Oid datatype
  Corrected invalid datatype conversion for Oid values.
  Previously, Forge would internally try to store Oid values as an Uri.
  This would cause runtime datatype conversion errors, e.g. when creating a new profile on ImagingStudy.

* Update hyperlink to official FHIR documentation page about resource maturity level
  The maturity level documentation has been moved to a new location: http://hl7.org/fhir/versions.html#maturity
  (Old location: http://hl7.org/fhir/resource.html#maturity)

* Allow user to correct invalid IsModifier constraint
  According to FHIR, "Only the definition of an element can set IsModifier true".
  This implies that derived profiles are not allowed to override the IsModifier attribute.
  For this reason, Forge disables the IsModifier checkbox control by default.
  However this also prevents users from correcting any invalid IsModifier constraints.
  Forge now enables the IsModifier checkbox control when it detects that the value is invalid.

* Allow user to correct invalid IsSummary constraint (cf. IsModifier)

* Disallow user to toggle Derivation property
  Forge initializes the value of the StructureDefinition.derivation property when creating a new StructureDefinition,
  according the FHIR rules. To prevent changes, the derivation property is now read-only in the UI.

* When loading a profile, also expand elements constrained to a resource type
  When you constrain an element to a complex type, Forge expands the child elements of the selected type.
  However if the selected type is a concrete resource (e.g. constrain Bundle.entry.resource to Patient),
  then Forge would not expand the element when (re-)loading the profile. This has now been fixed.
  Note: Forge will only expand elements constrained to a concrete resource type.
  Forge will not expand elements with abstract type Resource or DomainResource.

Known bugs
^^^^^^^^^^

* BUG: Cannot handle complex extension definitions that contain child element definitions without a slice name.
  (with a path of the form "Extension[.extension[...]].extension")
  If you try to open such a definition, Forge will discard all unnamed child extension elements.
  Also, if you open a profile that refers to such a definition, Forge will not expand the unnamed child elements.
  As a workaround, always explicitly assign unique (descriptive) slice names to all complex extension child elements.
  This also conveys the meaning/intent of extension child elements to end users.
  We will try to fix this issue in a future release (if possible, i.e. not ambiguous).

* BUG: Cache invalidation
  As deserialization and snapshot generation is a costly operation, Forge caches all loaded profiles.
  In some circumstances, Forge will not properly invalidate the internal profile cache after you open or save a profile.
  When you reload an open profile, Forge should resolve all external references from the latest target version on disk.
  However, if you notice that Forge does not pick up changes, please close and restart the application.
  Future releases will introduce improvements to the internal caching layer.

Forge 16.5.1
------------
This release is a minor update that fixes some bugs reported by the community.

* Remove unnecessary dependencies
  The previous releases included some assemblies from the new .NET Core platform.
  Except for System.ValueTuple, these external dependencies proved to be unnecessary and have been removed.

FHIR API
^^^^^^^^

* Update FHIR API library to 0.93.6-alpha2

  Fixed: the snapshot generator would sometimes incorrectly generate warnings for profiled type slices
  (e.g. SimpleQuantity), as it would only try to match the specified profile constraint to the first base
  element type. This has been fixed, the snapshot generator now considers all base element types.

  Fixed: the DirectorySource class, responsible for fetching resources from folders on disk and used by
  the snapshot generator, now gracefully handles (i.e. silently ignores) invalid/unrecognized JSON files
  in the target folder.
  In previous releases, invalid files could cause the operation to abort with a runtime error:
  "ArgumentNullException in Hl7.Fhir.STU3.Specification: Value cannot be null. Parameter name: resourceType"

Bug fixes
^^^^^^^^^

* Generate element id for extension slicing entries
  The previous release would generate extension slicing entries without an element id.
  This has been fixed.

* Element grid: show SliceName values
  In the previous release, the grid view did not correctly display sliceNames b/o a broken databinding.
  This has been fixed.

* Element grid: remove example column
  The example column as been removed, since the example element has become a list in STU3.

* Element grid: fix horizontal scoll oscillation
  In some circumstances, scrolling the element grid horizontally would trigger an infinite resizing loop.
  The combination of auto-sizing column widths and dynamic scrollbar visibility can cause this behavior.
  As a workaround, the scrollbars are now permanently visible.

* Fix splitter bars
  Sometimes the splitter bars would get stuck during a drag operation and refuse to move any furthere.
  Apparently this behavior is caused by an issue in the standard WPF control.
  Forge now implements a workaround for this issue.

* Fix element tooltip
  The element tooltip text would not show the comment property value, due to a broken databinding.
  This has been fixed.

Forge 16.5
----------
This update fixes some issues reported by the community
and also introduces a couple of usability improvements.

As always, users are encouraged to update to the current version.

FHIR API
^^^^^^^^

* Update FHIR API library to 0.93.5-beta6
  Provides improvements for the directory source and snapshot generator.

* The directory source (responsible for resolving FHIR resources from folders on disk)
  has been updated to automatically ignore all files and folders with hidden or system attributes
  and also silently consume all runtime security exceptions due to insufficient access permissions.
  
* The snapshot generator now detects and gracefully handles invalid slice names on root elements.
  Specifically implemented to handle an error in the FHIR STU3 specification:
  The core definition of SimpleQuantity datatype introduces a slice name on the root element (invalid!).
  This caused unexpected tooling issues downstream. Due to the new workaround in the API,
  Forge will now automatically handle and correct this error.

  Note: if you open a profile in Forge that references the SimpleQuantity datatype, Forge will try
  to generate the snapshot of the standard SimpleQuantity datatype definition. This will now
  (correctly!) trigger a validation warning complaining about an invalid sliceName on the root element.
  However, in this specific situation, you can safely ignore the error message.
  Note that Forge will only display this error message once per session (since generated snapshots are
  being cached in memory).
  This known issue in the FHIR standard has been submitted to GForge (#13740):
  https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=13740
  When a new version of the FHIR standard is published that fixes the bug in the SimpleQuantity
  core definition, Forge will stop complaining.

Feature
^^^^^^^

* Automatically initialize default slicing discriminator for type slices
  When you slice a choice type element (e.g. "value[x]"), Forge now automatically
  initializes the default discriminator for a type slice: { Type="Type", Path="$this" }
  Syntax is defined here: https://www.hl7.org/fhir/profiling.html#discriminator

* New: FHIR Path expression validation
  Forge can now validate FHIRPath expressions specified in ElementDefinition.constraint.expression
  property values by trying to parse it. Forge will only validate custom FHIRPath expressions introduced
  by the current profile. Forge does not validate expressions inherited from the base profile.
  The Options menu provides a new application configuration setting to enable/disable this feature.

Bug fixes
^^^^^^^^^

* EXPERIMENTAL! Improved matching of base element types
  For each element type in a profile, Forge needs to determine the associated element type in the base profile.
  Originally, Forge performed an ordered merge, associating types and base types at the same list position.
  However element types are not ordered. Also multiple type constraints can refer to a single common base type.
  In this release, the matching logic has been improved to properly scan for the best matching base type,
  i.e. the most compatible base type / nearest in the type inheritance hierarchy.

* Serialize constraints on meta.security.* and meta.tag.* elements to differential in proper order
  Constraints on meta.security.* and meta.tag.* child elements would be serialized to the differential in invalid order.
  On reload, Forge would display a validation error and the element constraints would be orphaned.
  This has been fixed. Constraints on common child elements are now serialized in the correct order.

* eld-16 sliceName validation
  The regular expression to validate slice names was incorrectly escaped,
  causing Forge to generate validation warnings for correct slice names (e.g. with a hyphen "-").
  This has been fixed.

* Explicitly remove old child constraints after updating element type
  When you modify type constraints of an element, Forge synchronizes the displayed child
  elements according to the new element type, i.e. remove all existing child element
  constraints and re-expand new children if constrained to a single type.
  In the previous release, old child element constraints would no longer be visible in the UI
  but would sometimes remain to exist in the internal FHIR resource and the serialized XML.
  This has been fixed. Forge now explicitly syncs the StructureDefinition after processing
  the element type change.

* Import resources from FHIR server and/or Simplifier
  In some circumstances, when trying to import an online resource from a FHIR server or Simplifier,
  Forge would abort with a runtime exception "The given path's format is not supported".
  This issue has been fixed.

* Fix broken hyperlink to Furore news page on Simplifier
  https://simplifier.net/ui/Organization/Furore

Forge 16.4.1
------------
This release is a small patch with some additional bug fixes.

Features
^^^^^^^^

* Validate constraint sdf-19: Custom types can only be used in logical models

* Validate constraint eld-16: sliceName must be composed of proper tokens separated by "/"

* Save some memory by packing viewmodel boolean states into bit flags

Bug fixes
^^^^^^^^^

* Fix extension context selection dialog
  The dialog window would not close when trying to select a resource.
  This has been fixed.

* Global StructureDefinition metadata is not inheritable
  When you create a new profile, Forge will no longer inherit global meta data from the base profile,
  as specified information (e.g. publisher, contact info etcetera) usually only applies to the
  defining profile and not to any derived profiles.
  Forge now initializes a set of critical key properties and clears all other property values.


Forge 16.4 for HL7 FHIR STU3
----------------------------
This release brings additional compatibility/stability updates and also a couple of UI improvements.

Improvements
^^^^^^^^^^^^

* Update FHIR API library to 0.93.5-beta2
  Includes bug fixes for the snapshot generator and element id generator

* Improved memory cache invalidation
  As snapshot generation is a performance intensive operation, snapshots are cached in memory.
  In previous releases, Forge would sometimes operate on an outdated cached profile version
  (instead of a newer version on disk). Only an application restart would fully clear the memory cache.
  
  Forge now invalidates the memory cache whenever you save a profile to disk, including dependencies.
  If you subsequently open or reload another profile that references the updated profile
  (via base profile or an element type profile), Forge will now automatically re-generate
  the snapshot based on the latest version of the target profile.

  Note: file management and memory caching is currently under active development
  and will be further improved in future releases.

* Support ElementDefinition.type.versioning property
  Forge now also exposes the element type versioning property.
  This property only applies to ResourceReference elements.
  Forge hides the versioning property for all other element types (unless not empty).

* Hide sliceName property for non-sliced elements
  SliceName property is now only visible for actual slices (including extensions),
  where it makes sense to actually specify a slice name value.

* Context menu for structure elements
  The treeview elements now also expose a context menu.
  The menu exposes the same commands as the toolbar on top.
  To open the menu, right-click on any element in the tree.

* Only re-expand child elements after relevant type changes
  (Requested by Grahame Grieve)
  If you modify an element type, Forge will try to re-expand the associated child elements.
  However re-expansion is a destructive operation that discards any existing user-defined constraints on child elements.
  Forge now tries to prevent unnecessary re-expansion whenever it can safely determine so.
  Specifically, editing the target profile of a ResourceReference no longer forces re-expansion.
  Also, re-expansion is skipped if the change doesn't actually affect the common element type and/or profile.

* Support example values on root elements
  (Requested by Simone Heckmann)
  Forge now also allows you to specify an example value on the root element level.
  Also, you can now specify example values of datatypes Address and HumanName.
  Note: Forge supports example values for most (but not all) of the FHIR core datatypes, but not for resource types.
  Also, the relevant UI components are hardcoded for the official core datatype profiles.
  So e.g. you currently cannot specify example values for extension elements in custom datatype profiles.

* Derived profiles no longer inherit the official Working Group extension
  (Requested by Simone Heckmann)
  FHIR defines several official extensions specifically intended to be used in core profile definitions:
  http://hl7.org/fhir/StructureDefinition/structuredefinition-wg  => Indicates owning working group
  http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm => Indicates maturity level
  These extensions should not be inherited by derived profiles.
  Previous Forge releases already removed the maturity level extension.
  Forge now removes both extensions when creating a new profile on a core resource or datatype.
  Note: The extension url's are configurable via the application setting "NonInheritableCoreProfileExtensionUris".

* Duplicate command generates a new unique filename
  The Duplicate command creates a separate copy of the selected resource.
  Previously, the duplicate item inherited the original filename.
  Now, Forge assigns a new, unique filename to the duplicate item.
  This prevents the user from inadvertently overwriting the original file.

* Remove obsolete help menu command "Convert your resources to DSTU2"
  The command opened an external browser window and navigated to http://http://transformers.simplifier.net/
  The online conversion tool supports the conversion of DSTU1 resources to DSTU2 format.
  As the conversion tool has not been updated for STU3, the command has become obsolete.

* Include status code in connection error messages
  If a server connection error occurs, Forge now includes the returned status code in the displayed error message.
  This is especially helpful in case of invalid/missing credentials (status Unauthorized).

* Tooltip duration is now configurable
  You can now configure the default tooltip display duration via the new application
  configuration setting "TooltipShowDuration" (in milliseconds).
  Note: you can customize this value by manually editing the application configuration settings.
  The default duration has been increased to 30s.

* Add Simplifier image link to header bar
  The header bar now also displays the Simplifier logo.
  Click on the logo to visit http://simplifier.net

Bug fixes
^^^^^^^^^

* Generate correct element ids for child elements of slices
  In some circumstances, the previous release would generate incorrect element ids (esp. for children of slice elements).
  This has now been fixed.

* Save constraints in derived profiles to output
  In the previous release, some constraints in derived profiles were sometimes not detected as a "change".
  When opening a derived profile, Forge would display all the profile constraints, but without a yellow pen;
  as a result, when saving back the profile, the existing profile constraints were excluded from the output.
  This has now been fixed.

* Handle constraints on inherited slice entry
  Previously, Forge would not allow a derived profile to further constrain a slice entry defined in the base profile.
  When opening the profile, Forge would discard the slice entry constraints and display a warning message:

  - "Element ... defines a slice without a name. Individual slices must always have a unique name, except extensions."

  This issue has been fixed.
  Forge now allows a derived profile to further constrain a slice entry inherited from the base profile.

* Named slices never inherit minimum cardinality from base profile
  In the previous release, Forge sometimes didn't detect constraints on minimum cardinality of a named slice.
  As a result, when saving the profile, the cardinality constraints would be excluded from the output.
  This has been fixed; Forge now properly detects minimum cardinality constraints on named slices.
  Named slices always have a default minimum cardinality of 0, per definition.
  Specifically, named slices should NOT inherit the minimum cardinality from the associated base profile element.
  In other words, any value other than 0 should be considered a constraint and be included in the serialized output.

* Assign StructureDefinition.type for logical models
  (Reported by Richard Kavanagh)
  In the previous release, Forge did not assign any value to the mandatory StructureDefinition.type property for logical models.
  As you cannot manually edit the Type property in Forge, this would always generate a validation warning.
  Forge now initializes and synchronizes the StructureDefinition.Type property from the (user-assigned) root model element name,
  to satisfy invariant sdf-11: "If there's a type, its content must match the path name in the first element of a snapshot"

* Always include StructureDefinition.derivation property in serialized output.
  The previous release would exclude the derivation property from derived profiles.
  This has been fixed.

* Fix invalid UI databindings to ElementDefinition.comment(s) property.
  UI bindings for tooltips and grid view were still referring to the old DSTU2 property name,
  preventing comment property values from being displayed. This has been fixed.

* Fix logic for type.profile & type.targetProfile
  Forge tries to generate selection options for compatible element types, based on currently open profiles.
  In the previous STU3 Forge releases, the generated options would sometimes mix up initialization of
  the type.profile and type.targetProfile properties. Selecting such an invalid type option would generate
  a profile validation error. This has been fixed.

* Fix choice type element renaming in slices
  The FHIR specification states that choice type elements are renamed when constrained to a single datatype.
  In some circumstances, Forge would not rename constrained choice type elements directly below a newly
  created named slice, as a result of missing ElementDefinition.Base components. This has been fixed.
  Forge now explicitly initializes missing ElementDefinition.Base components when expanding the child elements of
  a new named slice with a complex element type. This is specifically necessary when the base profile is a core
  resource definition.

* Fix null reference exception when opening profile
  In some circumstances, Forge would generate a runtime exception when opening certain profiles
  that specified slice names on un-sliced elements. This has been fixed.

* Allow manual correction of invalid target profiles
  According to the FHIR specification, the ElementDefinition.type.targetProfile property only applies
  to elements of type ResourceReference. Forge only displays the targetProfile property for Reference
  elements and hides the property for all other element types. Forge generates a validation warning if
  a profile specifies a target profile for a non-reference element. However in previous versions, the
  user could not correct the invalid targetProfile, as the property was hidden.
  Forge now always displays a non-empty targetProfile value, even if it is invalid. This allows the user
  to correct invalid target profiles. When the user clears an invalid targetProfile value, the validation
  warning will disappear and Forge will hide the property.
  Note: in some circumstances, when you try to clear an (invalid) targetProfile value, Forge may restore
  the original property value. However you can still remove the type constraint by deselecting it.

* Properly initialize StructureDefinition.ContextType property from selected extension Context
  After selecting a target resource, datatype or element, Forge will automatically initialize
  the associated ContextType property, depending on the selected value.

Forge 16.1 for HL7 FHIR STU3
----------------------------
This release is a minor update that fixes a couple of issues in the initial Madrid STU3 release.
Some known issues haven't been fixed yet, as we did not want to delay publication of this update
any further. We'll try to fix any remaining issues in the next update.
If you find any more issues, then please submit a bug report to forge@furore.com.

Improvements
^^^^^^^^^^^^

* Update FHIR API library to 0.93.5-alpha1
  Provides updated logic for generating element ids (see below)

* New command Options / Reset application settings
  This command allows you to revert the application configuration settings to the default values.

Bug fixes
^^^^^^^^^

* Fix support for ElementDefinition.Id
  In FHIR STU3, the ElementDefinition.Id property is required and the value should conform to specific rules.
  The initial Forge STU3 release introduced preliminary support for element Ids. However the implemented logic
  was not yet fully compliant to the FHIR spec. There was some further discussion about element IDs in the
  FHIR Core team and we've tried to update the implementation accordingly.
  Specifically:

  - Forge automatically generates element id values for all (constrained) element definitions
  - Forge always serializes the generated ids for all (constrained) element definitions in the differential component
  - Forge generates each element id from the element names and slice names of parent elements:
    elementName[:sliceName].elementName[:sliceName]...
  - User cannot override the generated element ids
  - Forge automatically updates element ids when necessary, e.g. if you rename a parent slice

  Note: there is a known issue in the current API element id generation logic concerning sliced elements.
  In some circumstances, the slice name may not be included in the generated element id.
  Unfortunately we couldn't fix this issue in time for this release.

* Fix error when creating new implementation guide
  The New Implementation Guide command was broken and generated an error message.
  The error was caused because of some old DSTU2 logic that still needed to be updated to STU3.
  This has now been fixed.

* Fix error when publishing profile to Simplifier
  The Publish to Simplifier command would generate an error "This operation is not supported for a relative URL".
  This was caused because some logic stumbled over a new default FHIR server address in the application default settings
  "test.fhir.org/r3" (required http:// prefix is missing).
  We've updated the server address in the default application settings to "http://test.fhir.org/r3".
  We've also improved the offending logic to gracefully handle invalid server urls.

* Don't inherit Resource.id
  In the previous release, a new profile would inherit the resource id from the base profile.
  However resource ids must be unique per resource, per definition, so they should never be inherited.
  In practice, when you publish a profile with a specific resource ID to a FHIR server, then the server
  is free to ignore the specified identifier and assign a different unique ID.
  However for clarity, we changed this property to no longer inherit it's value from the base profile.
  After publishing a profile to a FHIR server (or Simplifier) from Forge, Forge will update the UI
  in order to display the actual resource identifier that was assigned by the server.

* Fix handling of custom urls for profile extensions
  Profile extension elements are mapped to extension definitions.
  Forge provides a drop-down combobox to easily map to one of the currently loaded extension definitions,
  and also the option "other..." for manually entering a custom extension definition url.
  However in the initial STU3 release, that last option was broken; specified custom url's were not serialized to the output.
  This has been fixed.

* Fix compatible profile options for resource references
  In some circumstances, Forge would generate invalid target profile selection options for resource references.
  The type.profile property would be initialized with the value intended for the type.targetProfile property.
  This has now been fixed.

Forge 15.7 for HL7 FHIR STU3 - Madrid 2017 Edition
--------------------------------------------------
This is a new major application release that introduces support for FHIR STU3.

FHIR STU3 introduces a number of breaking changes.
Therefore the new Forge STU3 release is not compatible with FHIR DSTU2 profiles.
You can install Forge STU3 next to Forge DSTU2 on the same machine.
You can remain using Forge for DSTU2 to manage your existing DSTU2 profiles for as long as you need.
However from now on, we will focus our development efforts towards Forge for STU3.
Forge for DSTU2 will no longer be actively developed.

Improvements
^^^^^^^^^^^^

* Using FHIR .NET API STU3 library version 0.93.4-alpha3
  The new API release introduces support for FHIR STU3.
  It also provides a number of bug fixes for the snapshot generator,
  including improved handling of external element type profiles.

* New application identity
  The Forge STU3 release branch has a new application identity, different from the previous DSTU2 releases.
  This allows you to install and run both DSTU2 and STU3 Forge releases on the same machine.

* Compliant with FHIR STU3!
  FHIR STU3 introduces some relatively minor changes to StructureDefinition and ElementDefinition.
  Notably:
  
  - ElementDefinition.type.profile : cardinality has changed from 0...* to 0...1
    So you can no longer introduce multiple type profiles on an element.
    This turned out to be ambiguous for e.g. code/UI generation.
    And no systems seemed to support it, so it was removed.
  - ElementDefinition.type.targetProfile : new
    This property only applies to elements of type ResourceReference.
    The target profile constrains the reference target.
    (cf. type.profile constrains the element type itself = profile on ResourceReference)
  - ElementDefinition.slicing.discriminator
    In DSTU2, the discriminator is a string property that accepts some special values (@type | @profile).
    in STU3, discriminator is a component with separate child elements .type (value | exists | pattern | type | profile) and .path
    Special path values @type and @profile are obsolete and no longer necessary/accepted.
  - ElementDefinition.example
    DSTU2 defines .example[x] as a choice type list element.
    In STU3, .example represents a list of example components with child elements .label and .value[x].
  - ElementDefinition.constraint.expression
    This property accepts a FhirPath expression, as an alternative to the existing .xpath property.

* EXPERIMENTAL - Support element id
  Forge now allows you to view and edit the ElementDefinition.id property.
  FHIR defines a preferred scheme for generating element IDs based on element paths and slice names.
  For example, "Patient.identifier:SSN.system"
  A constraining profile inherits existing element IDs from it's base profile.
  However a profile never inherits element IDs from referenced element type profiles.
  Forge displays the inherited or suggested default element ID.
  Forge initializes a suggested default ID for new element constraints (slices, extensions).
  Forge excludes element IDs from the differential, unless you explicitly override them.
  Forge always includes element IDs in the snapshot (if snapshot generation is enabled).
  Note: this functionality is fairly new and immature, so use with caution.
  Please don't hesitate to contact us about issues or improvements.

* Allow element type constraints on slice entry
  In previous Forge releases, the element type was hidden for slice entries.
  Forge now allows you to specify global type constraints on the slice entry.

* Improved display of OperationOutcome issues (e.g. returned by the Snapshot Generator)
  Issues are now displayed in a scrollable grid.
  Press Ctrl+C to copy issue details to the clipboard (as plain text).

* Online Forge documentation moved to http://docs.simplifier.net/forge/
  Press F1 to open the online documentation website in your default webbrowser.

* Change default addres of Grahame Grieve's FHIR server to http://test.fhir.org/r3

Bug fixes
^^^^^^^^^

* More precise handling and serialization of specialized integer types: Integer | UnsignedInt | PositiveInt
  Sanitize input, (dis)allow negative values

* More precise handling and serialization of specialized date/time types: Instant | DateTime | Date | Time
  Ensure proper formatting of date/time values according to FHIR serialization rules.
  Present DateTime and Date with DatePicker controls.
  Present Time and Instant values with TextBox controls that show an input hint describing the expected format
  Limitations:

  - Editing time and timezone part of a DateTime value is not yet supported
    Due to limitations of the WPF DatePicker control, you can only specify the date part of a DateTime value.
  - Partial dates are not yet supported
    FHIR DateTime allows partial values, e.g. year or year-month.
    Forge does not yet support this, due to limitations of the WPF DatePicker control.

* Maintain existing constraints on sliced elements
  The previous Forge release removes certain constraints on slice entry elements (e.g. when loading a sliced profile).
  This has been fixed, all existing constraints are now maintained.

* Properly represent fixed[x] etc. property constraints for elements of type UnsignedInt | PositiveInt
  e.g. Appointment.priority and Appointment.MinutesDuration

* Fix a bug where Forge would add redundant extension slicing components to the generated differential
  of a profile that defines constraints on child elements of a referenced complex extension.

* Properly toggle the state of the extension.value[x] element for simple/complex extension elements.
  For complex extension elements (with extension child elements):

  - Hide the .value[x] child element 
  - Constraint cardinality Min to 0 (if part of extension definition)

  For simple extension elements (without extension child elements):

  - Show the .value[x] child element
  - Reset cardinality Min to 1 (if part of extension definition)

* Improved support for choice type element renaming
  Forge now also supports the renaming of choice type elements (e.g. value[x])
  with multiple type constraints that share a single common type code.
  For example, when the element type is constrained to multiple ResourceReference types for different profiles.
  
* Fix profile cross reference change tracking
  Forge monitors cross references inbetween opened profiles.
  In some circumstances, Forge would generate duplicate identical element type options when opening a target type profile.
  In some circurmstances, Forge would remove existing named slices when closing the associated target type profile.
  These bugs have been fixed.

* Prevent duplicate element type options
  In some circumstances, Forge would generate duplicate identical element type options to other open profiles.
  This has been fixed.

* Expand children of choice type elements with multiple type constraints for a single common type code

* Correct invalid system uri (reported by Brian Reinhold)
  The default list of system identifiers contained an invalid URI.
  Correction: "urn:std:iso:11073:10101" => "urn:iso:std:iso:11073:10101"

Release 15.4 for HL7 FHIR DSTU2
-------------------------------
This release introduces some new profiling features and also brings a large number of improvements and bug fixes.

Renewed code signing certificate
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The Forge binaries and installer are signed using PKI technology in order to securely identify Furore as the original publisher.
The code signing certificate has been renewed, as the previous certificate is now expired.
Initially, the renewed certificate may trigger a warning from Windows SmartScreen.
You can safely click on More information... / Run Anyway to continue, after verifying that the displayed publisher credentials identify Furore.
Eventually the warning should eventually disappear, as the application has gained sufficient Smartscreen "reputation".

Update FHIR .NET API library to 0.91.2-alpha6
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The API update provides a number of bug fixes:

- DirectoryResolver: ignore all invalid XML files that are present in the target folder.
  Previously, the API would abort with a runtime exception, causing the current (Load/Save) operation to fail.

- Snapshot Generator: determine correct base element for slices
  In the previous version, slice elements were merged with constraints from the preceding slice entry in the same profile.
  This would e.g. result in invididual named slices picking up the cardinality constraints from the preceding slice entry.
  This is incorrect; slices must be merged with constraints from the base element (slice entry) in the *base* profile.
  Named slices now always have a base minimum cardinality of 0.

- Snapshot Generator: determine correct base element for inlined element type profiles and profile extensions.
  The previous release sometimes calculated an incorrect base element.
  This could lead to redundant information in the generated differential component.

- Snapshot Generator: Fix merging of external type profiles
  In some circumstances, referenced external type profiles were not merged correctly.
  This has been fixed.

- Snapshot Generator: Fix merging of complex element properties (Binding, Slicing)
  In the previous release, complex components such as Binding and Slicing in a derived profile would completely replace the component in the base profile.
  However component properties missing from the differential would not be inherited from the base profile.
  In the current release, all component properties missing from the derived profile are inherited from the base profile component.
  As a result, all element bindings in the snapshot component are now fully expanded.

- Snapshot Generator: Merge common constraints on choice type element w/o type slice, e.g. (modifier)extension
  The snapshot generator now supports child constraints on choice type elements with multiple types, provided that all types share the same type code.
  This allows you to e.g. define a common extension constraint that applies to all the different type choices.

- Snapshot Generator: fix merging of renamed choice type elements
  In some circumstances, the snapshot generator did not correctly merge a renamed choice type element in the differential (e.g. valueQuantity)
  with the associated element in the base profile (e.g. value[x]), resulting in duplicate elements in the snapshot. This is now fixed.

- Snapshot Generator: Performance improvements

Features & Improvements
^^^^^^^^^^^^^^^^^^^^^^^

- NEW! Dynamically re-generate children after element type change
  If you modify an element type, Forge now dynamically re-generates the child elements.
  If you constrain an element to a single complex type, then Forge will expand the complex type structure inline.
  Otherwise Forge will collapse any existing child elements.

- NEW! defaultValue[x] | fixed[x] | pattern[x] | example[x] properties now support some complex datatypes:
  - Coding, CodeableConcept
  - ContactPoint, Identifier, Period
  - Quantity => Age, Distance, SimpleQuantity, Duration, Count, Money
  - Range, Ratio
  - ResourceReference
  Also the minValue[x] and maxValue[x] properties now support Quantity and subtypes (in addition to primitives).
  Note: the remaining complex datatypes are not yet supported, but can be added on demand.
  Contact us if you require support for additional datatypes.

- Prevent un-slicing if base element is sliced
  You cannot un-slice an element in a derived profile if the slicing is inherited from the base profile.

- Allow slicing of elements with maximum cardinality equal to 1
  Previous Forge releases allowed slicing of list elements (max > 1) and choice type elements (#types > 1).
  Forge now also allows you to slice a singular element (max = 1), e.g. to define several mutually exclusive complex constraints.

- Prevent removal and re-ordering of inherited slices, extensions, constraints, conditions, mappings, aliases
  FHIR does not allow you to remove and re-order collection items that are inherited from the base profile.
  This applies to
  - slice elements & extension elements
  - list property items: constraints, conditions, mappings, aliases
  Forge now actively enforces these business rules.
  The application only allows you to remove and re-order items that are defined by the current profile itself.
  You cannot remove/move collection items inherited from the base profile.

- Basic support for loading profiles with closed .extension slices (max = 0)
  Note: Forge auto-generates .extension elements, they are not (yet) visible in the UI and you cannot manually constrain them.
  Therefore, you cannot (yet) close the child extension slice and/or customize the default extension discriminator from within Forge.
  However Forge can now open profiles with such constraints (e.g. created manually or in another tool).

- Hide MustSupport property for extension definitions
  FHIR only allows MustSupport constraints on profile elements (and/or extensions).
  An Extension Definition is not allowed to constrain this property.

Usability improvements
^^^^^^^^^^^^^^^^^^^^^^

- Show tooltips on treeview elements & property labels
  Forge now displays a helpful tooltip on elements in the treeview and on property labels.
  The tooltip includes the element path, cardinality, comment and definition properties (if not empty).
  For profile elements, the displayed information is resolved from the current profile.
  For element properties, the displayed information is resolved from the FHIR core definitions.

- New context menu for validation messages

  - Navigate to... : set focus to the target input control of the selected validation message
  - Copy           : copy the selected validation message to the clipboard
  - Copy All       : copy all validation messages to the clipboard

- Open recent documents from the Session item context menu
  Right-click on a session folder to access the context menu and quickly open recent profiles.

- Import application configuration settings from previous version after update
  After installing an application update, Forge now tries to import the old configuration settings.

- Automatically clear out-of-date binary disk cache items at startup
  Forge uses a custom binary serializer for the FHIR core definitions, in order to accelerate application startup.
  The binary cache is automatically created during application startup if necessary.
  Forge now automatically deletes and regenerates outdated cache items (i.e. older than the core ZIP file in the application directory).

- Force commit edit before save
  In previous releases, the Save command may ignore a dirty (modified) value in the active input control.
  So the saved output would not reflect the updated value of the property that was being edited.
  The Save command now tries to force the active input control to commit any dirty changes before saving.

- Automatically expand treeview items with (nested) profiling constraints
  When loading a profile:

  - In the element property panel, expand all (complex/list) properties (such as aliases, bindings, mappings etc.) with profiling constraints
  - Optionally, in the element treeview, expand all elements with (nested) profiling constraints
    You can toggle this behavior via the menu option "Expand all constrained elements on load" (off by default).

- Double click on validation message to select invalid target element (e.g. w/o corresponding element in base profile)
- Double click on validation message to select invalid extension selection property (e.g. invalid extension context)

- ExtensionDefinition.Context selection dialog
  Don't display yellow pen in the element tree of the extension context selection dialog

- Optimize element type constraints
  Forge now responds faster when you constrain the element type(s) of a polymorphic type choice element.

- About box
  In previous releases, the modal About box dialog could sometimes disappear behind the (disabled) main window.
  This would impede the user from closing the about box and re-enabling the main window.
  In the current release, the about box should always stay on top of the main window.

Stability improvements
^^^^^^^^^^^^^^^^^^^^^^

- Improved cleanup after unexpected errors while opening a profile
  If an error occurs while loading a profile, Forge now properly cleans up the invalid application state.

- Loosen coupling between UI and ViewModels
  Forge now has a stricter separation between the (WPF) UI components and the underlying (abstract) viewmodels.
  This facilitates maintenance and further UI development.

- Improved error dialog
  Null Reference exceptions indicate brittle application logic and should never occur at runtime.
  Force now displays source & origin of an unexpected Null Reference exception, for error reporting.
  If you encounter a Null Reference exception, then please report it so we can improve application stability.

Bug fixes
^^^^^^^^^

- Force serialization of StructureDefinition.fhirVersion
  The fhirVersion property was no longer serialized, as the value is always equal to the base (per definition).
  Serialization of fhirVersion is now forced, so it will always be included in the output.

- Correctly initialize named slices
  Previously, Forge did not determine the correct base element for named slices.
  As a result, named slices would inherit property values from the slice entry (in the same profile) - which is wrong.
  Forge now resolves the correct base element for named slices from the underlying base profile,
  in order to inherit the proper base element properties and serialize only constraints wrt base to the differential.
  Special behavior for named slices:

  - Named slices never inherit a slicing component from the (sliced) base element.
  - Named slices never inherit a minimum cardinality constraint from the (constrained) base element;
    Named slices always have a base minimum cardinality of 0, to allow any profile to introduce optional slices.
  - Forge initializes the maximum cardinality of newly created named slices by copying the value from the associated slice entry.
    From a profiling perspective, this is not strictly necessary and therefore redundant, but it makes the slice definitions more explicit.
    Note that the maximum cardinality of the slice entry limits the total number of slices, so even if a specific named slice
    defines a larger maximum cardinality, the total number of allowed occurances is still limited by the slice entry cardinality.
    This behavior is implemented purely for convenience.
    The base maximum cardinality is still inherited from the associated base element.
    So the maximum cardinality of a named slice is included in the differential if it deviates from the base.

- Fix invalid clean up of element mappings
  When opening a profile, previous Forge releases would scan for element mappings that share a common mapping identifier
  and remove all but the first mapping. However, a FHIR profile is allowed to define multiple element mappings for the
  same mapping identifier. The invalid clean up logic has now been removed.

- Don't repeat StructureDefinition.context and .contextType properties in the meta properties of an extension definition

- Don't disable binding if constrained
  If an element has max cardinality 0, then by default, Forge disables the element binding controls (to prevent meaningless constraints).
  In this release, an element binding is never disabled if constrained, so yet can edit/remove the constraints.

- Fix element type selection
  In some cases, an element type checkbox was disabled, preventing the user from deselecting the type.
  This has now been fixed.

- Fix element type profile change tracking
  In some cases, an element type profile would display a yellow pen icon while actually equal to base.
  This has been fixed for the common case of a single element type profile.
  Note: multiple profiles per element type is strongly discouraged and has been deprecated in STU3.

- Hide [...].modifierExtension.url child elements
  extension.url child elements are auto-generated by Forge and always hidden in the UI.
  However modifierExtension.url child elements were sometimes visible; this has been fixed.

- Restore validation warning for unknown elements
  Forge displays a validation message if a resource profile contains an unknown element (no corresponding element in base profile)

- Improve validation of extension context
  Forge now verifies that profile extension elements are used in a valid context, by matching the context(s) specified in the extension definition

- Include "*" max cardinality constraint in differential
  In rare circumstances, Forge would exclude an (invalid) max cardinality constraint from the differential.
  This has now been fixed.

- Ensure clean up of associated validation messages after removing collection item
  In some circumstances, an out-of-date validation message would remain visible after the originating item was removed (e.g. element type).

- Always update child elements after editing type(s) of a choice type element.
  In some circumstances, Forge would not properly remove child elements after deselecting a (complex) type choice.
  This has now been fixed.

- Explicitly exclude empty time segment from serialized datetime values
  i.e. if a FhirDateTime only contains a date part and no time part, then don't serialize the time part to "T00:00:00".

- Improved change tracking w.r.t. external extension definitions
  When you modify an extension definition in Forge, then Forge sends out a change notification to any referencing profiles that are also opened.
  As a result, all referencing profiles would be marked "dirty" (i.e. as having unsaved changes), even if the change didn't actually affect the profile.
  Forge now tries to only send out change notifications for changes that actually affect referencing profiles.


Release 14.7 for DSTU2 1.02 - San Antonio 2017 Edition
------------------------------------------------------
This release introduces new advanced profiling features and fixes a number of issues.

Update FHIR .NET API library to 0.91.1
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The updated FHIR API library provides improved quality and standards compliance of snapshot generation,
mainly concerning advanced use cases such as (re-)slicing, type slicing and complex extensions.
Snapshot generator error handling and reporting has also been improved, returning descriptive OperationOutcome
issues for certain invalid inputs that previously generated runtime exceptions.
Forthcoming Forge updates will bring incremental UI improvements to unlock all the new advanced API features.

New features
^^^^^^^^^^^^

- Resolve and merge external datatype and extension profiles on load
  When opening a profile, Forge now tries to resolve all referenced external element type profiles and extension definitions.
  External references are resolved from the directory that contains the opened profile and from subdirectories below.
  Resolved structures are (rebased and) merged into the referencing profile, as subtrees of the referencing profile elements.
  
  This allows you to define inline constraints on child elements defined by external profiles and extensions
  from within your own profile, in order to override element constraints of the external structures.

  Forge now supports this behavior for:

  - elements mapped to a core type
  - elements mapped to a custom type profile
  - choice type elements constrained to a single (complex) datatype, e.g. value[x] => valueCodeableConcept
  - extension elements (mapped to an extension definition)

  Currently, you have to manually (save &) re-open the profile in order for Forge to re-expand all element type profiles.
  Dynamic expansion of external profiles may be implemented in a forthcoming release.

- Improved support and compliance for polymorphic choice type elements

  - Rename polymorphic choice type elements constrained to a single datatype (e.g. value[x] => valueCodeableConcept)
  - do NOT rename polymorphic choice type elements that supports multiple datatypes
  - do NOT rename type slice constraints of a polymorphic choice type element, even if constrained to a single datatype
  - Automatically fix invalid type slice renaming on load
    According to the FHIR spec, a choice type element (e.g. "value[x]") constrained to a single type may be renamed (to e.g. "valueCodeableConcept")
    However element renaming is not allowed for type slices, i.e. a sliced choice type element with multiple type constraints.
    Forge now automatically detects and corrects illegally renamed type slices when opening a profile.

- Support cardinality constraints on the root element of an Extension definition

UI improvements
^^^^^^^^^^^^^^^

- File Menu - Reload command (Ctrl+L)
  Reload the selected item from disk.
  If the item has unsaved changes, then ask for confirmation and save before reloading.
  If the item is new, then first save to disk.

- Help Menu - Help command (F1)
  Open the improved and updated online documentation at http://docs.simplifier.net/projects/forge-docs/

- Context-sensitive Help command (Ctrl+F1)
  Press Ctrl+F1 or click on the blue help (?) button in the element tree toolbar to
  open the online HL7 FHIR specification for the currently selected profile element.

- Help Menu - Fhirplace
  Add hyperlink to Ewout Kramer's online blog at https://thefhirplace.com/

- Help Menu - Feedback & Support
  Generated e-mail message template now includes some additional version information about FHIR API, .NET platform and OS (for debugging purposes)

Bugfixes
^^^^^^^^

- Improved overall stability and correctness due to various bugfixes in the FHIR API
- Fix incorrect validation warnings for valueset bindings
- Fix error when opening extension definitions
- Regenerate xml after creating new ExtensionDefinition
- Fix BackboneElement slicing - initialize child elements for new slice constraint
- Fix Add Slice in derived profile
- Fix icons in Element grid to indicate modified elements
- Fix choice type element renaming - only rename single type constraints; don't rename type slices
- Fix support for complex extension definitions
- Opening/closing profiles should not cause other related profiles to be considered "dirty" (i.e. having unsaved changes)
- Fix handling of elements without a type (e.g. value element of primitive type structure)
- Fix FormatException on machine using custom (nb-NO) regional settings (reported by Thomas Tveit Rosenlund)
- Handle unknown enum values (e.g. custom ResourceType) in FHIR Server Conformance statement
- Never mark excluded element type options as a constraint
- Don't mark profile as dirty when opening/closing referenced external extension definitions
- When adding a complex extension element, remove any existing type constraints from the Extension.value[x] element
- Force serialization of (named) parent slice if it has child element constraints
- If the element has only a single, fixed type, then prevent (de)selection
- Fix context-sensitive help sometimes navigating to incorrect page
- Fix Duplicate command

Best wishes for 2017 and happy profiling!


Release 14.4.1 for DSTU2 1.02 - FHIR DevDays 2016 Edition (hotfix)
------------------------------------------------------------------
This is a minor update with a couple of bug fixes.

Usability
^^^^^^^^^

- When creating a new profile or logical model, initialize the StructureDefinition.Date property (publishing date) to the current date
- slicing discriminator: initialize drop-down combobox with valid candidate element paths (elements with primitive or coded type)

Bug fixes
^^^^^^^^^

- Command New Logical Model was broken, is now fixed
- Discern actual FHIR core profiles from custom profiles published on same hl7.org domain (e.g. DAF)
- Derived profiles properly inherit & validate extension element types from base profile
- Always emit StructureDefinition.constrainedType for profiles and extension definitions (mandatory property)
- Support opening profiles without a root element definition

Release 14.4 for DSTU2 1.02 - FHIR DevDays 2016 Edition
-------------------------------------------------------

This update is still compatible with DSTU2 (1.02) but brings some major internal changes.
Large parts of critical application logic have been updated and/or replaced.
This was necessary in order to allow the implementation of support for advanced scenario's and use cases.
The new application logic is designed to provide improved reliability and output conformance.
Also application performance is improved and memory consumption decreased.

Warning! Due to the relatively large amount of high impact changes, this release probably introduces some regressions and new issues.
We are now focused on improving the stability and reliability of the updated application.
If you find any bugs, please let us know and we will try to fix them as soon as possible.

Note: we are changing the application workflow to an approach based on working folders.
Some internal parts of the application already use the new approach.
However in the current release this is not yet fully transparent to the end user, as the UI needs some work.
For the next release we are planning to improve the Session Explorer, to provide more insight and control in profile resolving.

Advice: keep related profiles together in a common working folder, to prevent unresolved external references.
Profiles are resolved by canonical url, which should uniquely identify each profile.
If your working folder contains multiple profiles sharing the same canonical url, then the application will fail to resolve the profile and show an error message.
If you encounter such an error, then please move the duplicates to a different folder (but not a subfolder!) or rename the file extension from ".xml" to e.g. ".bak".

- Upgrade FHIR .NET API to v0.90.6-alpha8 (internal release)
  Forge now leverages API functionality to perform snapshot generation.
  This improves the quality and conformance of the generated snapshots.
  
  Important!
  The API snapshot generator tries to resolve referenced profiles (base profile, extension definitions, element type profiles) from the containing folder.
  Future releases will provide more control over and insight into the resolving of external dependencies, e.g. from http://www.simplifier.net

- New: Derived Profiles a.k.a. Profiles on Profiles (!)
  Until now, Forge only supported profiles on core types and resources.
  Forge now also supports derived profiles, i.e. profiles based on another (custom) profile.
  Warning: this functionality is brand new, not fully feature complete and largely untested.
  Future Forge releases will provide additional support for advanced features such as reslicing.

- Rewrite differential tracking (!)
  Fundamental internal application logic has been completely redesigned and reimplemented to provide better control over the generated output differential.
  The new tracking mechanism is more efficient, uses far less memory and should be more reliable.
  This improvement also allowed the removal of a considerable amount of obsolete application logic.

- New: working folder
  A profile can have dependencies to external resources, such as the base profile, extension definitions, element type profiles, value sets etc.
  Forge now resolves external profile resources from the associated working directory (incl. subfolders).
  In the current beta release, Forge automatically initializes the profile working directory to the folder that contains the profile.
  In a future Forge release, we will update the Session Explorer to provide more insight into and control of working directories.

- New: prevent editing of inherited collection items
  FHIR defines that a profile inherits collection items such as mappings, element mappings, conditions and constraints from the base profile.
  Per definition, a derived profile cannot explicitly suppress or modify such inherited collection items.
  Forge now presents all the inherited collection items as disabled, so they cannot be constrained/deleted/moved.

- Removed obsolete configuration options
  The following configuration options are obsolete and have been removed:
  * Discard DomainResource.text profile element (=> always include; never discard)
  * Do not inherit maturity level extension from base resource (=> never inherit; always discard)
  * Include element base component in differential (=> never include; always discard)

- New command: Options / Open FHIR disk cache folder
  Forge now uses a special binary resource resolver in order to speed up loading the FHIR core profiles.
  On the first application start, the resolver creates a disk cache folder (below %TEMP%) and serializes all core profile definitions to a special binary format.
  This decreases the time needed to load all the core profiles, so the application starts faster.
  This command will open an Explorer window on the cache folder.

Know bugs
^^^^^^^^^

- Type slicing
  When loading a profile with a type slice (e.g. constraints on Patient.deceased[x] and Patient.deceasedDateTime),
  then the application does not correctly load the slice constraints.
  This is caused by a bug in the API snapshot generator and will be fixed in the next release.

- Probably more... please let us know!

Release 13.4 for DSTU2 1.02 (for SLA customers only)
----------------------------------------------------

Updated online documentation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We've updated the online Forge documentation at: http://docs.simplifier.net/projects/forge-docs/

Features
^^^^^^^^

- Upgrade FHIR .NET API to v0.90.6-alpha6 (internal release)
  The new API version supports flexible deserialization of unknown enum values.
  This allows Forge to support custom resource types.
  Also the API now provides functionality for snapshot expansion.

- Improved snapshot generation
  Forge now leverages the new FHIR .NET API snapshot expansion feature, instead of using custom application logic.
  The new implementation improves the quality and compliance of the generated snapshot.
  Results are now more in line with other FHIR tools/servers.

  The Options menu provides a set of configuration settings that control the behavior of snapshot expansion:

  - "Save snapshot component"
    Enable/disable expansion of the snapshot component.
    Snapshot expansion is disabled by default, as it increases the file size.

  - "Expand external profiles on demand"

    - enabled:

      automatically expand the snapshot of any referenced external profiles, if it is missing (in memory, not persisted).
    - disabled:

      abort upon encountering an external profile without a snapshot component.
      The user must ensure that all referenced external profiles contain a valid snapshot component.

  IMPORTANT!!!
  A profile may introduce element type constraints with external profile references.
  In order the fully expand the snapshot component, the API needs access to all referenced external profiles.
  The referenced external profiles should be located in the same file folder as the referencing profile (or in subfolders thereof).
  The API will first try to parse all xml files located in the containing folder (and subfolders).
  Therefore the folder structure should only contain valid and relevant FHIR resources.
  Note that the external profiles don't need to be open in Forge.
  Possible reasons for snapshot generation to fail:

  - the profile defines invalid constraints
  - the profile defines constraints that aren't supported yet by the snapshot expander, e.g. complex reslicing
  - the folder structure does not contain all referenced external profiles
  - the folder structure contains any invalid XML files
  - the folder structure contains multiple conformance resources with the same canonical url

User Interface
^^^^^^^^^^^^^^

- Gracefully handle profiles for unknown/invalid base resource types
  Forge now displays a friendly error message when opening a profile with an unknown base resource type (e.g. for STU3)

- The selection dialog now supports keyboard navigation for the resource and datatype comboboxes
  Type a letter to select the first/next combobox item with that prefix

- Slightly tweaked the design of the news feed
  Click the feed title to open the Furore news page on simplifier.net

Bug fixes
^^^^^^^^^

- Application would hang when opening online help on typed child elements

- By default, initialize slicing rules to "Open" (instead of "OpenAtEnd")

- Improve automatic expansion/merging of ElementDefinition.Binding and ElementDefinition.Mapping components
  Forge now merges these components on a per-property basis, to better handle components with partial constraints.
  Previous versions merged on component basis, i.e. either use the full component as defined by the user profile or, if missing, fall back to base component.
  However in some circumstances, unmodified component properties were not resolved from the base resource and would not be serialized to the output snapshot component.
  This has now been fixed.

- Fix incorrect element order in XML output
  In the previous version, the output order of elements inherited from (Domain)Resource was incorrect.
  These common elements were serialized after (modifier) extension elements, instead of before.
  This has now been fixed.

- Don't save redundant information to snapshot
  In the previous version, complex elements were always fully expanded in the snapshot.
  However, complex elements only need to be expanded in the snapshot if the differential defines any constraints on child elements.
  The new FHIR .NET API snapshot expansion logic omits any redundant information, thereby greatly reducing the output file size.

- Forge would hang when a complex extension element was recursively mapped to the containing extension definition itself.
  This has now been fixed.

- Merge extension elements with core element definition
  When loading a profile, (complex) extension elements are now merged with the core Extension profile definition.
  This ensures that all the (unconstrained) default aspects are properly initialized.

- Regenerate correct element base path
  When opening a profile, Forge would sometimes generate invalid element base paths, e.g. for choice type elements "value[x]".
  If you create a new profile with a choice type element (e.g. Extension.value[x]) and change the element type, Forge would rename the element.
  However, if you open a profile with a choice type element and change the element type, Forge would no longer rename the element.
  This has now been fixed.

Release 13.2 for DSTU2 1.02 Official version
--------------------------------------------
This update represents a minor release with lots of bugfixes and small functional improvements.

Functional improvements
^^^^^^^^^^^^^^^^^^^^^^^

- Validate extension element type
  Ensure that element type equals 'Extension'.
  Generate validation warning if not mapped to a valid extension definition.
- The NameReference property is now read-only
  This property is only allowed in core resource definitions (e.g. Composition.section.section) to express circular type definitions.
  User profiles are not allowed to introduce custom NameReference values.
- Clear the StructureDefinition.Date (publishing date) property for new profiles
  Previous versions of Forge copied the value from the base resource profile, but for this specific property that makes no sense.
- Add New Logical Model command to Session Explorer toolbar drop-down button
- Element.mapping.identifier property now shows a drop-down combobox with candidate id options
  The id option values are resolved from the global StructureDefinition.mapping.identifier definitions.
- New command in Options menu: Open application folder
  The ClickOnce installer puts the application files in a deeply nested folder that is hard to find.
  This command opens the application installation folder in Windows Explorer.
- New command in File menu: Open in External Application
  (also available in session explorer context menu)
  Open the selected resource via windows, using the default application registered for the (.xml) filetype
  This allows you to edit package entries that are not (fully) supported by Forge itself, e.g. ValueSets, example resources etc.
- Open Recent Document into currently selected folder
  If the currently selected item is a package, then add the recent file as a new package entry.
  If the currently selected item is a package entry, then add the recent file to the containing package.
  Otherwise open the file as a stand-alone resource within the session root.

Validation
^^^^^^^^^^
- New: Forge now validates that each StructureDefinition.mapping component has a unique identity value
- New: Forge now validates extension elements by verifying the context type and context path(s) of the underlying extension definition

User Interface
^^^^^^^^^^^^^^
- New command: show official documentation for the selected element
  The profile elements tree now provides a new toolbar command (with question mark "?" icon)
  to visit the official online FHIR documentation page for the selected profile element.
- The element grid view now highlights the current row header, to facilitate navigation while scrolling horizontally

Optimizations
^^^^^^^^^^^^^
- Optimized differential component for size
  Serialization logic has been further improved in order to suppress the serialization
  of nodes with empty/default Integer or Boolean values (e.g. Min, MustSupport).
- Optimized profile (re-)binding
  Forge tries to bind element types to the associated profiles, if they are available (loaded) within the current context, for validation purposes.
  Type binding requires Forge to match compatible profiles, this is quite computationally intensive.
  The underlying logic has been optimized to prevent unnecessary rebinding.
  Specifically, Forge now ignores changes in element type options that aren't selected/checked.
  This optimization improves the performance of change tracking, e.g. when loading a package
  or editing the canonical url of a profile that is referenced by other loaded profiles.

Bug fixes
^^^^^^^^^
- Fix incorrect element type validation warnings on extension elements
- Fix incorrect element type validation warnings on official derived profiles from hl7.org (e.g. DAF)
- Fix custom profile url on extension elements (user-specified profile url value was not memorized and not persisted to XML)
- Fix incorrect validation warnings on unknown core profiles
  Forge always generated a validation warning for any unrecognized non-core profiles on base url http://hl7.org/fhir/StructureDefinition/
  However some official Implementation Guides (e.g. DAF) also use that same base url and this triggered confusing validation warnings in Forge.
  To prevent confusion, this validation warning has now been disabled.
- Prevent loss of focus after editing the extension element target profile
- When loading a profile with a sliced element, the slicing introduction was not correctly processed and the actual property values were dropped.
  As an unintended side effect, the Add Slice command button would then add an extenion element instead of a new slice. This has now been fixed.
- Ensure serialization of required properties, e.g. Abstract, Status etc.
- Fix broken ImplementationGuide.global.type property
- Fix broken UI binding of element type selection options
  For elements with a choice type, Forge generates selection options for compatible profiles that are loaded within the current context.
  In some circumstances, the generated type options were not correctly initialized and bound to UI events.
  This has been fixed. The improved initialization logic is also considerably faster.
- Restore all the original element properties when un-slicing a sliced element
  Previously, not all properties were correctly restored, e.g. original element mappings
- Fix invalid element type selection options for reference types
  Forge would generate invalid element type selection options for datatype profiles when the base element was typed as Reference(Resource).
  This has been fixed. A reference can only ever point to a resource and never to a datatype, as they are not stand-alone addressable.
- Correctly load profiles with extensions on a renamed choice type element (e.g. valueString)
  Previously, extensions below a renamed choice type element were ignored/discarded during load. This has now been fixed.
- Don't overwrite any existing document title when assigning/updating the location (Url)
- Dynamically revalidate extension context when the user updates the context of the referenced extension definition.

Bug fixes on Logical Models
^^^^^^^^^^^^^^^^^^^^^^^^^^^
- Derive logical model from base type Element, not from DomainResource
- Serialize logical models to a snapshot component
  Note: in the previous release, logical models were incorrectly serialized to a differential component.
  The current release automatically fixes logical models created by the previous release, by transfering any existing differential element definitions to the snapshot component.
- Initialize logical model element cardinality to 0...*
- In a logical model, allow user to swap the position of a backbone element and a regular (typed) element
- If an element name is empty, display fallback value "(no name)" in the element tree

Release 12.5 for DSTU2 DSTU2 1.02 Official version
--------------------------------------------------
HL7 WGM Montreal edition

Notes
^^^^^

* This release still supports FHIR DSTU2 1.02 (Official version) from Oct. 24th, 2015
  After the HL7 WGM ballots in Montreal, we will upgrade all our FHIR tooling to support the new STU3 specification.
  Because STU3 introduces breaking changes, we will publish the future Forge STU3 release as a new major version. This will
  allow side-by-side deployment of both the DSTU2 and STU3 releases on the same machine.

* As a consequence of the current FHIR .NET API design, Forge is currently tightly coupled to a specific DSTU version and
  cannot handle resources from an older or newer FHIR version. We are thinking about a more flexible API design, in order
  to allow Forge to support working with/designing future FHIR STU releases.

Functional improvements
^^^^^^^^^^^^^^^^^^^^^^^

* NEW! Logical modelling
  Forge now supports the authoring of logical models, based on the FHIR StructureDefinition resource.
  
  To quote Grahame Grieve:
  "A logical model is FHIR speak for 'a tree of data that has no particular use in the FHIR exchange paradigms'.
  In FHIR, they are typically used to represent ad-hoc combinations of FHIR data for packaging convenience,
  and/or content models as defined by other specifications (e.g. CDA, CIMI, openEHR).
  Logical Models may use normal FHIR data types - or even resources - and have the full suite of the FHIR definitional
  framework to call on (e.g. terminology definitions/service, mapping language, etc)."

  The editable property "Element Name" represents the name of the element in the internal XML/JSON/PoCo representation.
  This is not to be confused with the ElementDefinition.Name property, which is used e.g. for slicing.
  You can also edit Element Names via the Element Grid.

  Forge provides two different commands for creating a logical model element:

  - Add backbone element

    Creates a new "folder" element with type fixed to BackboneElement.
    Backbone elements do not have a value and may contain user-defined logical child elements.
  - Add element

    Creates a new element with user-configurable type(s) and value.
    The selected type(s) determine the internal substructure of the element.
    Forge does not dynamically expand the element; the inherited substructure is implied.
    You cannot add any user-defined logical child elements.
  
  We'd love to get some feedback on this new feature. Are you missing certain key functionality or do you have
  suggestions for improvements? Then please send us a message at forge@furore.com.

* Element grid now displays dynamic validation status icons to indicate the maximum warning severity for the associated element
  (Blue = info, Orange = warning, Red = error)

User interface
^^^^^^^^^^^^^^

* New start page
  The application start page now displays a news feed from https://simplifier.net/feed/organizationnews/furore
  The news feed will inform you about product updates, new major releases and upcoming events such as HL7 WGM.
  The new start page also provides shortcuts to frequently used commands and recent documents.

* Updated terminology: renamed command "New Constraint" to "New Profile".
  Until now, we have consciously been avoiding the use of the word "profile" in the Forge UI in order to prevent
  any confusion, as the term is heavily overloaded. However with the introduction of the new logical modelling
  functionality, we decided to update the terminology to conform with common use within the HL7 community:
  - Profile:    refers to a StructureDefinition that expresses constraints on an existing (FHIR) resource or data type
  - Extension:  refers to a StructureDefinition that defines an Extension element
  - Model:      refers to a StructureDefinition that defines a custom structure
  - Constraint: refers to a specific element constraint within a profile

* Tweaked the night theme to improve panel header contrast

Bug fixes
^^^^^^^^^

* Bugfix: restore lookup lists on identifier.system.fixed and code.coding.system.fixed properties

* Hide watermark on combobox if input text is not empty and does not match any of the combo items

Release 12.4 for DSTU2 DSTU2 1.02 Official version
--------------------------------------------------

Updated dependencies
^^^^^^^^^^^^^^^^^^^^

* Upgrade to FHIR.NET API v0.95-alpha1 for DSTU2 1.0.2 (Official version)
  The new library fixes an issue with publishing profiles to a FHIR server.

  Note: the new API release now maps many more properties to a C# Enum type, e.g.

  - ElementDefinition.Type.Code : FHIRDefinedType
  - Conformance.resource.type : ResourceType
  - ... etcetera ...

  Previously, most coded values were deserialized to a simple string variable. This allows a client such as
  Forge to try and handle invalid values. The new API release however is more strict and will fail to
  deserialize resources with invalid enum values (runtime Parse exception).
  Possible side effects:

  - Server Conformance check
    By default, Forge first performs a Conformance check when connecting to a FHIR server. If the FHIR Server returns
    an invalid Conformance resource, the verification process will fail and prevent further access to the server.
    As a workaround, Forge now provides a  new global configuration option "Verify Server Conformance".
    Disable this option to skip the default conformance check and force the connection.
    Caution: connecting to servers that are not compliant to FHIR DSTU2 may cause unexpected behavior.
  - Bundles and search results
    A Search operation (e.g. Browse FHIR server) that returns an invalid resource will abort with a deserialization
    exception and cannot be completed, i.e. any remaing results are not accessible.

  Currently, the strict deserialization behavior is not configurable. Invalid source data cannot be processed and
  should first be corrected and/or cleaned up. We are looking at alternative strategies that will allow the API and
  consuming client applications to process invalid/incompliant source data.

Functional improvements
^^^^^^^^^^^^^^^^^^^^^^^

* New online help
  The Help menu command (F1) now opens the online documentation at http://docs.simplifier.net/projects/forge-docs/
  The old local help file "Forge.chm" is now obsolete.
  We are continously working on improving the documentation.

* Display resource maturity level
  Forge now tries to resolve the maturity level of a resource, as defined by the FHIR specification:
  http://hl7.org/fhir/resource.html#maturity
  The Resource selection dialog shows the maturity level of each resource.
  Also the top header bar shows the maturity level of the base resource of the selected profile.
  Forge extracts the maturity level information from the official extension that exists on the
  StructureDefinitions of core resources in validation.zip (part of the FHIR.NET API).
  
  The global configuration option "Do not inherit maturity level extension from base resource"
  controls wether Forge explicitly discards the inherited maturity level extension on newly
  created user profiles (default True). Disable this option to maintain the inherited maturity
  level extension in user profiles.

* Support DomainResource.text
  Forge now supports editing the common resource Narrative component (on tab page "Narrative").
  The default value of this field depends on the global configuration option "Discard DomainResource.text values".

  - Enabled:
  
    Clear the narrative component when loading a core resource definition or user profile,
    in order to conserve memory. New user profiles will be initialized with an empty narrative.
  - Disabled:

    Maintain the narrative component when loading a core resource definition or user profile.
    User profiles will inherit the existing narrative from the associated base resource definition.
    However the Narrative component will only be serialized to the output when modified.

  Compare this to the configuration option "Discard DomainResource.text profile element".
  Enabled:  Discard ElementDefinitions on DomainResource.text from profiles, in order to conserve memory.
  Disabled: Maintain existing ElementDefinitions on DomainResource.text in profiles.

* Show/hide element binding properties conform invariant eld-11:
  "Binding can only be present for coded elements, string, and uri"
  i.e. the element binding component is visible if an element type property includes one of the following types:
  code, Coding, CodeableConcept, Quantity, (Extension), string, uri

* Gracefully handle StructureDefinition resources without a canonical url
  FHIR defines the canonical url as a required field, but Forge now tries to cope if the value is missing/cleared.
  The canonical url should uniquely identify the resource. You cannot reference a profile with an empty url.

* Element type validation has been further improved and optimized
  Forge verifies that element type constraints are valid against the base element definition.
  Each type constraint should have a matching type in the base element.
  If a type references a profile, it should derive from a base type profile.
  Forge tries to resolve and validate profile references within the current session or package.
  The validation engine will generate an informational message for unresolved profile references that cannot be validated.
  The application provides basic UI support for multiple profiles per element type, but only the first profile is validated.

* Validate invariant eld-1:
  On ElementDefinition.slicing: If there are no discriminators, there must be a definition

* Allow constraints on DomainResource.contained
  This feature was requested by Reuben Daniels (NEHTA)
  If you enable the option "Show common elements", then Forge now also displays the 'contained' child element, inherited from DomainResource
  Previously, this element was always explicitly hidden in the user interface.
  Now you can define constraints on the contained element, e.g. specifically disallow contained resources by fixing max to 0.

* Optimized differential component for size
  Serialization logic has been improved in order to suppress the serialization
  of nodes with empty/default values, i.e. values inherited from the base resource.

  - ElementDefinition.Alias
  - ElementDefinition.Base
  - ElementDefinition.Binding
  - ElementDefinition.Mapping
  - ElementDefinition.Conditions
  - ElementDefinition.Constraints
  - ElementDefinition.Type
  - StructureDefinition.Mapping
  - StructureDefinition.Contact
  - ... etc ...

UI Improvements
^^^^^^^^^^^^^^^

* Limit minimum window dimensions to 640x480 pixels

* Generate user-friendly display names for element types, conform the FHIR specification.
  Generate abbreviated names for core restrictions on primitives, e.g. positiveInt
  Generate composite names for all other profiled types, e.g. Reference(Observation) or Quantity(Money).
  Automatically display a tooltip if the name is truncated.

* Support for clickable hyperlinks in (error) dialog messages.

Optimizations & bugfixes
^^^^^^^^^^^^^^^^^^^^^^^^

* Bugfix: FGR307 - Toggle visibility of common elements derived from (Domain)Resource
  (Reported by Jonny Rylands)
  Release 12.2 introduced configurable support for common elements inherited from the abstract base classes Resource and DomainResource,
  controlled by the global configuration setting "Expand common resource elements". However if the option was disabled, then opening a
  profile that contains common element constraints could fail because the associated base resource would not be fully expanded.
  This has been fixed. Forge now always expands the full snapshot, including any common elements inherited from (Domain)Resource.
  You can toggle the visibility of the common resource elements via the new global configuration setting "Show common resource elements".
  By default, this setting is disabled and common elements are hidden in the element tree and element grid, as this is a fairly advanced
  feature that could confuse new users. Toggling this option immediately hides/shows all common elements in the element tree and grid
  controls - an application restart is no longer required.

* Optimize type validation logic

* Bugfix: FhirClient explicitly requests JSON format
  Due to a change in the Furore Spark server implementation, download and publish commands were broken.
  This is now fixed.

* Bugfix: Download/Publish dialog layout is incorrect in Night theme
  When using the night theme, the drop-down ComboBox control containing the server addresses was incorrectly aligned.
  This is now fixed.

* Bugfix: restore global configuration option "Save ElementDefinition.Base component"
  When saving a resource to Xml, this option controls if the ElementDefinition.Base components are included in the output.
  However, due to a bug, the ElementDefinition.Base components were always serialized to XML, regardless of the option value.
  This has been fixed. Disabling the option will suppress all ElementDefinition.Base nodes in the saved Xml file.

* Bugfix: save ImplementationGuide
  Saving ImplementationGuide resources was broken and threw an exception; this has been fixed.

* Bugfix: Publish to FHIR Server
  In some circumstances, publishing a resource to a FHIR server could fail with a runtime exception,
  because the server could return a JSON result where XML was expected. This has been fixed.

Release 12.2.1 for DSTU2 1.0
----------------------------
This is a minor update that fixes some small issues in the previous version.

Features
^^^^^^^^

* Expansion of Element.Id is now also controlled by the global application setting "Expand Common Elements" (Options menu).
  Release 12.2 introduced support for common elements derived from Resource & DomainResource.
  As an unintended side efffect, the application now always expanded the Element.Id node.
  This behavior is now controlled by the aforementioned global configuration setting and disabled by default.

* Validate invariant eld-1:
  On ElementDefinition.slicing: If there are no discriminators, there must be a definition

UI Improvements
^^^^^^^^^^^^^^^

* New command: File / Open as Copy
  Open a new, in-memory copy of an existing resource file.
  Forge automatically assigns a unique name and canonical url to the new instance (via auto-numbering).
  When saving, the application will prompt for a new filename.

* New command: File / Duplicate
  Create a new duplicate instance of the selected item.
  Forge automatically assigns a unique name and canonical url to the new instance (via auto-numbering).

Bug fixes
^^^^^^^^^

* Properly dispose of resource instances in case of unhandled exceptions during initialization

* Properly match choice element paths
  Due to a bug in release 12.2, when opening a Procedure profile, the Procedure.performed[x] element was discarded
  (reported by Jonny Rylands)
  This issue has been solved.

* Always emit the root element definition to the StructureDefinition.differential component
  In DSTU 2, the differential component should always contain the root element definition,
  regardless of wether the root element is constrained.
  In DSTU 3, this will no longer be required; the root element definition may be omitted
  from the differential component if it is not constrained.
  Note that this Forge release conforms to DSTU 2.

Release 12.2 for DSTU2 1.0
--------------------------

* New product versioning scheme

  From now on, all public releases will be identified by a friendly product version number (major.minor).

  - The major version number represents the HL7 WGM Connectathon index (currently 12).
  - The minor version number represents the sprint index (currently 2).

  The new versioning scheme improves the identification of interim hotfix releases.
  Note: The official product version is maintained manually. Internal Assembly file versions are auto-generated from a timestamp.

* Support for Complex Extensions
  http://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_id=677&tracker_item_id=9284
  The application now supports the authoring of complex extensions, i.e. extensions with nested sub-elements.

  - The Extension.url child element is hidden in the UI and automatically generated behind the scenes.

  - The Extension.value[x] child element is only visible for simple extension elements that do not contain nested child extension elements.
    Forge automatically hides the value[x] element when you add a complex extension element to the same parent.
    If you remove all child extension elements from a complex extension element, the value[x] child element becomes visible again.
  
    Note that the value[x] element is a regular element. The Add command allows you to add an extending child element that
    is defined by an external extension definition, similar to extending resources.
  
  - The Extension Definition element tree now supports two different toolbar commands:

    - Add => Add extension element; applies to complex extension root element and custom extension child elements
    - Extend => Extend selected element; applies to standard value[x] and (hidden) url child elements

* Rename choice elements constrained to a single type
  Choice elements are now renamed when constrained to a single type, e.g. value[x] => valueString.

* Support for profiles on derived complex datatypes, e.g. Money

* Support for constraints on common elements inherited from (Domain)Resource
  All core resource types are derived from the abstract DomainResource and/or Resource base types
  and inherit a set of common elements from these base resources:

  - Resource.id
  - Resource.meta
  - Resource.implicitRules
  - Resource.language
  - DomainResource.text

  Forge can now display the inherited elements in the profile element tree and grid views
  (prior to the resource specific elements), so you can specify constraints on them.
  This feature is controlled by an application-wide configuration setting that you can toggle
  through the main Options menu called "Expand Common Elements".
  Note that the application needs to restart when you change this option.

* [FRG-292] Configuration option to include or discard Narrative elements
  When creating or opening a StructureDefinition, Forge used to discard all elements of datatype Narrative by default
  (e.g. Condition.section.text), in order to save memory.
  This behavior is now configurable through the menu option "Discard all Narrative elements" and has been disabled by default.
  You can enable this option in order to restore the original behavior and discard Narrative elements when loading StructureDefinitions.

* Improved support for ImplementationGuide resource

  Note: the ImplementationGuide resource is a relatively immature resource and likely to change.
  Therefore the current UI for editing IG resources is still quite simple and basic.
  We are planning to improve the functionality and UI when the IG resource matures.

  - Support re-ordering of ImplementationGuide package resources

  - Automatically synchronize ImplementationGuide.package.resource.name property with name of the associated target resource.
    I.e. when the name of a package resource is changed, Forge automatically updates the associated package entry name.

  - Support for editing ImplementationGuide.dependency components

  - Support for editing ImplementationGuide.contact components

  - Basic support for editing ImplementationGuide.page components
    The FHIR specification currently defines ImplementationGuide.Page as a required element.
    However this is likely to change; see GForge issue #9097: "ImplementationGuide.page and ImplementationGuide.package should both be optional"
    http://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_id=677&tracker_item_id=9097

    Currently, (strict) FHIR servers will reject an ImplementationGuide resource that do not contain any Page components.
    As a temporary workaround, Forge now automatically generates a dummy root page component.
    This behavior will be deprecated if/when a new version of the FHIR spec defines the Page element as optional.

  - Handle unknown (e.g. example) resources in an ImplementationGuide package
    Forge currently only supports editing StructureDefinition & ImplementationGuide resources.
    However to facilitate the editing of ImplementationGuide packages with references to example resources,
    Forge now provides a very basic generic editor for all other resource types.
    The generic resource editor allows editing of (only) the common resource Meta properties and provides XML rendering.
    Note that the current version of the FHIR .NET API, and thus Forge, only supports resources defined by DSTU2 1.0.
    Incompatible resources from older/newer DSTU versions cannot be deserialized.

* Improved support for element type constraints

  - Display status icons for the individual type choices of an element type

  - User-defined element type constraints are now verified to be valid constraints for the base element type.
    For type definitions with external profile references, Forge now tries to resolve the target StructureDefinition from the current scope
    (i.e. sibling resources in the same parent folder = Session Root or IG Package item).
    After successfully resolving the target StructureDefinition, Forge tries to verify that the profile is a valid constraint
    for one of the base element types.
    External profile validation is only possible if the target profile is available within the same scope (session, package).

  - Generate information messages for unresolved external profile references
    The message merely informs the user that Forge cannot verify the validity of the external profile.
    When you open the target profile within the current scope, Forge will revalidate the associated external profile references.

  - Optimize logic to generate type options for compatible target profiles within the same scope.
    e.g. if the base element type supports Reference(Patient) and your session/package also contains a MyPatient profile,
    then Forge will automatically generate an associated type option Reference(MyPatient) for the element type property.
    When you add or remove resources from the current scope, Forge automatically updates all element types.
    The underlying synchronization logic has been optimized and improved.

  - Synchronize incoming profile references to canonical profile url
    If you update the canonical Url of a StructureDefinition that is being referenced by other profiles within the same context,
    Forge will try to update all the incoming references from element types in sibling profiles accordingly, in order to prevent
    broken references.

* Auto-numbering for name and url properties of newly created resources, to prevent conflicts
  As Forge tries to track profile references via the canonical Url, it is crucial that all loaded resources have a unique url.
  When creating new resources, the application now ensures unique names and urls using auto numbering.

* Explorer UI Improvements

  - Rename "Solution Explorer" to "Session Explorer"
    Note: the explorer panel shows all the open files in a logical view.

  - Rename "Item Properties" to "File Properties"

  - Improved styling for Session Explorer toolbar
    "New" commands are now grouped into a drop-down menu
    Toolbar now also contains an "Open" command button.

  - Compact style for File Properties panel

  - Add command button to open the folder location of the selected item (if it is a local file).

* Miscellaneous UI Improvements

  - The FHIR Skype chat groups have been deprecated and replaced by Zulip.
    You can visit the new FHIR discussion groups at chat.fhir.org.
    The hyperlinks in the Help menu and the About box have been updated accordingly.
  - StructureDefinition commands are now hosted on a ToolBar control (cf. Session Explorer command buttons)
  - When opening or creating a StructureDefinition resource, the Element Tree tab page is now activated by default.
  - When saving a new resource, initialize file name from resource title (Label) and type
  - New link (chain) icon to indicate items that represent a reference to an external resource (i.e. ImplementationGuide package entries)
  - Validation status icons now indicate the maximum validation error severity

    - Blue = informational
    - Orange = warning
    - Red = error

  - Improved element cardinality hints for tree elements, e.g. (0...*)
    You can toggle the display of element cardinality hints via the Options menu, item "Show element cardinality"

    Cardinality	Hint

    - 0...0 = (0)
    - 0...1 = <none> (default)
    - 0...* = (*)
    - 1...1 = (1)
    - 1...* = (1+)
    - N...N = (N)
    - N...* = (N+)
    - X...Y = (X...Y)

  - Show instruction tooltips & labels for tab items

  - ElementDefinition.definition now accepts multiple lines of text (cf. ElementDefinition.comments and ElementDefinition.requirements)

  - Only display ElementDefinition.minValue[x] and .maxValue[x] properties for appropriate element types
    (date, dateTime, instant, time, decimal, integer, and Quantity)

  - Improved resizing logic for multi-line text properties

  - Optimize change tracking
    The number of internal change notifications has been drastically reduced in order to improve application performance
    Forge now buffers change notifications while creating or loading a resource.

* Bugfix: element tree now displays the actual name of the root element, as defined by the FHIR specifictation.
  Note: in previous releases, the element tree rendered the root element using the display name of the StructureDefinition (e.g. "My Patient")

* Bugfix: slice icon not visible for sliced elements with cardinality 0...1

* Bugfix: disable Publish & Publish to Simplifier commands for contained items, e.g. ImplementationGuide.package components
  Note: components are a part of the containing resource and cannot be saved/published separately.

* Bugfix: enable text wrapping for (long) tool tips

* Bugfix: styling for disabled ComboBox controls

* Bugfix: correctly focus target control of variant property after click on validation message