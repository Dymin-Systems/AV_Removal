## Check for the Webroot install directory and if found attempts to uninstall
Write-Host "Checking for Webroot..."
if (Test-Path -path "C:\Program Files (x86)\Webroot\"){
    Write-Host "Found Webroot (x86) - Attempting uninstall"
    Set-Location "C:\Program Files (x86)\Webroot\"
    .\wrsa.exe -uninstall
    Start-Sleep -s 30
    try{
        Set-Location "C:\windows\system32"
        Get-process -name "WRSA"
        Stop-process -name "WRSA"
        Remove-Item "c:\program files (x86)\Webroot\" -Recurse -Force
    }
    Catch{
        Try{
            Remove-Item "c:\program files (x86)\Webroot\" -Recurse -Force
        }
        catch{
            Exit
        }
    }
    try {
        Get-WmiObject -Namespace root\SecurityCenter2 -Class AntiVirusProduct | Where-object displayName -Match "Webroot SecureAnywhere" | ForEach-Object{$_.Delete()}
    }
    catch{}
}
elseif(Test-Path -path "C:\Program Files\Webroot\"){
    Write-Host "Found Webroot (x64) - Attempting uninstall"
    Set-Location "C:\Program Files\Webroot\"
    .\wrsa.exe -uninstall
    Start-Sleep -s 30
    try{
        Set-Location "C:\windows\system32"
        Get-process -name "WRSA"
        Stop-process -name "WRSA"
        Remove-Item "c:\program files\Webroot\" -Recurse -Force
    }
    Catch{
        Try{
            Remove-Item "c:\program files\Webroot\" -Recurse -Force
        }
        catch{
            Exit
        }
    }
    try {
        Get-WmiObject -Namespace root\SecurityCenter2 -Class AntiVirusProduct | Where-object displayName -Match "Webroot SecureAnywhere" | ForEach-Object{$_.Delete()}
    }
    catch{}
}
else{
    Write-Host "Webroot not found - Exiting"
}
