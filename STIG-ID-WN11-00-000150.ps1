<#
.SYNOPSIS
    This PowerShell script enables SEHOP by setting the registry value to 0, which activates Windows' 
    built-in protection against buffer overflow exploits that hijack exception handling.

.NOTES
    Author          : Jarred Ward
    LinkedIn        : linkedin.com/in/jarredward1
    GitHub          : github.com/jarredward1
    Date Created    : 2026-06-25
    Last Modified   : 2026-06-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000150
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-00-000150/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-00-000150.ps1 
#>

# Enable Structured Exception Handling Overwrite Protection (SEHOP)
$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel"

Set-ItemProperty -Path $RegPath -Name "DisableExceptionChainValidation" -Value 0 -Type DWord -Force

# Verify
$val = (Get-ItemProperty -Path $RegPath -Name "DisableExceptionChainValidation").DisableExceptionChainValidation
if ($val -eq 0) {
    Write-Host "PASS - SEHOP is enabled (DisableExceptionChainValidation = $val)" -ForegroundColor Green
} else {
    Write-Host "FAIL - Value is $val, manual review needed" -ForegroundColor Red
}
