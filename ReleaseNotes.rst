Release notes
=============

.. toctree::
   :maxdepth: 1
   :titlesonly:

   OldReleaseNotes

Release 29.1
------------
Changes
^^^^^^^
* Added a **File format settings** menu option for specifying the indent size used in Xml and Json files.
* The **Create a new StructureDefinition** dialog now checks for an already existing canonical url and/or file name in your project.
* You can now run Forge for a limited time if your internet connection is down.
* The **Resolve resources from subdirectories** option is now turned on by default.

Bug fixes
^^^^^^^^^
* User settings were not retained when updating to a new version of Forge.
* The **Save As...** option now works as expected (the document properties are updated to the new file name).
* When selecting the **Extension** type in the **Select Extension Context** dialog, the element tree was not rendered correctly.
* Slice naming checks were incorrectly applied to element names for logical models.
* When the source of an element constraint is empty it is no longer initialized to the canonical url of profile itself when it is opened in Forge.
* Forge now suggests **extension.value** for *slicing.discriminator.path* instead of **extension.value[x]**.
* When linking a project folder to a project on Simplifier, double clicking a disabled item would still allow you to continue.
* The project list view was not updated correctly after installing a package in an empty project folder.
* Columns of list views can no longer be collapsed completely.
* Fixed various minor UI styling issues.
* **[R4B-R5]** Added support for opening files with an unknown FHIR version. The unknown FHIR version must be a variant of a known published FHIR versions (e.g. "4.3.0-unknown" or "4.3.0"). The version in the resource is updated to the latest version known by Forge.

Release 29.0
------------
Changes
^^^^^^^
* Upgrade to Firely .NET SDK 4.0.0.
* Upgrade to .NET 6.
* Added project quality control similar to the functionality found on Simplifier.
* The project list view now lists all document types supported by Simplifier.
* Added **Open in external application** menu item in the project list context menu. The **Refresh** command has been moved from the project toolbar to the context menu.

Bug fixes
^^^^^^^^^
* Improved message when trying to sign in with an unverified user account.
* Fixed not being able to link a project folder with a Simplifier project when the project folder has subfolders with files in it.
* Fixed various minor UI styling issues.
* **[R4B-R5]** Added support for CI build version:

  - R4B - 4.3.0-cibuild
  - R5 - 5.0.0-cibuild

Release 28.1
------------
Changes
^^^^^^^
* Logical model: the **Add element** button now features a drop down list to add an element with a default type already selected (only for most frequent used types).
* Synchronizing with Simplifier.net: more elegant handling of the **Not Found** response. Possible causes for this response are:

  - The project url key has changed
  - The project no longer exists on Simplifier
  - You no longer have access to the project
* Files with the extension **.fsh** and **.ico** can now be synchronized with Simplifier as well.
* Forge bootstrapper now detects Windows Arm64 for the installation of the correct .NET 5 Desktop Runtime

Bug fixes
^^^^^^^^^
* Fixed various minor UI styling issues

  - Some element labels were shown twice since version 28.0
* When opening a bundle with a constrained **entry.resource**, the resource was not shown in the element tree.
* The **Save** button is now always available and the save operation is always executed. This solves: 

  - not being able to click the **Save** button while editing a text field
  - after toggling the **Save snapshot component** option and clicking **Save** the file is not saved unless there are pending changes
* Fixed incorrect calculation of the minimum cardinality for extension arrays where an extension already has a minimum cardinality value set.
* Fixed inherited example values being allowed to be edited or deleted. They are now disabled for editing.
* When creating a new profile and the file has not been saved yet and Forge detected a file change outside of Forge, Forge would incorrectly show a message that the profile was deleted outside of Forge.
* Fixed not being able to open a resource with duplicate element ids since version 28.0 
* Logical model:

  - content reference field could not be edited
  - type property was not visible after (re)loading the resource when no type was selected
  - an added type could not be removed after (re)loading the resource
  - type emptiness validation did not evaluate properly after (re)loading the resource
* **[STU3]** Not possible to save logical models in version 28.0
* **[R4B-R5]** Fixed inability to create new profiles in version 28.0. Now using the most recent FHIR version:

  - R4B - 4.3.0-snapshot1
  - R5 - 5.0.0-snapshot1

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




