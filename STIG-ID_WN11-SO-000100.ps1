<#
.SYNOPSIS
    Forces the Windows SMB client to always digitally sign communications, preventing 
    man-in-the-middle attacks by ensuring it only talks to servers that also perform packet signing.
    
.NOTES
    Author          : Jarred Ward
    LinkedIn        : linkedin.com/in/jarredward1
    GitHub          : github.com/jarredward1
    Date Created    : 2026-06-25
    Last Modified   : 2026-06-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000100
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-SO-000100/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-SO-000100.ps1 
#>

# SMB client must always perform SMB packet signing
$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"

Set-ItemProperty -Path $RegPath -Name "RequireSecuritySignature" -Value 1 -Type DWord -Force

# Verify
$val = (Get-ItemProperty -Path $RegPath -Name "RequireSecuritySignature").RequireSecuritySignature
if ($val -eq 1) {
    Write-Host "PASS - RequireSecuritySignature = $val (Enabled)" -ForegroundColor Green
} else {
    Write-Host "FAIL - Value is $val, manual review needed" -ForegroundColor Red
}
