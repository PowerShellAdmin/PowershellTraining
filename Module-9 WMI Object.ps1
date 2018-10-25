#Wmi Explorer by PI Snapin
help Get-WmiObject  -ShowWindow
Help About_WMI -ShowWindow

#Display All the WMI Classes

Get-WmiObject -List | out-gridview # Will Show you classes under default CIM V2
Get-WmiObject -List -Namespace Root\Standardcimv2 | out-gridview # Wil show you classes under Standard CIMV2

Get-WmiObject -List | Where-Object {$_.name -Like '*service' } # Win32_Service Or Win32_BaseService
Get-WmiObject -List | where {$_.name -Like '*logicaldisk*'} # Win32_Logicaldisk
Get-WmiObject -List | where {$_.name -Like '*time*'}
Get-WmiObject -List | where {$_.name -Like '*Process*'}
Get-WmiObject -List | where {$_.name -Like '*bios*'}
Get-WmiObject -List -Namespace "root/standardcimv2"| where {$_.name -Like '*firewall*'}

Get-WmiObject -List -Namespace "root/standardcimv2" |where {$_.name -Like '*firewall*'}

gwmi -Namespace "root/standardcimv2" -Class MSFT_NetFirewallRule | Select-Object Displayname, Description, Direction

Get-WmiObject -Class win32_logicaldisk 
Get-WmiObject -Class win32_logicaldisk | WHere {$_.drivetype -ne 5}
Get-WmiObject -Class win32_logicaldisk | WHere {$_.DeviceID -ne "E:"}

Get-WmiObject -Query "Select * from Win32_logicaldisk" -ComputerName localhost

gwmi Win32_service -Filter 'Name like "Bit%"' # Should not consided using Wmi Filtering because it used all together different set of operators

gwmi Win32_service  | where {$_.name -like "Bit*"}# Instead we should use Powershell for filtering Where-Object

gwmi Win32_service -Filter 'Name = "Bits"'

gwmi win32_service | where {$_.state -ne "Running" -and $_.Startmode -eq "Auto"} | Sort-Object Name | Format-Table -AutoSize

Get-WmiObject -Class Win32_LogicalDisk
Get-WmiObject -Class Win32_Process |?{$_.ProcessName -eq "Notepad.exe"}

gwmi win32_service | gm
gwmi win32_service | ?{$_.name -eq "Bits"} | fl *

gwmi -Class Win32_BIOS | format-list *

gwmi win32_operatingsystem  | Get-Member

(Get-WmiObject win32_operatingsystem -ComputerName localhost).reboot() 

Get-WmiObject win32_operatingsystem -ComputerName localhost | Get-Member Invoke-WmiMethod -Name Reboot

Get-WmiObject -Class Win32_NteventLogfile -Filter "Logfilename = 'Application'"

Get-WmiObject -Class Win32_service -Filter "Name ='Bits'"| ForEach-Object{$_.change($null,$null,$null,$null,$null,$null,$null,'P@ssw0rd')}

Gwmi win32_product |where {$_.Vendor -ne "Microsoft Corporation"} |gm

Gwmi -Class MSFT_netfirewallrule -Namespace "root/standardcimv2"

#Traditional WMI Object command communicates with network devices using DCOM protocol, Powershell remoting, Winrm service, WSMAN 
Get-WmiObject -Class Win32_operatingsystem -ComputerName Remote # DCOM


Get-CimInstance -ClassName Cim_operatingsystem -CimSession $session # WinRM
Get-WmiObject -Class Win32_operatingsystem -ComputerName $SERVER  -Credential $cred
Get-CimInstance -ClassName cim_service -ComputerName Localhost #CIM provider model that uses WinRM to remove the dependency on DCOM
Get-WmiObject -ClassName Win32_service -ComputerName localhost #DCOM to communicate with networked devices to manage remote systems

Get-CimInstance -ClassName cim_logicaldisk
Get-WmiObject -ClassName win32_logicaldisk


