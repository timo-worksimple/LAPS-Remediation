Start-Transcript -Path "$env:ProgramData\Microsoft\IntuneManagementExtension\Logs\LAPSLocalAdmin_Detect.log" -Append
$LAPSAdmin = "ENTER_NAME_OF_ADMINUSER"
$Query = Get-WmiObject -Class Win32_UserAccount -Filter "LocalAccount=True"
If ($Query.Name -notcontains $LAPSAdmin) {
    Write-Output "User: $LAPSAdmin does not existing on the device"
        
    Exit 1
}
Else {
    Write-Output "User $LAPSAdmin exists on the device"
    Exit 0
}
Stop-Transcript