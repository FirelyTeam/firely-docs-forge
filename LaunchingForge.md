# Launching Forge

## Start Menu

The easiest way to launch Forge is via the start menu shortcut that the
ClickOnce installer creates during the installation. Alternatively, open
the start menu and search for *\"Forge\"*. Windows should locate and
display the shortcut to the application. You can manually pin the
shortcut to the start menu or the taskbar for your convenience.

## Command line

You can also start Forge from the command line. This allows you to
launch Forge programmatically, from other applications. You can start
the application from code in different ways:

1.  Directly, via the main executable
    
    First, you need to determine the installation folder that contains the
    application.

        STU3: Forge.UI-R3.dll
        R4  : Forge.UI-R4.dll
        R4B : Forge.UI-R4B.dll
        R5  : Forge.UI-R5.dll

    Unfortunately, the ClickOnce installer
    deploys the application to a personalized AppData subfolder that is
    hard to find. The Forge Options menu provides a command *Open
    application folder* that helps you find the location of the ClickOnce
    installation folder that contains the main executable. 
    The command line to start Forge for STU3 from the application folder is as follows:
    
        "C:\Program Files\dotnet\dotnet.exe" Forge.UI-R3.dll
      
2.  Indirectly, via the start menu shortcut (the example is for STU3)
    
    You can also launch the start menu `.appref-ms` shortcut created by
    the ClickOnce installer from code. The start menu shortcut is always
    created in a fixed location with the following path:

        %APPDATA%\Microsoft\Windows\Start Menu\Programs\Firely\Firely FHIR Tools\Forge for HL7 FHIR STU3.appref-ms

    Alternatively, you can create or generate an `.appref-ms` shortcut in
    a well-known location. The shortcut is a single-line text file with
    the following contents:

        http://downloads.simplifier.net/forge/stu3/Forge-R3.application#Forge-R3.application, Culture=neutral, PublicKeyToken=ac5f0d017c71eb2e, processorArchitecture=msil

## Command line arguments

Forge accepts command line arguments. You can
specify one or more documents to open:

    "C:\Program Files\dotnet\dotnet.exe" Forge.UI-R3.dll [filePath] [filePath] [...]

The specified arguments must be fully qualified absolute file paths.
After startup, Forge will try to load all the specified files, if they
exist.
<!--
If you launch Forge indirectly via the `.appref-ms` shortcut, then you
can also specify a single (!) command line argument. For example: :

    "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Firely\Firely FHIR Tools\Forge for HL7 FHIR STU3.appref-ms" "C:\Profiles\MyPatient.xml"

Unlike the main executable, the `.appref-ms` shortcut does not accept
multiple command line arguments. This is a limitation of the ClickOnce
installer technology.
-->
