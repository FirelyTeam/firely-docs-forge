Release notes
=============

.. toctree::
   :maxdepth: 1
   :titlesonly:

   OldReleaseNotes

Release 2025.1.3
----------------
Bug fixes
^^^^^^^^^
* Forge did not always remove non-inheritable extensions like 
  `SDNormativeVersion <https://hl7.org/fhir/extensions/StructureDefinition-structuredefinition-normative-version.html>`_,
  which would result in those extension ending up in the differential.

Release 2025.1.2
----------------
Changes
^^^^^^^^^
* Improved performance when opening, editing and closing resources.

Release 2025.1.1
----------------
Bug fixes
^^^^^^^^^
* **[STU3]** Forge could not open profiles that contain one or more Annotation elements. 
  The following error message was shown: *"Annotation.text: invalid property type"*.

Release 2025.1.0
----------------

.. important::
   The Simplifier Entry plan no longer includes the use of Forge.
   `You can start a 60-day free trial now <https://simplifier.net/explore/trial>`_ or `see what is the best plan for you <https://simplifier.net/pricing>`_.
   If you are a FHIR trainer explaining Forge and Simplifier, then please `get in contact <https://simplifier.net/contact>`_
   for a free trainers license and vouchers for your students.

Changes
^^^^^^^
* Upgraded to Firely .NET SDK 5.11.7
* Added partial support for extensions (like the **Obligation** and **Translation** extension) on element definition properties. You can add extensions on:

  - Primitive types

    - string
    - markdown
  - Data types

    - Address
    - Coding
    - CodeableConcept
    - ElementDefinition
    - UsageContext
  - Element definition components

    - Binding

      - **[R5]** Additional  
    - Slicing
    - Type

* Added user settings for managing the global visibility of extensions on element definition properties.

  - **Show Element Properties Details**

    - **On command only**

      - Extensions are only displayed when you click the details button next to the element property
      - Keyboard shortcut: **Ctrl+1**
    - **When Constrained**

      - Extensions are displayed when they have one or more constraints
      - Keyboard shortcut: **Ctrl+2**
    - **When Constrained Or Inherited**

      - Extensions are displayed when they have one or more constraints or when the base profile has defined one or more extensions
      - Keyboard shortcut: **Ctrl+3**
    - **Element Id**

      - Show or hide all element id fields
      - Keyboard shortcut: **Ctrl+4**
  - Expand all constrained extensions on element properties on load.

* String and markdown properties have a dedicated **Add translation extension** button. 
  In addition, the translation **content** property is checked to make sure the data type matches the data type of its parent property.
  This correction behaviour can be turned off in the application settings but is turned on by default.
* Added support to ignore folders and files from your project folder when synchronizing your project to Simplifier.net. 
  When you create a text file with the name **.simplifierupload** in the root of your project folder then Forge will exclude **untracked** files from
  being uploaded to Simplifier.net. More information can be found `here <./features/IntegrationwithSimplifier.html#specifying-folders-and-or-files-to-ignore-when-uploading>`_.
* On the root element of a resource, show the name of the base resource instead of the type name.
* Updated **Quality Control** to the latest version. The standard **free**, **minimal** and **recommended** rules have been updated to match the standard rules on Simplifier.
* **[R4]** Added an option in the settings to repeat the discriminator in a slicing component in the differential when a slicing component is present.
  This can be used to prevent **eld-1** validator warnings.
* The optional packages section of the **Create FHIR Project Folder** dialog has been updated to include the latest **hl7.fhir.uv.extensions** package by default.
* When a project has dependencies where multiple versions of the same resource exist, Forge now always resolves to the most recent resource.
  The **Extend element** dialog has been updated to use this information to hide older versions of the same extension.
* The order in which resource elements are presented in the **Properties** tab has been consolidated across the various resource types. 
* **[R5]** Added validation for constraints **eld-24** and **eld-27**.
* UI improvements

  - Added a message with the busy indicator when appropriate.
  - Login and About dialog now scale with font size setting.
  - Added markdown status icon to indicate that the field supports markdown.
  - Updated the status icon for elements 'that have or are affected by constraints'.
  - Radio buttons now support tab navigation.

Bug fixes
^^^^^^^^^
* Slice name of a new slice was reset to 'no name' after unchecking a type.
* Forge gave a null reference exception when a root folder was selected when opening or creating a project folder.
* After removing an extension the extension parent cardinality was not recalculated.
* In rare occasions entries in the **Recent Files** were cleared. 
* Constraint **eld-14** and **eld-20** were not validated. Improved validation for constraint **eld-19**.
* **[R4,R4B]** Constraint **eld-21** was not validated.

Release 32.0.3
--------------
Changes
^^^^^^^
* Information for users on an Entry plan has been updated to reflect the upcoming changes in Entry plans and the new 60-day free trial.

Release 32.0.2
--------------
Changes
^^^^^^^
* When opening an extension definition resource, Forge checks the cardinality of elements to enforce *'An extension SHALL have either a value (i.e. a value[x] element) or sub-extensions, but not both.'*.
  Any corrections Forge makes are now shown in the **Session Messages** panel.

Bug fixes
^^^^^^^^^
* Fixed regression bug introduced in version 32.0 regarding using complex child elements when defining extensions.
  Some of the elements were serialized to xml/json in the wrong order. 
  Saving and reopening the extension would result in errors similar to this: 

  *Element 'Extension.extension.extension' is not available in the corresponding resource*
* Fixed incorrect removal of constrained extension elements from the differential.
* When adding an extension to create a complex sub extension, the extension element was shown below the **value[x]** element but should 
  have been shown below the **id** element. After reloading the resource the extension was shown at the correct position.
* Complex extension icon for an extension element was not updated after adding or removing sub-extension elements.
* Forge now also checks the cardinality for **extension** elements in addition to **value[x]** elements to enforce *'An extension SHALL have either a value (i.e. a value[x] element) or sub-extensions, but not both.'*.
  Elements **extension** and **value[x]** with cardinality 0..0 are no longer hidden in the **Element Tree**.

Release 32.0.1
--------------
Bug fixes
^^^^^^^^^
* Fixed regression bug introduced in version 31.0 regarding sliced elements that could result in the slicing rules value from the base profile not being used for the derived profile.
  In those cases the slicing rules value for the derived profile would always be set to **open**.

Release 32.0
------------
Changes
^^^^^^^
* Updated license agreement.
* Upgraded to Firely .NET SDK 5.8.1.
* Upgraded to .NET 8.
* Added **Project Settings** dialog to project menu. Options are:

  - Resolve resources from subfolders
  - Preferred file format (XML or JSON)

  Note that these options have been removed from the **Open FHIR Project Folder** dialog.
* Added **Create new FHIR Project Folder** wizard. 
  Here you can set the parent folder for your FHIR projects, enter a project name and change project settings.
  The core package will be added automatically to your new project.
* Forge can now show the JSON serialization of the selected resource.

  - Added **Show file preview tab** option to the application settings. Choices are:

    - XML + JSON
    - Same as source
    - None
  - The tab representing the file format of the resource is displayed in bold when **XML + JSON** is selected.
  - The color scheme of XML/JSON text has been improved (matches Simplifier color scheme).
  - XML/JSON elements with canonical URLs are displayed underlined and can be clicked. If the URL can be resolved in the project then the associated resource is opened in Forge. Otherwise, the URL is opened in the default web browser.
  - The font size of the XML/JSON text now changes when the font size of the rest of the application changes.
  - The setting **XML Folding** has been renamed to **Show XML/JSON node expand button**. 
* **Recent Documents** feature has been split into **Recent Files** and **Recent Projects**.
* Structure definition resources without a FHIR version specification can now be opened with Forge.
  The resource is parsed and validated using the FHIR version of the Forge version you are using.
* Added check to prevent non-repeating, non-choice type elements from being sliced.
* Show extension elements in order as specified by the FHIR specification.
* You can now change the version of an already installed package by selecting a different version and then click the **Add** button.
  The current installed version is replaced by the newly selected version.
* Added better reporting when there is an error starting Forge. 

Bug fixes
^^^^^^^^^
* Opening a project with large dependencies was very slow. Package summary information is now cached to improve startup performance.
* Forge did not serialize date/time information in a region/language independent way when caching resource and summary information on disk. 
  This would result in an error message similar to: *"2024-04-22T08.41.08.303414+00:00"* cannot be parsed as an instant.
  It only affects Windows users that have a regional date/time setting that is incompatible with the FHIR standard (e.g. Finish).
* When adding an extension to a sliced element an error message would popup and in some case the added extension would not be correct.
* Forge now correctly processes files with an ampersand character (%) in the file name (e.g. **MyPatient_%C3%A9.xml**). 
  Having files with a % in the file name would result in an error when trying to synchronize with Simplifier.
* Changing a slicing rules value in derived profile to a less strict value than the base profile did not trigger an error.
* The narrative html was not sanitized before displaying it in the preview window.
* Forge would only support the short notation for author information in the the **package.json** file. 
  Using the extended notation (i.e. with child properties) would result in Forge not being able to load the project folder.
* After adding a complex extension to an element definition, cardinality corrections were not applied.
* Shorthand definition for sliced choice type element was not handled correctly.
* The project list view can now show files with the same name but with different extensions.
* Fixed various minor UI (styling) issues.
* **[STU3]** The type of the root element of a resource is now displayed correctly. For example a Patient was displayed as Resource.
* **[R5]** UI elements for the **binding.additional** element definition property were missing.
* **[R5]** The **Identifier** property was missing from the UI for **Operation definition** resources.

Release 31.0.2
--------------
Bug fixes
^^^^^^^^^
* **Quality Control** would not run if a rule did not contain a name and Forge would display an error.
* File filters in Quality Control rules were not working.
* The enabled state was not properly set for some options in the context menu for the root node in the **Element Tree** view.
* Fixed performance issue when loading profiles where recalculation of parent extension cardinality was required.
* When adding a slice to a *Bundle.entry* and setting a canonical for the *Bundle.entry.resource.type.profile*, 
  Forge would not unfold the resource in the profile or include it in the differential.

Release 31.0.1
--------------
Bug fixes
^^^^^^^^^
* Fixed an issue where the parent element for a slice could be added to the differential unnecessarily.

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
  than the latest FHIR version known by Forge (e.g. 5.0.0-snapshot1 for Forge 30.2.0 for R5) would result in an error message and the profile would not be opened.
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
* Fixed bug that would lead to error message: *"Unable to cast object of type 'Integer' to 'UnsignedInt'"*.
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
