$BLinfo = Get-Bitlockervolume

if($blinfo.ProtectionStatus -eq 'On' -and $blinfo.EncryptionPercentage -eq '100')
{
exit 0
} else { 
exit 999}