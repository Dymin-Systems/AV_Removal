$filePath = "C:\temp\McAfee_removal\$1\Mccleanup.exe"
$fileName = "C:\temp\MCPR.exe"
$url = "http://us.mcafee.com/apps/supporttools/mcpr/mcpr.asp"
Start-Process -FilePath "C:\Program Files\7-Zip\7z.exe" -ArgumentList "x MCPR.exe", "-oc:\temp\McAfee_removal"
Start-sleep -s 15
Start-BitsTransfer -source $url -Destination $filepath
Start-Sleep -s 15

if (test-path -path $fileName){
    Write-host "Found McAfee Removal Tool - Expanding archive"
    Expand-Archive -LiteralPath $fileName -DestinationPath c:\temp
    Write-Host "Expansion Complete - Attempting to uninstall McAfee..."
    Start-Sleep -s 15
    Set-Location "c:\temp\McAfee_Removal"
    .\Mccleanup.exe -p StopServices,MFSY,PEF,MXD,CSP,Sustainability,MOCP,MFP,APPSTATS,Auth,EMproxy,FWdiver,HW,MAS,MAT,MBK,MCPR,McProxy,McSvcHost,VUL,MHN,MNA,MOBK,MPFP,MPFPCU,MPS,SHRED,MPSCU,MQC,MQCCU,MSAD,MSHR,MSK,MSKCU,MWL,NMC,RedirSvc,VS,REMEDIATION,MSC,YAP,TRUEKEY,LAM,PCB,Symlink,SafeConnect,MGS,WMIRemover,RESIDUE -v -s
}
else{
    Write-Host "McAfee Removal Tool not found - $($filepath)"
}
