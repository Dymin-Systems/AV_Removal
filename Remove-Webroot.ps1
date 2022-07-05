## Check for the Webroot install directory and if found attempts to uninstall
Write-Host "Checking for Webroot..."
if (Test-Path -path "C:\Program Files (x86)\Webroot\"){
    Write-Host "Found Webroot - Attempting uninstall"
    Start-Process -FilePath "C:\Program Files (x86)\Webroot\wrsa.exe"  -ArgumentList "-uninstall"
    Start-Sleep -s 30
    try{
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
}
elseif(Test-Path -path "C:\Program Files\Webroot\"){
    Write-Host "Found Webroot - Attempting uninstall"
    Start-Process -FilePath "C:\Program Files\Webroot\wrsa.exe"  -ArgumentList "-uninstall"
    Start-Sleep -s 30
    try{
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
}
else{
    Write-Host "Webroot not found - Exiting"
}
