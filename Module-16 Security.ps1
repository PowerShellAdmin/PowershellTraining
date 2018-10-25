
help about_Execution_Policies -ShowWindow

#Restricted ==> No Scripts(.ps1,.psm1, .psd1) can be executed but commands can be executed.
#Unrestricted==> Any script can be excuted (Not Recommended for Production Environment)
#AllSigned==> Only signed script can be executed Class III Code signing certificate
#Remotesigned == Locally written scripts can be executed, Scripts downloaded from Internet needs to be signed from Trusted Publisher..if Unblocked manually the it can be executed 
#(Not Recommended for Production Environment)

#View Current Execution Policy
Get-ExecutionPolicy

#Change the existing execution policy to (Unrestricted, Restricted, AllSigned. RemoteSigned)
Set-ExecutionPolicy Restricted

Get-ChildItem Cert:\CurrentUser\my -CodeSigningCert

$cert =Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert

help Set-AuthenticodeSignature

Set-AuthenticodeSignature -FilePath 'C:\Users\supercoach\Desktop\1.ps1' -Certificate $cert

Get-AuthenticodeSignature -FilePath 'C:\Users\supercoach\Desktop\1.ps1' |select -expand SignerCertificate
