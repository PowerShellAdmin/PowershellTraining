##Find the status of Bits,WSearch from Multiple rempote machine
$a = "<style>"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 10px;border-style: solid;border-color: black;}"
$a = $a + "TD{border-width: 1px;padding: 10px;border-style: solid;border-color: black;}"
$a = $a + "</style>"


Get-Service -name bits,WSearch -ComputerName Localhost,M4500 |Select Name,MachineName,Status,StartType| ConvertTo-Html -Head "<H2> Services Status</H2>" -Body $a | Out-File C:\Users\Administrator\Desktop\CustomServices.htm


#Checking eventlog

Get-EventLog -LogName system | ?{$_.Source -match "Kernel-Power"} | select EventID,MachineName,Index,Category,CategoryNumber,EntryType,Message,Source,InstanceId,TimeGenerated,TimeWritten -First 10 | ConvertTo-Html -Head "<H2> Eraneaous Event Logs</H2>" -Body $a | Out-file C:\Users\Administrator\Desktop\event.html

##Find the services whose Startup is Automatic and Status is stopped.

#Server Uptime
#Reboot computer


Test-Connection -ComputerName Localhost | gm


