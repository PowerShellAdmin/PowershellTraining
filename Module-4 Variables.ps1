## Variables in Powershell are denoted by "$"
help about_variables -ShowWindow
##Userdefined, Systemdefined, Environmental

$A 
$Temp
$serrver
$computername
$Temp_variable
$Temp_variable_testing

$a = 12
$a += 17

Get-Variable
#Any object within Powershell can be stored in Variable

$a = 2
$b = 5
$c = $a * $b 
$c = $a + $b 
$c = $a - $b 
$c = $a / $b 

$a = Get-Date
$b = "Todays Date is $a"

$a = "Monday"
$b = 'Tuesday'
$c = $a + $b 

## New line `n and tab space `t

$a = "Monday `t"
$b = 'Tuesday'
$c = $a + $b

$a = "Monday `n"
$b = 'Tuesday'
$c = $a + $b


# Casting a Variable 

[int]$a = 1
$a = "Monday"
$a = 19
$a += 15
$a += "test"

[String]$b = "Monday"
$b = 13
$b += 2

[Datetime]$D = Get-date
$d += 12
$d = "Saturday"
$d += "Monday"

##Listing all system variable
Get-Variable

$profile

$PSHOME

$HOME

$a = 12
$a= $null

$true

$false

$ErrorActionPreference

$WarningPreference

$VerbosePreference


New-Variable -Name Text -Value "Today is Tuesday"

Set-Variable -Name Text -Value "Today is Monday"


#What is the difference between single and double quote
$a = 1

"My Variable consists of $a"

'My Variable consists of $a'

"My Variable `$a consists of $a"

'My Variable $a consists of' + " $a"



# Environmental variables

$env:USERNAME

$env:USERDOMAIN

$env:PSModulePath

$env:CommonProgramFiles