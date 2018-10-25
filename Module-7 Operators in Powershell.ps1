<#
Getting just what you need
Filter Left
Comparion Operator
Filtering objects out of the pipeline
#>
Help *Operator*

help about_Arithmetic_Operators -ShowWindow
help about_Logical_Operators -ShowWindow
help about_Comparison_Operators -ShowWindow
help about_Assignment_Operators -ShowWindow
Help about_Operator_Precedence -ShowWindow


###Arithmetic Operations###
$A = 10
$B = 12
$C = "Monday"
$D = "Sunday"

#Addition for INT and concatination for String
$A+$B

$c + $D
$C+"`t" +$D ##`t is for Tab space
$C+"`n" +$D ##`n is new line 

#Subtraction
$A-$B

#Negative Numbers
-$A+$B

#Multiplication
$A*$B

#Division
$A/$B

#Modulus
$B%$A

###Logical Operations###

#Or Operation
0 -Or 0
0 -Or 1
1 -Or 0
1 -Or 1

$false -Or $false
$false -or $true
$true  -or $false
$true  -or $true

#And Operation
0 -and 0
0 -and 1
1 -and 0
1 -and 1

$false -And $false
$false -And $true
$true  -And $false
$true  -And $true

#XOR Operation
0 -Xor 0
0 -Xor 1
1 -Xor 0
1 -Xor 1

$false -Xor $false
$false -Xor $true
$true  -Xor $false
$true  -Xor $true

#Not Operation
-not 0
-not 1
-not $false
-not $true
!1
!0

####Comparison#####
$A = 10
$B = 10
$C = "Monday"
$D = "Sunday"

$A -eq $B # Equals to
$A -ne $B # Not Equals to
$A -gt $B # Greater Than
$A -ge $B # Greater than Equals 
$A -lt $B
$A -le $B

##Like Operator
"Monday" -Like "Mon*"
"Pune" -Like "*un*"

"Monday" -notLike "Monda*"
"Pune" -notLike "*un*"

Get-Service | Where {$_.name -like "*B*"} | ft -Wrap
Get-Process | where {$_.Name -like "*s*"}

##Match Operator
"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" -Match "Saturday" ## Can be Used with regular Expressions
"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" -match "Sunday"

'123-45-6789' -match '\d\d\d-\d\d-\d\d\d\d'
'233-55-6789' -match '\d\d\d-\d\d-\d\d\d\d'
"211.168.15.20" -match "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"

##Contains Operator
"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" -Contains "Friday"
"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" -NotContains "Sunday"
"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" -Contains "Sunday"

##Replace Operator
"Get-Service" -Replace "Get" , "Stop"

"Getready" -replace "Get" , "Set"

("Get-Service -Name BITS" ) -replace "Get", "Stop"

'Today is Monday' -replace "Monday","Friday"

##Practical Usecases
Get-Service | Where-Object {$_.StartType -eq "Manual"} | select Name, Status,StartType,DisplayName # Displaying Services with Starttype as Manual
Get-Service | Where-Object {$_.Status -eq "Running"} | select Name, Status,StartType,DisplayName # Displaying Services with Status as Running

Get-Service | Where-Object {($_.Status -eq "Stopped") -and ($_.StartType -eq "Automatic")}| 
select Name, Status,StartType,DisplayName | Measure # Displaying Services with Status as Stopped and Starttype as Automatic

Get-Process | Where-Object {$_.NPM -gt "100KB"}
Get-Process | Where-Object {$_.PM -gt "50000KB"}
Get-Process | Where-Object {$_.CPU -gt "550"}
Get-Process | Where-Object {$_.CPU -gt "70"}

Get-Service -Name 'WinRM'

Get-Service | where{$_.name -eq "Winrm"}

Get-Service | ?{$_.name -like "Win*"}

Get-Service | ?{$_.name -like "Win*" -and $_.status -eq 'Running'}

##Service Starttype "Manual" Status is "Running"
Get-Service | where {($_.StartType -eq "Manual") -and (($_.Status -eq "Running") -or 
                                                      ($_.Status -eq "Stopped") ) }
##Service Starttype "Manual" Status is "Stopped"

## Process with CPU value greater than 65

##Process With PM value greater than 40000KB
## Assignment Operator

## Find the event logs in System category where message body contains 
#"Windows successfully installed the following update" String

Get-EventLog -LogName "System" | 
Where-Object {$_.Message -contains "Update started downloading"} | select -First 10



Get-EventLog -LogName "System" | 
Where-Object {$_.Message -like "*Windows successfully*"} | select -First 10


$P = 19
$P = 20
$P += 15

$Q = "Monday"
$Q += "Tuesday"

$P = 19
$P -= 2
$P


$P = 19
$P /= 2
$P


$P = 19
$P *= 2
$P

$P = 19

$P++
$p--

