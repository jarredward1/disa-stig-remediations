<#
.SYNOPSIS
    This PowerShell script disables toast notifications from appearing on the lock screen, preventing 
    sensitive application information from being visible to unauthorized users before they authenticate.
    
.NOTES
    Author          : Jarred Ward
    LinkedIn        : linkedin.com/in/jarredward1
    GitHub          : github.com/jarredward1
    Date Created    : 2026-06-26
    Last Modified   : 2026-06-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-UC-000015
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-UC-000015/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-UC-000015.ps1 
#>

# Toast notifications on the lock screen must be turned off
$RegPath = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"

if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

Set-ItemProperty -Path $RegPath -Name "NoToastApplicationNotificationOnLockScreen" -Value 1 -Type DWord -Force

# Verify
$val = (Get-ItemProperty -Path $RegPath -Name "NoToastApplicationNotificationOnLockScreen").NoToastApplicationNotificationOnLockScreen
if ($val -eq 1) {
    Write-Host "PASS - NoToastApplicationNotificationOnLockScreen = $val (Disabled)" -ForegroundColor Green
} else {
    Write-Host "FAIL - Value is $val, manual review needed" -ForegroundColor Red
}
