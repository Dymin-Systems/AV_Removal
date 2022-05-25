# This script is designed to uninstall Webroot from computers which have failed to uninstall with the standard script
#Set-location "C:\Program Files (x86)\Webroot"
#.\WRSA.exe -uninstall
$Status = Get-Process notepad -ErrorAction SilentlyContinue
if($Status -eq $null)
{
 Write-host "Webroot uninstall has been completed"
 Exit
}
else
{
 Write-host "Webroot uninstallation in progress..."
 Start-Sleep -S 30
}