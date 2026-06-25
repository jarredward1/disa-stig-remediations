<#
.SYNOPSIS
    This PowerShell script disables the legacy SMBv1 protocol on the SMB server via registry and Windows features, 
    eliminating exposure to MD5-based collision attacks, preimage attacks, and known exploits like EternalBlue.

.NOTES
    Author          : Jarred Ward
    LinkedIn        : linkedin.com/in/jarredward1
    GitHub          : github.com/jarredward1
    Date Created    : 2026-06-25
    Last Modified   : 2026-06-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000165
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-00-000165/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-00-000165.ps1 
#>

# Disable SMBv1 on the SMB server
$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"

Set-ItemProperty -Path $RegPath -Name "SMB1" -Value 0 -Type DWord -Force

# Also disable via Windows Feature for full coverage
Disable-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol" -NoRestart | Out-Null

# Verify
$val = (Get-ItemProperty -Path $RegPath -Name "SMB1").SMB1
if ($val -eq 0) {
    Write-Host "PASS - SMB1 = $val (Disabled)" -ForegroundColor Green
    Write-Host "NOTE - A system restart is required for changes to take effect." -ForegroundColor Yellow
} else {
    Write-Host "FAIL - Value is $val, manual review needed" -ForegroundColor Red
}
