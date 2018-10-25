
#What is my powershell Version

$PSVersionTable

# Help and Get-help two tools with same funtionality

help Get-Service
##Updating Help
Help Update-Help -ShowWindow

Update-Help 

##Updating Ofline Help
Save-Help -DestinationPath 'C:\Users\supercoach\Desktop\Help'

Update-Help -SourcePath 'C:\Users\supercoach\Desktop\Help'

#Finding Help 

Help <#and#> Get-help

help *Word*

Help *Service*

Help *Process*

Help *Reboot* ## No Valid result

Help *Restart*

Help *Ipaddress*

Get-Help *evenetlog*

Get-Help Get-Service

#Get-Help Get-Service -Detailed

Get-Help Get-Service -Full 

Get-Help Get-Service -Examples

Get-Help Get-Service -ShowWindow # PS V5 

Get-Help Get-Service -Online

Get-Command -Verb Get

Get-Command -Noun S*

#Types of Parameter
#Mandatory
help Get-Service  -ShowWindow
Help Get-EventLog

#Positional
Help Get-Service
Help Get-EventLog

Get-EventLog -LogName Application -Newest 10

#valid if we are passing the only parameter name at 1st Position
Get-EventLog Application -Newest 10

Get-EventLog -Newest 10 -LogName Application


#Switch Parameter

Get-eventlog -List

#Comma Seperated Values
Get-Service -name Bits, Server

#Optional Parameter

Get-process -Name N*

Get-Process

Get-Service

## Finding commands with Verb, noun and Name of Commands

Get-command

Get-Command -Verb Get

Get-Command -Noun disk

Get-Command -Name Get-Service

Get-Command -Module NetAdapter

Get-Command -CommandType Cmdlet 

    
#Some Command Line ShortCuts

#Tab Button to Autocomplete the commands, parameters, Lookup for Next command matching command
#Shift Tab to reverse lookup for earlier command
#Ctrl + Left one Word Shift to the left
#Ctrl + right one Word Shift to the right
#Home Button for bringing the cursor at the begining of line
#End for bring the cursor at the end of line
#F5 to execute entire script in ISE
#F8 to Execute the one line at a time or Execute the only Selection.
#Ctrl + Break for Stopping the Command execution
#CLs for clearing the screen
#F9 adding/Toggling breakpoints 


#Mandarory: If the parameter name and parameter value both are not enclosed in square bracket
#Optional parameter:If the parameter name and parametyer value both are enclosed in square bracket
#Positional Parameter: If Parameter name only is enclosed in sqare bracket that parameteris positional. There are 2 types of position Named and numbered
#Switch: Does not accept any input value & Always enclosed in sqare bracket.
#Input Values:String, Int, Servicecontroller, POrocess etc
#Face to Face[]: That parameter accepts comma seperated values


help Clear-EventLog
#How many Paramenter Set[count]
#Mandatotory Parameters [count]:
             Name of mandatory Parameter:    
                
#Switch Parameter [count]:
             Name of Switch Parameter:
#Parameters that accept Comma seperated values[count]: 
             Name of Switch Parameter:

help Start-Service
Help Stop-Process
Help Restart-Computer
Help Get-NetAdapter
help Get-ChildItem
Help Invoke-Command
Help Enter-PSSession
Help Exit-PSSession
Help Get-Job
help Receive-Job
Help Get-WmiObject
Help Get-Member


