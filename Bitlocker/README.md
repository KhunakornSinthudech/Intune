# BitLockerEncrypter
 This script is for encrypt the Intune AutoPilot devices during application deployment stage.
 This will be done before any Device Configuration Profile apply to the device.
 The benefit is to prevent the unexpected action of BitLocker to apply incorrectly (eg.Windows10_1903).

1. add BitLockerEncrypter.intunewin into Client App (WIn32)
2. add BitLockerEncrypterDetectionRule.ps1 as detection script.
3. set install and uninstall command to "powershell -ex bypass -file bitlocker.ps1"
4. set installation type to system app.
5. assign devices group as required app.

# Bitlocker Pin Checker
This script is to add the ScheduledTask to the client devices to notify user to set pin using the tool from :
https://github.com/okieselbach/Intune/tree/master/Win32/SetBitLockerPin
Made by Oliver Kieselbach.

This one will check the BitLocker pin status and notify user to set the pin.
After user click OK it will redirect to Company Portal to the set pin app.

1. Create the client app package from https://github.com/okieselbach/Intune/tree/master/Win32/SetBitLockerPin
2. Add you app GUID from 1. to pinchecker.ps1 "start companyportal:ApplicationId={YourAppGUID}"
3. Build IntuneWinPackage using https://github.com/Microsoft/Microsoft-Win32-Content-Prep-Tool with the command

  .\IntuneWinAppUtil -c .\BitlockerPinChecker -s add.ps1 -o .\ -q

4. add add.intunewin into Client App (WIn32)
5. add BitlockerPinCheckerDetection.ps1 as detection script.
6. set install and uninstall command to "powershell -ex bypass -file add.ps1"
7. set installation type to User app.
8. assign devices group as required app.
