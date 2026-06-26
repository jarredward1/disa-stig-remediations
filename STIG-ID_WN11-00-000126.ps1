<#
.SYNOPSIS
    This PowerShell script blocks users from authenticating to applications on the system using personal consumer 
    Microsoft accounts, ensuring only authorized organizational accounts are used on enterprise machines.
    
.NOTES
    Author          : Jarred Ward
    LinkedIn        : linkedin.com/in/jarredward1
    GitHub          : github.com/jarredward1
    Date Created    : 2026-06-25
    Last Modified   : 2026-06-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000126
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-00-000126/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-00-000126.ps1 
#>

# Block consumer Microsoft account user authentication
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount"

if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

Set-ItemProperty -Path $RegPath -Name "DisableUserAuth" -Value 1 -Type DWord -Force

# Verify
$val = (Get-ItemProperty -Path $RegPath -Name "DisableUserAuth").DisableUserAuth
if ($val -eq 1) {
    Write-Host "PASS - DisableUserAuth = $val (Consumer accounts blocked)" -ForegroundColor Green
} else {
    Write-Host "FAIL - Value is $val, manual review needed" -ForegroundColor Red
}
