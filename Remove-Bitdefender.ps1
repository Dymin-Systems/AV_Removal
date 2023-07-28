# This script is designed to download the Bitdefender Removal tool and run it silently
# Created by Justin Wilson

$product = "Bitdefender"
$filePath = "C:\temp\BitDefender"
$fileName = "C:\temp\BitDefender\BEST_uninstallTool.exe"
$url = "https://download.bitdefender.com/SMB/Hydra/release/bst_win/uninstallTool/BEST_uninstallTool.exe"

try {
    #check if the directory exists
    if (!(test-path -path $filePath)){
        #Write-Host "Creating $($filePath)"
        New-Item -ItemType Directory -Path $filePath
    }

    Start-BitsTransfer -source $url -Destination $filepath
}
catch {
    #Write-Host "Unable to start file download, check permissions on $($filePath) or URL"
}

Start-Sleep -s 5
if (test-path -path $fileName){
    #Write-host "Found $($product) Removal Tool - Expanding archive"
    try {
        Expand-Archive -LiteralPath $fileName -DestinationPath $filePath
        #Write-Host "Expansion Complete - Attempting to uninstall $($product)..."
        Start-Sleep -s 2
        
        #Run the uninstaller
        try {
            Start-Process -FilePath $filename
            #Write-Host "Uninstallation Complete"
            #Write-Host "Exiting..."
        }
        catch {
            #Write-Host "Uninstallation failed"
            #Write-Host "Exiting..."
        }
        #cleanup the files
        try {
            Remove-Item -Path $filePath -Force -Recurse
        }
        catch{

        }
        
    }
    catch {
        #Write-host "Failed to expand archive"
        #Write-host "Exiting..."
        Exit
    }

}
else{
    #Write-Host "$($product) Removal Tool not found - $($filepath)"
    #Write-Host "Exiting..."
}
