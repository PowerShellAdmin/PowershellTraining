Help about_Providers

<#

--What are providers?
--How filesystem is organised
--how the filesystem is like other data stores
--Navigating
--Using wildcards and literal paths
--working with other providers

#>

#Ps providers acts as the some kind of adapters between Shell and Storage

Get-PSProvider

#Each provoider has some kind of capabilities Credentials, Filters, ShouldProcess

Get-PSDrive # drives in powershell dont have drive letters but drive name

Cd HKCU:
Get-ChildItem
cd HKCU:\AppEvents

dir *.txt -Recurse # Path
help *Item*

Help Get-Item

help Get-ItemProperty

Get-Item -path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Version Vector"

get-item hklm:\software\microsoft\powershell\1\shellids\* 

Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Version Vector"

Get-ItemProperty -path HKLM:\SOFTWARE\Microsoft\PowerShell\1\PowerShellEngine

Get-ItemProperty -path HKLM:\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell 

##Modify the registry

Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell -Name ExecutionPolicy -Value Unrestricted

get-childitem weekly.txt | set-itemproperty -name IsReadOnly -value $true

Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Enrollment\Settings -name EnableSettings -value 1

get-itemproperty -path HKLM:\SOFTWARE\Microsoft\Enrollment\Settings

#working withFile System

Get-ChildItem C:\Windows\System32 

Get-ChildItem C:\Windows\System32 -Filter *.dll

Get-ChildItem C:\Windows\System32 -Name x*

Get-ChildItem -path C:\Windows\System*\windowspowershell

Get-ChildItem -LiteralPath C:\Windows\assembly 


$date =(get-date).AddDays(-5)

Get-Date | Get-Member


Get-ChildItem C:\Windows\System32 | ?{$_.LastWriteTime -gt $date} | Remove-Item


## Working with Cert provider

Get-ChildItem Cert:\CurrentUser\My

Get-ChildItem Cert:\Localmachine\* -Recurse 

Get-ChildItem Cert:\Localmachine\* -Recurse |?{$_.FriendlyName -like "Entrust"}

Get-ChildItem Cert:\Localmachine\*  -Recurse| Select ThumbPrint,Version,DNSNamelist,Subjectname

Get-ChildItem Cert:\Localmachine\*  -Recurse| ?{$_.DnsNameList -like "Dell*"}| Select ThumbPrint,Version,DNSNamelist,Subjectname

Get-ChildItem Cert:\Localmachine\*  -Recurse| ?{$_.DnsNameList -like "mantra*"}| Select -expand ThumbPrint


New-Item -Path C:\Users\Supercoach\Desktop\ -ItemType Directory -Name PowershellTest

New-Item -Path C:\Users\Supercoach\Desktop\PowershellTest -ItemType file -Name PowershellTest.txt