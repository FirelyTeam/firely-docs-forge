Forge Options
=============

Forge provides several options regarding rendering and saving in the
``Options`` menu.

.. figure:: ../images/OptionsForge.png
   :alt: The options menu in Forge
   :width: 450px

Settings
--------

User Interface
~~~~~~~~~~~~~~

.. figure:: ../images/Settings_UserInterface.png
   :alt: The user interface settings
   :width: 450px

-  **Night Time**

   Switch between light and dark color theme for the Forge user interface.
   
 .. list-table:: 

     * - .. image:: ../images/Settings_NightTime_Off.png
            :scale: 25%

       - .. image:: ../images/Settings_NightTime_On.png
            :scale: 25%

     * - *Night Time Off*

       - *Night Time On*

-  **Xml Folding**

   When turned on allows you to collapse and expand nodes in the **XML viewer**.

 .. list-table:: 

     * - .. image:: ../images/Settings_XmlFolding_Off.png
            :scale: 50%

       - .. image:: ../images/Settings_XmlFolding_On.png
            :scale: 50%

     * - *Xml Folding Off*

       - *Xml Folding On*

-  **Show common resource elements (id, meta, ...)**

   Shows or hides common resource elements in the **Element Tree**.

 .. list-table:: 

     * - .. image:: ../images/Settings_CommonElements_Off.png
            :scale: 76%

       - .. image:: ../images/Settings_CommonElements_On.png
            :scale: 76%

     * - *Show common resource elements Off*

       - *Show common resource elements On*

-  **Show child elements when sliced**

   This option allows you to see the constraints that can be put on the
   sliced element. These constraints are implemented on all the slices.
   This is summarized in the “All slice” once rendered on Simplifier.

 .. list-table:: 

     * - .. image:: ../images/Settings_SliceElements_Off.png
            :scale: 75%

       - .. image:: ../images/Settings_SliceElements_On.png
            :scale: 75%

     * - *Show child elements when sliced Off*

       - *Show child elements when sliced On*

-  **Expand all constrained elements on load**

   This option will expand constrained elements in the **Element Tree** when a resource is loaded.

 .. list-table:: 

     * - .. image:: ../images/Settings_ExpandElements_Off.png
            :scale: 75%

       - .. image:: ../images/Settings_ExpandElements_On.png
            :scale: 75%

     * - *Expand constrained elements Off*

       - *Expand constrained elements On*

-  **Force garbage collection on unload**

   When switched on this option will try to free up system memory when you close a document.

-  **Disable hardware rendering**

   If you encounter rendering issues with the Forge user interface then those are most likely caused by the video driver.
   In that case you can turn off hardware rendering.

-  **Element Tree modified style**

   Selects how modified elements in the **Element Tree** are displayed.

 .. list-table:: 

     * - .. image:: ../images/Settings_ModifiedStyle_Dimmed.png
            :scale: 75%

       - .. image:: ../images/Settings_ModifiedStyle_Pen.png
            :scale: 75%

     * - *Unmodified elements are displayed dimmed*

       - *Modified elements are indicated with a pen*



Persistence
~~~~~~~~~~~

.. figure:: ../images/Settings_Persistence.png
   :alt: The persistence settings
   :width: 450px

-  **Resolve resources from subfolders**

   Indicates the default setting for whether or not subfolders should be included when searching for resources in your project folder.
   You can always change the setting in the **Open FHIR Projet Folder** dialog.

 .. image:: ../images/Settings_IncludeSubfolders.png
    :scale: 80%

-  **Auto update publication data**

   When switched on this option will update the Date element of a conformance resource to the current date and time when uploading
   a resource to Simplifier.

-  **Save snapshot component**

   This option allows you to generate and include the snapshot component of a structure definition when saving a file to disk.

-  **Save with UTF-8 Byte Order Mark (BOM)**

   The UTF-8 BOM is a sequence of bytes at the start of a text file (0xEF, 0xBB, 0xBF) that allows the reader to more reliably guess a file as being encoded in UTF-8.

-  **Xml indent size**

   The indent size to use when saving Xml files.

-  **Json indent size**

   The indent size to use when saving Json files.

FHIR
~~~~

.. figure:: ../images/Settings_FHIR.png
   :alt: The FHIR settings
   :width: 450px

-  **Validate FHIRPath expressions**

   All FHIRPath expressions in your resource are validated when this option is checked.

-  **Initialize global mappings from base profile**

   When creating a new profile this option will copy all the mappings from the base profile to the new profile.

 .. image:: ../images/Settings_GlobalMappings.png
    :scale: 65%

-  **Discard DomainResource.text values**

   When this option is checked the **text** element of a **DomainResource** is cleared when it is opened.
   In effect this will clear the **Narrative** of your resource.

 .. image:: ../images/Settings_DiscardResourceText.png
    :scale: 65%

Folders
~~~~~~~

.. figure:: ../images/Settings_Folders.png
   :alt: The folders settings
   :width: 450px

-  **Parent folder FHIR projects**

   The default parent folder for your FHIR projects.
