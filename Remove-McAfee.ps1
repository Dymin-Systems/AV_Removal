# This script is designed to download the McAfee Removal tool from github, extract it and run it silently
# Created by Justin Wilson

$filePath = "C:\temp"
$fileName = "C:\temp\McAfee_removal.zip"
$url = "https://github.com/DyminSystems/AV_Removal/raw/main/McAfee_Removal.zip"

    Start-BitsTransfer -source $url -Destination $filepath
    Start-Sleep -s 5
    if (test-path -path $fileName){
        Write-host "Found McAfee Removal Tool - Expanding archive"
        Expand-Archive -LiteralPath $fileName -DestinationPath $filePath
        Write-Host "Expansion Complete - Attempting to uninstall McAfee..."
        Start-Sleep -s 5
        Set-Location "c:\temp\McAfee_Removal"
        .\Mccleanup.exe -p StopServices,MFSY,PEF,MXD,CSP,Sustainability,MOCP,MFP,APPSTATS,Auth,EMproxy,FWdiver,HW,MAS,MAT,MBK,MCPR,McProxy,McSvcHost,VUL,MHN,MNA,MOBK,MPFP,MPFPCU,MPS,SHRED,MPSCU,MQC,MQCCU,MSAD,MSHR,MSK,MSKCU,MWL,NMC,RedirSvc,VS,REMEDIATION,MSC,YAP,TRUEKEY,LAM,PCB,Symlink,SafeConnect,MGS,WMIRemover,RESIDUE -v -s
        }
    else{
        Write-Host "McAfee Removal Tool not found - $($filepath)"
        Write-Host "Exiting..."
    }



