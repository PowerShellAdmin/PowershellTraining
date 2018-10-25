Get-WmiObject win32_operatingsystem

$computername = "Localhost"

$os = Get-WmiObject win32_operatingsystem -computername $computername
$cs = gwmi win32_computersystem -computername $computername
$ipaddress= Get-NetIPAddress -InterfaceIndex 3 -AddressFamily IPv4



$Hash = @{
            'Computername' = $computername;
            'Osbuild'= $os.BuildNumber;
            'Servicepack' =$os.ServicePackMajorVersion;
            'Manufacturer' =$cs.Manufacturer;
            'RAM(G)' =$cs.TotalPhysicalMemory /1GB -as [int];
            'IPaddress' =$ipaddress.ipaddress
        }

$Hash | gm
        
$object = New-Object -TypeName PSobject -Property $hash
$object | New-ItemProperty -Name -Value
$object | Get-Member
$object.Computername
$object.'RAM(G)'


### Another Example with Additional properties

$props = @{
            'Computername'= $computername;
            'osbuild'= $os.buildnumber;
            'spVersion'=$os.servicepackmajorversion;
            'Model'=$cs.model;
            'Manufacturer'= $cs.manufacturer;
            'RAM'= $cs.Totalphysicalmemory /1Gb -as [int];
            'Socket'=$cs.numberofprocessors;
            'cores'=$cs.numberoflogicalprocessors;
            
          }



$obj = New-object -typename PSObject -property $props
Write-Output $obj