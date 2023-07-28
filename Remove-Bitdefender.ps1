# This script is designed to download the Bitdefender Removal tool and run it silently
# Created by Justin Wilson

$product = "Bitdefender"
$filePath = "C:\temp\BitDefender"
$fileName = "C:\temp\BitDefender\BEST_uninstallTool.exe"
$url = "https://download.bitdefender.com/SMB/Hydra/release/bst_win/uninstallTool/BEST_uninstallTool.exe"

try {
    #check if the directory exists
    if (!(test-path -path $filePath)){
        New-Item -ItemType Directory -Path $filePath
    }

    Start-BitsTransfer -source $url -Destination $filepath
}
catch {}

Start-Sleep -s 5
if (test-path -path $fileName){
    try {
        Expand-Archive -LiteralPath $fileName -DestinationPath $filePath
        Start-Sleep -s 2
        
        #Run the uninstaller
        try {
            Start-Process -FilePath $filename
        }
        catch {}
        #cleanup the files
        try {
            Remove-Item -Path $filePath -Force -Recurse
        }
        catch{}
        
    }
    catch {
        Exit
    }

}
else{}
