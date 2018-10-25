Help About_object -ShowWindow
#What is object?
<#
An object, then, is a collection of data that represents an item. An object is made up of three types of data: the 
objects type, its methods, and its properties.

Every action you take in Windows PowerShell occurs within the context of objects. As data moves from one command to the next, 
it moves as one or more identifiable objects. 
#> 

#Why do we use Objects in powershell?

Help *Object*
Get-Process | Get-Member # Helps in identifying Object Type, Properties and Methods associated with Object (Process)

Get-Service | Get-Member # Helps in identifying Object Type, Properties and Methods associated with Object (Servicescontroller)

#Properties : Object properties store information about the object. For example, FileInfo objects have a LastWriteTime property that stores the date and time that the file was most recently accessed.
#Methods :The object methods are actions that you can perform on the object. For example, FileInfo objects have a CopyTo method that you can use to copy the file. 

#How to Access Properties and methods Associated with Object
#Accessing Properties
(Get-Service -name bits).Name # only single Propertiy can be accessed by using this dotted method
(Get-Service -name bits).Status 
(Get-Service -name bits).StartType
(Get-Service -name bits).DisplayName

#Accessing Methods
(Get-Service -name bits).Stop() # only single method can be performed by using this dotted method, Note PS console must be running as Admin
(Get-Service -name bits).Start() 
(Get-Process -Name notepad).Kill()

# How to Select multiple Properties

Get-Process| Select-Object Name,PM,VM,CPU -First 10 # To identify Properties execute Get-process | Get-Member

Get-EventLog -LogName Application | Get-Member

Get-EventLog -LogName Application| Select-Object EventID, TimeGenerated, Message -First 10
Get-Service | Select Name, StartType, Status, DisplayName

Get-Member # Helps you display the Properties and Menthods of Object along with the Type of Object that is being Generated

#Playing with objects
#By Default when we are selecting properties, if these properties are being measured in some measurements it will be lost. Most in case of Process e.g.  hence to bring it back in the format that we wish to see we need to perform some mathematics evaluation. The mathematical evaluation can be done by using inline Hash table

#Inline Hash Table
#@{Name = "Column Name"; Expression ={$_.Propertyname/1GB" }}  Construct 1
#@{N = "Column Name"; E ={$_.Propertyname/1GB"}}               Construct 2
#@{Label = "Column Name"; Expression ={$_.Propertyname/1GB"}}  Construct 3

Get-Process |Sort-Object -Property PM -Descending | Select Name, @{Name = "PM(MB)"; Expression ={$_.PM/1MB -as [int] }}, 
                                                                 @{Name = "CPU"; Expression ={$_.CPU -as [int] }}, 
                                                                 @{Name = "VM(GB)"; Expression ={$_.VM/1GB -as [int] }} -First 1

# to display upto 2 decimal points
Get-Process | Sort-Object -Property PM -Descending | 
Select-Object Name, 
    @{Name= "VM(GB)";Expression={$_.VM/1GB -as [int]}},
    @{Name= "PM(MB)";Expression={[math]::Round($_.PM/1MB,2)}},
    NPM -First 10

# Additional use cases for Disk space reporting 

Get-WmiObject -Class win32_logicaldisk

Get-WmiObject -Class Win32_logicaldisk |
                Where-Object {$_.drivetype -eq 3} | 
                Select-Object @{Name = "Drivename"; Expression ={$_.DeviceID}},
                @{Name = "Freesize(G)"; Expression ={[math]::Round($_.Freespace/1GB,2)}},
                @{Name = "Size(G)"; Expression ={$_.Size/1GB -as [int]}},
                @{Name = "%Free"; Expression ={($_.FreeSpace/$_.Size)*100 -as [int]}}


# If I wish to generate a HTML report then 
Get-WmiObject -Class Win32_logicaldisk |
                Where-Object {$_.drivetype -eq 3} | 
                Select-Object @{Name = "Drivename"; Expression ={$_.DeviceID}},
                @{Name = "Freesize(G)"; Expression ={[math]::Round($_.Freespace/1GB,2)}},
                @{Name = "Size(G)"; Expression ={$_.Size/1GB -as [int]}},
                @{Name = "%Free"; Expression ={($_.FreeSpace/$_.Size)*100 -as [int]}} |
                ConvertTo-Html -Head "<h1>Disk Space report</h1>" |
                Out-file C:\Users\$env:USERNAME\Desktop\diskspacereport.html


# If I wish to generate a HTML report with tables

#Standard HTML code for creating tables, additional parameters can be added like background colors and all for additional cosmetic changes
$a = "<style>"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 10px;border-style: solid;border-color: black;}"
$a = $a + "TD{border-width: 1px;padding: 10px;border-style: solid;border-color: black;}"
$a = $a + "</style>"

 
Get-WmiObject -Class Win32_logicaldisk |
                Where-Object {$_.drivetype -eq 3} | 
                Select-Object @{Name = "Drivename"; Expression ={$_.DeviceID}},
                @{Name = "Freesize(G)"; Expression ={[math]::Round($_.Freespace/1GB,2)}},
                @{Name = "Size(G)"; Expression ={$_.Size/1GB -as [int]}},
                @{Name = "%Free"; Expression ={($_.FreeSpace/$_.Size)*100 -as [int]}} |
                ConvertTo-Html -Head "<h1>Disk Space report</h1>" -Body $a |
                Out-file C:\Users\$env:USERNAME\Desktop\diskspacereport.html











