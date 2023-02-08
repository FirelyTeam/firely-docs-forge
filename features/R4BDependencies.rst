.. _r4b-package-dependencies:

Adding R4B dependencies to your project
=======================================

Forge uses Simplifier as a package registery when looking for packages. As Simplifier does not currently support R4B, it is not possible to add R4B packages via the normal route. Luckily there is a workaround allowing these packages to be used as dependencies in Forge. For this you can follow these steps:

1.	Download the package of your interest, in this example we will take the hl7.fhir.r4b.core#4.3.0 package  (you can find it here: https://hl7.org/fhir/downloads.html)
2.	In your downloads folder, extract the resulting tgz file so that you will get a tar file. After this extract the tar file so that you obtain a package folder:

    .. figure:: ../images/unpacking_tgz.png

3.	Add the package folder to the following directory: C:\\Users\\<USERNAME>\\.fhir\\packages
4.	Rename the package folder to the package name: hl7.fhir.r4b.core#4.3.0
5.	Within this folder, make sure all files that are not yet in subfolders are added to a subfolder named “package”:

    .. figure:: ../images/r4b_package_folder.png

6.	In your Forge project folder add a file named "package.json” with the following content:
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

7.	Restart Forge and have a look at your dependency tab, your package should be listed there:

    .. figure:: ../images/r4b_dependencytab.png

