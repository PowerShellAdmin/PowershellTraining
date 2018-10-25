
Help about_Modules -ShowWindow
<#
What Is Module?

A module is a package that contains Windows PowerShell commands, such as cmdlets, providers, functions, workflows, variables, and aliases. 

People who write commands can use modules to organize their commands and share them with others. People who receive modules can add the commands
in the modules to their Windows PowerShell sessions and use them just like
the built-in commands.

Beginning in Windows PowerShell 3.0, Windows PowerShell imports modules automatically the first time that you run any command in 
an installed module. You can now use the commands in a module without any set-up or profile configuration, so there's no need to
manage modules after you install them on your computer.
    
The commands in a module are also easier to find. The Get-Command cmdlet now gets all commands in all installed modules, even if they are not yet
in the session, so you can find a command and use it without importing.
#>

#To find all the commands associated with modules
Get-Command -Name *-Module*

#How to find the location of Modules
$env:PSModulePath

#To display all paths on different lines
($env:PSModulePath).Split(";")

#Below is The command to display all the modules available onyour machine
Get-Module -ListAvailable

#How to find commands in an Existig modules e.g Servermanager By default available on Server OS
Get-Command -Module NetTCPIP

#How to get help for the CMDLETS in a Module:

Help Get-windowsfeature -ShowWindow
Help Add-windowsFeature -ShowWindow
Help Remove-windowsFeature -ShowWindow

#How to import a module in to Powershell Console
#Import-module cmdlet is applicable only for PSversion lower than or equal to 2.0. By default Module autoloading feature is not available hence we need to import the module that we want to work on
#Also Importing is required when a module is not installed in the locations specified by the PSModulePath environment variable ($env:PSModulePath), or the module consists of file, such
#as a .dll or .psm1 file, instead of typical module that is delivered as a folder.
Import-module -Name ServerManager

#Working on Module e.g. 2


Get-Command -Module NetAdapter

#Explore the commmands further in this module
Help Get-NetAdapter -ShowWindow
Help Get-NetAdapterAdvancedProperty -ShowWindow
help Get-NetAdapterQos -ShowWindow


###############
Get-Command -Module Hyper-V