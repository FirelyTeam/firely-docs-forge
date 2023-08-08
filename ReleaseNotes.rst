Release notes
=============

.. toctree::
   :maxdepth: 1
   :titlesonly:

   OldReleaseNotes

Release 31.0
------------
Changes
^^^^^^^
* Upgraded to Firely .NET SDK 5.3.0.
* Upgraded to .NET 7.
* R5 officially supported by Forge.
* Resource tree view rendering is now consistent with Simplifier with two rendering options:

  - Unmodified elements in the tree are displayed dimmed (default). 
  - Modified elements in the tree are indicated with a pen icon.
* When adding an extension to an element the cardinality of the extension is now applied by default.
* Added option for saving **Xml Declaration** header in xml files to the settings dialog:

  - Same as source
  - Include
  - Omit
* Various other UI styling improvements.

Bug fixes
^^^^^^^^^
* A parent extension element definition was always created with default values in Forge ignoring differential values from the resource file.
* When adding a data type profile (with constraints) on a data type that already has constraints on it from a base profile then now all constraints are merged whenever possible.
* Fixed false positive correction messages for inherited extensions.
* Opening a profile saved with a snapshot but without a differential would result in false correction messages.
* When saving a profile with a snapshot then the snapshot could contain superfluous elements.
* When adding a new extension to a profile then the **Element Properties** panel would not show the correct values (e.g. description).
* After adding an extension to a primitive data type then saving and reloading the profile then the id property of the primitive data type would be visible in the tree while it should be hidden.
* Forge would allow you to add (modifier) extensions on elements that do not support it.
* Forge no longer tries to correct the cardinality of parent extensions where the extension definition slicing rule is closed.
* When creating a new complex extension the **value[x]** element is hidden in the tree view but the element is included in the differential.
  However, the differential for element **Extension.value[x]** contains type elements whereas none were expected as the element does not alter the base element definition.
  Forge did not always include the Meta type and thus created a difference with the base definition.
* A profile with a sliced element but without a discriminator would not load properly.
* Using the **Duplicate** or **Open** profile (from Element Properties panel) would cause Forge to crash when the resource had an old Fhir version.
* Changes to the option **Resolve resources from subfolders** in the **Settings** dialog and the Open folder dialog were not saved.
* Profiles with a FHIR version unknown to Forge (e.g. FHIR version 5.0.0 for Forge 30.2.0 for R5) but where that unknown version is newer 
  than the latest FHIR version known by Forge (e.g. 5.0.0-snapshot3 for Forge 30.2.0 for R5) would result in an error message and the profile would not be opened.
* Fixed various minor UI (styling) issues.
* **[R4B/R5]** CodeableReference was not treated as a reference and thus the target profile property was not shown in the **Element Properties** panel.

Release 30.2
------------
Changes
^^^^^^^
* **Forge validation** now shows a warning message when a resource uses a deprecated FHIR version.
* Added a warning message when Forge calculates the minimum cardinality for extension arrays in a base profile and the value is incorrect.
* **[R4B]** Added support for upgrading search parameter and operation definition resources in the **R4B Upgrade Wizard**.
* **[R4B]** When opening and upgrading a R4 resource, Forge now shows upgrade messages in the session message panel.

Bug fixes
^^^^^^^^^
* When a resource was loaded in Forge and the resource was modified outside of Forge and the resource became invalid then no message was shown.
* Forge did not correctly validate all extension context type/expression value combinations.
* The **Select Extension Context** dialog listed complex data types **SimpleQuantity** and **MoneyQuantity** as **Quantity**.
* Fixed issues with the **Forge validation** option in Quality Control:

  - Some messages were listed twice.
  - Bundle entries in a project would result in an error message. 
* If package restoration failed then all dependencies were removed from the project and the **package.json** file.
* Fixed not being able to add a slice to a backbone element.
* Inherited content reference elements could still end up in the differential.
* The differential for a slice element included an inherited binding.
* Fixed various minor UI (styling) issues.

Release 30.1
------------
Changes
^^^^^^^
* Added Forge validation report option to Quality Control. Automatic correction of resources in bulk is also supported.

Bug fixes
^^^^^^^^^
* Date/time related input fields did not support the FHIR specification correctly.
* The checkbox for boolean element properties would still be in three state mode even though the base element property had a value.
  This could result in not being able to change the value in the checkbox.
* If an element had a value for mustSupport then Forge would not allow you to change the value anymore.
  However changing the value from false to true is allowed.
* References to files on disk were not resolved properly.
* Fixed bug that would lead to error message: "Unable to cast object of type 'Integer' to 'UnsignedInt'".
* Fixed regression bug introduced in version 30.0 where inherited extensions were added to the differential.
* Relative values in contentReference are now handled correctly (they should be absolute).
  This would result in elements wrongly added to the differential (e.g. ReferenceRange).
* When creating a new data type profile, profiles derived from Quality (Age, Distance, Count and Duration) were not listed.
* Fixed false positives for correction 'Removed redundant source for constraint'.
* Keys - and * from the numeric keypad are now handled correctly when editing in a textbox.
* Fixed various minor UI styling issues.
* **[STU3]** Fixed various slice name issues when selecting/deselecting types in a choice type.

Release 30.0
------------
Changes
^^^^^^^
* Upgrade to Firely .NET SDK 4.3.0.
* R4B officially supported by Forge.
* Added **Project** menu.
* Redesigned **Option** menu: moved settings to **Settings** dialog.
* Added option **Do this for all current items** for some dialogs:

  - Save file changes: **Save** or **Discard**
  - Update resource FHIR version: **Yes** or **No**
* Added separate session message filter **Corrections** for messages related to corrections
  that Forge makes when you open a resource.
* **[R4]** Added **R4B Upgrade Analysis Wizard** in **Project** menu.
* **[R4B]** Added **R4B Upgrade Wizard** in **Project** menu.
* Forge documentation has been updated and a new page has been added with information on the `R4B Upgrade Wizard <features/R4BUpgradeWizard.html>`__.

Bug fixes
^^^^^^^^^
* The resource resolver in Forge was not updated after saving modifications in a resource. 
  This was noticeable when using quality control that reported an issue in a resource. After you fixed the issue
  and ran quality control again the same issue would be be reported again.
* Validation messages were not displayed in session message panel and folder item tooltip.
* When package restore failed then no error message was shown to the user and the project dependencies were missing in the overview.
* Opening a resource with no FHIR version resulted in an error message.
* Saving all documents after duplicating a resource multiple times would result in an error message. 
* Fixed various minor UI styling issues.

Release 29.1.1
--------------
Bug fixes
^^^^^^^^^
* Fixed creating duplicate slices when loading a profile with slices that have an invalid path (now all child element definitions are processed correctly).

Release 29.1
------------
Changes
^^^^^^^
* Upgrade to Firely .NET SDK 4.2.1.
* Added **Simplifier** menu and **Repair link...** option.
* Added a **File format settings** menu option for specifying the indent size used in Xml and Json files.
* The **Create a new StructureDefinition** dialog now checks for an already existing canonical url and/or file name in your project.
* You can now run Forge when your internet connection is down (requires a previously successful login).
* The **Resolve resources from subdirectories** option is now turned on by default.
* When Forge corrects the differential of your profile after opening it, Forge now reports what has changed in more detail.
* Multiple selection is now available when resolving file change conflicts in the Simplifier link and synchronize dialogs.
* There are now two menu options for **Save All** in the context menu for a project item in the **Session Explorer**:

  - **Save All Changed** only saves documents with pending changes.
  - **Save All** saves all documents even if there are no pending changes.

Bug fixes
^^^^^^^^^
* User settings were not retained when updating to a new version of Forge.
* The **Save As...** option now works as expected (the document properties are updated to the new file name).
* Quality Control no longer unjustifiably reports *Internal logic failure* messages.
* When selecting the **Extension** type in the **Select Extension Context** dialog, the element tree was not rendered correctly.
* Slice naming checks were incorrectly applied to element names for logical models.
* When the source of an element constraint is empty it is no longer initialized to the canonical url of profile itself when it is opened in Forge.
* Forge now suggests **extension.value** for *slicing.discriminator.path* instead of **extension.value[x]**.
* Fixed invalid slice path when creating slices on a choice type element.
* Fixed creating duplicate slices when loading a profile with slices that have an invalid path.
* When linking a project folder to a project on Simplifier, double clicking a disabled item would still allow you to continue.
* The project list view was not updated correctly after installing a package in an empty project folder.
* Columns of list views can no longer be collapsed completely.
* Fixed Forge not starting because it was repeatedly trying to install .NET6 and failing.
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
