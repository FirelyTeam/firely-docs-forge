.. _r4b-package-dependencies:

Adding R4B dependencies to your project
=======================================

Forge uses Simplifier as a package registery when looking for packages. As Simplifier does not currently support R4B, it is not possible to add R4B packages 
via the normal route. Luckily there is a workaround allowing these packages to be used as dependencies in Forge. For this you can follow these steps:

1. Download the `R4B package <https://hl7.org/fhir/R4B/downloads.html>`__ of your interest, in this example we will take the **hl7.fhir.r4b.core#4.3.0** package.
2. In your downloads folder, extract the resulting **tgz** file using "extract here". You will get a **tar** file in the downloads folder with the same name as  
   the **tgz** file. After this extract the **tar file**, again using the "extract here" option. You will end up with a folder named **package**.

   .. figure:: ../images/unpacking_tgz.png
      :scale: 80%
3. Rename the package folder to the package name: **hl7.fhir.r4b.core#4.3.0**
4. Copy the package folder to the following directory **C:\\Users\\<USERNAME>\\.fhir\\packages** where **<USERNAME>** is your user name.
5. Within this folder, make sure all files that are not yet in subfolders are added to a subfolder named **package**.
    
   **Before:**

   .. figure:: ../images/r4b_no_package_folder.png
      :scale: 80%
    
   **After:**

   .. figure:: ../images/r4b_package_folder.png
      :scale: 80%

6. In your Forge project folder add a file named **package.json**. Add your own **name** and **description** reflecting your project. It should roughly have the following content:
    
   ::

        {
            "name": "MyR4BProject",
            "version": "0.1.0",
            "description": "My R4B project",
            "dependencies": {
                "hl7.fhir.r4b.core": "4.3.0"
            },
            "fhirVersions": [
                "4.3.0"
            ]
        }

7. Restart Forge and have a look at your dependency tab, your package should be listed there:

   .. figure:: ../images/r4b_dependencytab.png

Installing packages with Firely Terminal
----------------------------------------

It is also possible to use Firely Terminal to install packages. While Firely Terminal also uses Simplifier as a package repository when looking for packages, 
it is able to install packages from local **tgz** files as well. Using Firely Terminal, the package tgz is automatically extracted with the correct name and 
folder structure and a **package.json** is also automatically generated for your project. For more information you can check out 
our `documentation on Firely Terminal <https://docs.fire.ly/projects/Firely-Terminal/Managing-Packages.html#install-a-file>`__.

