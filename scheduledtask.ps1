function New-MPBScheduledTask {
    [cmdletbinding()]
    
    param (
        $scriptpath,
        $Date,
        $taskname
    )

$A = New-ScheduledTaskAction -Execute powershell.exe -Argument $scriptpath
$T = New-ScheduledTaskTrigger -once -at (get-date) -RepetitionInterval (New-TimeSpan -Minutes 15) -RepetitionDuration ([timespan]::MaxValue)
$S = New-ScheduledTask -Action $A -Trigger $T
Register-ScheduledTask -TaskName $taskname -InputObject $S

    
}


New-MPBScheduledTask -scriptpath "\\mpbnas01\Info_Tech\Powershell\AD_Local\AD_User_Export.ps1" -Date (Get-date) -taskname "Export-Users"