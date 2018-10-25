Help About_switch -ShowWindow

$Number =8
 switch($Number)
         {
            1 {"It is one."}
            2 {"It is two."}
            3 {"It is three."}
            4 {"It is four."}
            5 {"It is Five."}
            default { "None of the above"} 
         }



 [int]$Number = Read-Host -Prompt "Please provide Input Value" 
 switch($Number)
         {
            1 {Get-Service -Name BITS | Start-Service -Verbose}
            2 {Get-Service -Name Winrm | Start-Service -Verbose}
            3 {Get-Process -Name notepad | stop-process -Verbose}
            4 {Get-Service -Name AdobeARMservice | stop-Service -Verbose}
            5 {Start-Process nOTEPAD -Verbose}
            default { "No Service available to start or stop"} 
         }

######################
$SERVER = "bluTelnet001"

IF($SERVER -match "AD"){
    $serverRole = 'AD'
}
elseIF($SERVER -match "SQL"){
    $serverRole = 'SQL'
}
ElseIF($SERVER -match "FS"){
    $serverRole = 'FS'
}
elseif($SERVER -match "DHCP"){
    $serverRole = 'DHCP'
}
else{
    $serverRole = 'Default'
}

Switch($serverRole)
    {

        AD     {Write-Host "Perform Operation on Active Directory Server" -ForegroundColor Green}
        DNS    {Write-Host "Perform Operation on DNS server"-ForegroundColor Green}
        DHCP   {Write-Host "Perform Operation on DHCP server"-ForegroundColor Green}  
        FS     {Write-Host "Perform Operation on File Server server"-ForegroundColor Green}  
        SQL    {Write-Host "Perform Operation on SQL server"
                Get-Service -Name Bits | Stop-Service -Force -Verbose
               }  
        default{Write-Host "Default Server Action" -ForegroundColor Green} 
    }
        