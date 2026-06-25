<#
.SYNOPSIS
    This PowerShell script enables FIPS-compliant cryptographic algorithms system-wide, ensuring all encryption, 
    hashing, and signing operations meet U.S. government security standards. Note: systems with this enabled cannot 
    communicate with servers that do not support FIPS algorithms.

.NOTES
    Author          : Jarred Ward
    LinkedIn        : linkedin.com/in/jarredward1
    GitHub          : github.com/jarredward1
    Date Created    : 2026-06-25
    Last Modified   : 2026-06-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000230
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-SO-000230/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-SO-000230.ps1 
#>

# Enable FIPS-compliant algorithms for encryption, hashing, and signing
$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy"

Set-ItemProperty -Path $RegPath -Name "Enabled" -Value 1 -Type DWord -Force

# Verify
$val = (Get-ItemProperty -Path $RegPath -Name "Enabled").Enabled
if ($val -eq 1) {
    Write-Host "PASS - FIPS Algorithm Policy Enabled = $val" -ForegroundColor Green
} else {
    Write-Host "FAIL - Value is $val, manual review needed" -ForegroundColor Red
}
