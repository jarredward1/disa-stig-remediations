<#
.SYNOPSIS
    This PowerShell script allows Windows Ink Workspace to function normally but blocks it from 
    being accessible above the lock screen, preventing unauthorized pen/touch input before a user logs in.
    
.NOTES
    Author          : Jarred Ward
    LinkedIn        : linkedin.com/in/jarredward1
    GitHub          : github.com/jarredward1
    Date Created    : 2026-06-25
    Last Modified   : 2026-06-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000385
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000385/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000385.ps1 
#>

# Windows Ink Workspace must disallow access above the lock screen
$RegPath = "HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace"

if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

Set-ItemProperty -Path $RegPath -Name "AllowWindowsInkWorkspace" -Value 1 -Type DWord -Force

# Verify
$val = (Get-ItemProperty -Path $RegPath -Name "AllowWindowsInkWorkspace").AllowWindowsInkWorkspace
if ($val -eq 1) {
    Write-Host "PASS - AllowWindowsInkWorkspace = $val (On, but disallowed above lock)" -ForegroundColor Green
} else {
    Write-Host "FAIL - Value is $val, manual review needed" -ForegroundColor Red
}
