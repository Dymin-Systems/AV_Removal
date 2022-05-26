# This script is designed to download the Bitdefender Removal tool and run it silently
# Created by Justin Wilson

$product = "Bitdefender"
$filePath = "C:\temp"
$fileName = "C:\temp\BEST_uninstallTool.exe"
$url = "https://download.bitdefender.com/SMB/Hydra/release/bst_win/uninstallTool/BEST_uninstallTool.exe"

Start-BitsTransfer -source $url -Destination $filepath
Start-Sleep -s 5
if (test-path -path $fileName){
    Write-host "Found $($product) Removal Tool - Expanding archive"
    Expand-Archive -LiteralPath $fileName -DestinationPath $filePath
    Write-Host "Expansion Complete - Attempting to uninstall $($product)..."
    Start-Sleep -s 5
    Set-Location "c:\temp"
    .\BEST_uninstallTool.exe
        
}
else{
    Write-Host "$($product) Removal Tool not found - $($filepath)"
    Write-Host "Exiting..."
}