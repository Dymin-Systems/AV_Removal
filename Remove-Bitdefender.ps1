# This script is designed to download the Bitdefender Removal tool and run it silently
# Created by Justin Wilson

$product = "Bitdefender"
$filePath = "C:\temp"
$fileName = "C:\temp\BEST_uninstallTool.exe"
$url = "https://download.bitdefender.com/SMB/Hydra/release/bst_win/uninstallTool/BEST_uninstallTool.exe"

try {
    Start-BitsTransfer -source $url -Destination $filepath
}
catch {
    Write-Host "Unable to start file download, check permissions on $($filePath) or URL"
}

Start-Sleep -s 5
if (test-path -path $fileName){
    Write-host "Found $($product) Removal Tool - Expanding archive"
    try {
        Expand-Archive -LiteralPath $fileName -DestinationPath $filePath
        Write-Host "Expansion Complete - Attempting to uninstall $($product)..."
        Start-Sleep -s 5
        Set-Location "c:\temp"
        try {
            .\BEST_uninstallTool.exe /nowait
        }
        catch {
            Write-Host "Uninstallation failed"
            Write-Host "Exiting..."
        }
        
    }
    catch {
        Write-host "Failed to expand archive"
        Write-host "Exiting..."
        Exit
    }

}
else{
    Write-Host "$($product) Removal Tool not found - $($filepath)"
    Write-Host "Exiting..."
}