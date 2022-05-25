# This script is designed to uninstall Webroot from computers which have failed to uninstall with the standard script
#Set-location "C:\Program Files (x86)\Webroot"
#.\WRSA.exe -uninstall
$Status = Get-Process notepad -ErrorAction SilentlyContinue
while ($Status -ne $null)
{
    Write-host "Webroot uninstallation in progress..."
    Start-Sleep -S 30
    $Status = Get-Process notepad -ErrorAction SilentlyContinue
}
else
{
    write-host "Webroot uninstallation complete."
    Exit
}