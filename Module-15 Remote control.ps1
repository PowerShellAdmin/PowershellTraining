Help About_remote -ShowWindow

Help Invoke-Command -ShowWindow

<#
You can run remote commands on a single computer or on multiple computers by using a temporary or persistent connection. You can also
start an interactive session with a single remote computer.


WSMAN overview?
Windows Remote Management is the Microsoft implementation of the WS-Management protocol, a standard SOAP-based, firewall-friendly 
protocol that allows hardware and operating systems from different vendors to interoperate. The WS-Management protocol specification 
provides a common way for systems to access and exchange management information across an information technology (IT) infrastructure.
WS-Management and Intelligent Platform Management Interface (IPMI),along with the Event Collector, are components of the Windows Hardware
Management features. 

The WS-Management protocol is based on the following standard Web service specifications: HTTPS, SOAP over HTTP (WS-I profile), SOAP 1.2, 
WS-Addressing, WS-Transfer, WS-Enumeration, and WS-Eventing. 

WS-Management and WMI?

WS-Management can be used to retrieve data exposed by Windows Management Instrumentation (WMI). You can obtain WMI data with scripts or
applications that use the WS-Management Scripting API or through the WinRM command-line tool. WS-Management supports most of the familiar WMI
classes and operations, including embedded objects. WS-Management can leverage WMI to collect data about resources or to manage resources on a
Windows-based computers. That means that you can obtain data about objects such as disks, network adapters, services, or processes
in your enterprise through the existing set of WMI classes. You can also access the hardware data that is available from the standard WMI IPMI
provider.

"Secreats of Powershell remoting" http://powershellBooks.com
#>

$server= "WIN-99CBC03C533"

$cred = Get-Credential

Get-Service -ComputerName
Get-EventLog -ComputerName

#Remoting allowes you to make connection with another computer over http or https. 
#You transmit commands those are executed locally on that machine and trasnmit the results back

Enable-PSRemoting

Get-PSSessionConfiguration

Ping $server -4
##When you remote to remote computer your credentials are delegated to remote computer, if you want to run in the cross forest scenerio you can do that with certificates
##it is completly security transperant
$server= "WIN-99CBC03C533"
Set-Item WSMan:\localhost\Client\TrustedHosts -Value $server –Force
Get-Item WSMan:\localhost\Client\TrustedHosts

Help *Pssession*

$cred = Get-Credential

Enter-PSSession -ComputerName $server -Credential $cred #One to one

$servers = Get-Content C:\Temp\Servers.txt
Foreach ($Server in $servers)
{

Enter-PSSession -ComputerName $server -Credential $cred #One to one

}


Enter-PSSession -ComputerName $server

##Execute some commands etc
help Exit-PSSession

$session = New-PSSession -ComputerName S1 -Credential $cred
Disconnect-PSSession -Session $session

Get-Service -ComputerName
<#only one hop thats a limitation
#Credssp
Enable-WSManCredSSP
Enable-WSManCredSSP -Role Client -DelegateComputer *.domain.com
#enables second hop in entire domain
Enable-WSManCredSSP -Role server#>


#####Non Interactive Powershell Remoting
#$server = "S1"

Invoke-Command -ScriptBlock {Get-EventLog -LogName Application -Newest 5} `
                    -ComputerName $server -Credential $cred

Invoke-Command -ScriptBlock {Get-Service -Name BITS | Start-Service -PassThru} `
                            -ComputerName $server -Credential $cred


Invoke-Command -ScriptBlock {Get-WindowsFeature | 
        Where-object {$_.installstate -eq "Installed"} | Select -Property Name }`
        -ComputerName $server -Credential $cred


Invoke-Command -ScriptBlock {Get-Service -Name BITS
                             Get-Process -Name c* 
                             Get-date
                             Hostname  } `
                                                    -ComputerName $server -Credential $cred

Invoke-Command -ScriptBlock {Get-WindowsFeature -Name S* | Select name}`
-ComputerName $server -Credential $cred

Invoke-Command -ScriptBlock {Add-WindowsFeature -Name SNMP-Service}`
-ComputerName $server -Credential $cred

Invoke-Command -ScriptBlock {Restart-Computer -Wait}`
-ComputerName $server -Credential $cred

Restart-Computer -ComputerName $server -Credential $cred -Wait -Force

#Executing the File which is available on local machine on remote machine
Invoke-Command -ComputerName $server -FilePath "C:\Users\Supercoach\Desktop\Test.ps1" -Credential $cred


# Parallel Execution of 
Invoke-Command -ScriptBlock {Get-EventLog -LogName Application -Newest 5} -ComputerName (Get-Content C:\temp\Servers.txt) -Credential $cred

############
$server = "WIN-99CBC03C533"

Invoke-Command -computerName $server -command { Write-Host "Servername is $Using:server" } -Credential $cred


$servers = Get-Content C:\Temp\Servers.txt

Foreach($server in $servers){
    Invoke-Command -computerName $server -command { Write-Host "Servername is $Using:server" } -Credential $cred
}

$count = $servers.Length


for($i=0; $i -le $count ; $I++)
{

Invoke-Command -computerName $serverS[$I] -command { Write-Host "Servername is $Using:server" } -Credential $cred


}



# Executing the File which is available on remote machine
Invoke-Command -computerName (Get-Content C:\Temp\Servers.txt) `
               -command { Powershell.exe -Command {& 'C:\Users\Administrator\Desktop\Test1.Ps1'}} `
               -Credential $cred 

#Executing the File which is available on local machine on remote machine
Invoke-Command -ComputerName $server -FilePath "C:\Users\Administrator\Desktop\DLLVersion Check.ps1" -Credential $cred


Invoke-Command -computerName Localhost,ServerName `
-command { Get-EventLog Security -newest 200} |`
Where { $_.EventID -eq 1212 }

###
#$servers = Get-Content C:\temp\Servers.txt
$servers = "DC"
foreach ($server in $servers)
{
Invoke-Command -ComputerName $server -ScriptBlock {Get-Service -name BITS | `
Select-object -Property Name,Pscomputername,starttype,Status } -Credential $cred
}

###

$servers = Get-Content C:\temp\Servers.txt

foreach ($server in $servers)
{
Invoke-Command -ComputerName $server -ScriptBlock {D:\ps\Services.ps1} | `
select-object -Property Name,Pscomputername,starttype,Status
}

####
$servers = Get-Content C:\temp\Servers.txt

foreach ($server in $servers)
{
Invoke-Command -ComputerName $server -ScriptBlock {D:\ps\ServerRole.ps1} | select-object -Property Name,Pscomputername,starttype,Status
}


$server = "WIN-99CBC03C533"

Invoke-Command -ScriptBlock {Write-Host "$server Testing"} -ComputerName $server -Credential $cred
 

Invoke-Command -ScriptBlock {Write-Host "$Using:server Testing"} -ComputerName $server -Credential $cred
