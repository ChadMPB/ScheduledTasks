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
