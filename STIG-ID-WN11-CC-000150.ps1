<#
.SYNOPSIS
    This PowerShell script forces Windows to require a password whenever the computer wakes from 
    sleep while plugged in, by setting the corresponding registry value to enabled.
    
.NOTES
    Author          : Jarred Ward
    LinkedIn        : linkedin.com/in/jarredward1
    GitHub          : github.com/jarredward1
    Date Created    : 2026-06-25
    Last Modified   : 2026-06-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000150
    Documentation   : https://stigaview.com/products/win11/v1r5/WN11-CC-000150/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000150.ps1 
#>

# Require password on resume from sleep (plugged in)
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"

if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

Set-ItemProperty -Path $RegPath -Name "ACSettingIndex" -Value 1 -Type DWord -Force

# Verify
$val = (Get-ItemProperty -Path $RegPath -Name "ACSettingIndex").ACSettingIndex
if ($val -eq 1) {
    Write-Host "PASS - ACSettingIndex set to $val" -ForegroundColor Green
} else {
    Write-Host "FAIL - Value is $val, manual review needed" -ForegroundColor Red
}
