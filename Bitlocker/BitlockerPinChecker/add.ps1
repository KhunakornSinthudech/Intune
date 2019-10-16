Copy "$PSScriptRoot\pinchecker.ps1" -Destination "C:\ProgramData"

$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-NoProfile -executionpolicy bypass -WindowStyle Hidden -file "C:\ProgramData\pinchecker.ps1"'

$trigger =  New-ScheduledTaskTrigger -AtLogOn

unRegister-ScheduledTask -TaskName "AppLog" -Confirm:$false
Register-ScheduledTask  -Action $action -Trigger $trigger -TaskName "AppLog" -Description "Daily dump of Applog" -RunLevel Highest