if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
$A = New-ScheduledTaskAction -Execute $($($PSScriptRoot)+"\script.vbs")
$T = New-ScheduledTaskTrigger -AtLogon
$P = New-ScheduledTaskPrincipal $([System.Security.Principal.WindowsIdentity]::GetCurrent().name)
$S = New-ScheduledTaskSettingsSet
$D = New-ScheduledTask -Action $A -Principal $P -Trigger $T -Settings $S
Register-ScheduledTask -TaskName "AutoTurnOnHotSpot_4gsd35i1e87s06" -InputObject $D
