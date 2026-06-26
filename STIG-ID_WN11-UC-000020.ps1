<#
.SYNOPSIS
    This PowerShell script ensures Windows preserves zone-of-origin information (internet, intranet, local, restricted) on file attachments 
    so the system can properly assess and warn users about the risk level of files they open.
    
.NOTES
    Author          : Jarred Ward
    LinkedIn        : linkedin.com/in/jarredward1
    GitHub          : github.com/jarredward1
    Date Created    : 2026-06-26
    Last Modified   : 2026-06-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-UC-000020
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-UC-000020/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-UC-000020.ps1 
#>

# Zone information must be preserved when saving attachments
$RegPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments"

if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set to 2 (Save zone information) or remove the key entirely - both are compliant
Set-ItemProperty -Path $RegPath -Name "SaveZoneInformation" -Value 2 -Type DWord -Force

# Verify
$val = (Get-ItemProperty -Path $RegPath -Name "SaveZoneInformation").SaveZoneInformation
if ($val -eq 2) {
    Write-Host "PASS - SaveZoneInformation = $val (Zone info preserved)" -ForegroundColor Green
} else {
    Write-Host "FAIL - Value is $val, manual review needed" -ForegroundColor Red
}
