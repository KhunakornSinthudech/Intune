[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$BLinfo = get-bitlockervolume | Where-Object {$_.MountPoint -eq 'c:'}


if ($blinfo.KeyProtector.KeyProtectorType -contains 'TpmPin' ){
    
}
else{
[System.Windows.Forms.Messagebox]::Show("You need to encrypt your device and set bitlocker pin. `n`nPlease click OK and install SetBitlockerPin from Company Portal.")


    start companyportal:ApplicationId=d4fc3362-e677-458b-bb73-912b4e514531
}



