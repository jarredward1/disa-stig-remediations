<#
.SYNOPSIS
    This PowerShell script restricts UAC so that only applications installed in trusted secure 
    locations (like Program Files or System32) can run with elevated UI privileges, blocking privilege escalation from untrusted paths.
    
.NOTES
    Author          : Jarred Ward
    LinkedIn        : linkedin.com/in/jarredward1
    GitHub          : github.com/jarredward1
    Date Created    : 2026-06-25
    Last Modified   : 2026-06-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000265
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-SO-000265/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-SO-000265.ps1 
#>

# UAC must only elevate UIAccess apps installed in secure locations
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

Set-ItemProperty -Path $RegPath -Name "EnableSecureUIAPaths" -Value 1 -Type DWord -Force

# Verify
$val = (Get-ItemProperty -Path $RegPath -Name "EnableSecureUIAPaths").EnableSecureUIAPaths
if ($val -eq 1) {
    Write-Host "PASS - EnableSecureUIAPaths = $val (Enabled)" -ForegroundColor Green
} else {
    Write-Host "FAIL - Value is $val, manual review needed" -ForegroundColor Red
}
