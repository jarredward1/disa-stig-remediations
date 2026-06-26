# DISA STIG Remediations for Windows 11

> **Automate compliance. Eliminate drift. Harden with confidence.**

![Platform](https://img.shields.io/badge/Platform-Windows%2011-0078D4?logo=windows)
![Language](https://img.shields.io/badge/Language-PowerShell-5391FE?logo=powershell)
![STIG](https://img.shields.io/badge/Framework-DISA%20STIG-red)
![Scripts](https://img.shields.io/badge/Scripts-10-brightgreen)

A growing collection of standalone PowerShell scripts that automatically detect and remediate DISA STIG (Security Technical Implementation Guide) findings on **Windows 11** endpoints. Each script is self-contained, self-verifying, and built for real-world ops.

> ⚠️ Always test in a non-production environment first. Some scripts require a reboot or may affect legacy device compatibility.

---

## 🔍 What Is This?

The **Defense Information Systems Agency (DISA)** publishes Security Technical Implementation Guides: dense, authoritative documents that tell administrators exactly how to lock down a system for DoD-grade security. Applying those controls by hand is tedious, error-prone, and slow.

This repository provides **individual PowerShell scripts**, each mapped 1:1 to a specific STIG ID, that:

1. Apply the required registry change automatically
2. Immediately verify the value was written correctly
3. Report a clear `PASS ✅` or `FAIL ❌` with color-coded output

No frameworks required. No dependencies. Just PowerShell and intent.

---

## ⚔️ Why It Matters

In a DoD or compliance-sensitive environment, unmitigated STIG findings aren't just checkbox failures. They're open attack surface. A single misconfigured registry key can be the gap between a hardened system and a privilege escalation path. These scripts close those gaps methodically, repeatably, and with immediate verification built right in.

Whether you're running a one-time audit remediation, deploying via RMM, integrating into a configuration management pipeline, or prepping for a CCRI/ATO, these scripts give you a clean, auditable paper trail with predictable behavior.

---

## 📂 Scripts at a Glance

| STIG ID | Category | What It Fixes |
|---|---|---|
| [`WN11-00-000126`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-00-000126.ps1) | Access Control | Blocks consumer Microsoft account authentication on enterprise systems |
| [`WN11-00-000150`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-00-000150.ps1) | Exploit Protection | Enables SEHOP (Structured Exception Handling Overwrite Protection) |
| [`WN11-00-000165`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-00-000165.ps1) | Network Security | Disables legacy SMBv1 protocol to eliminate known vulnerabilities |
| [`WN11-CC-000150`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-CC-000150.ps1) | Component Configuration | Requires password on resume from sleep (AC/plugged-in) |
| [`WN11-CC-000385`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-CC-000385.ps1) | Access Control | Blocks Windows Ink Workspace access above the lock screen |
| [`WN11-SO-000100`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-SO-000100.ps1) | Network Security | Enforces SMB packet signing to prevent man-in-the-middle attacks |
| [`WN11-SO-000230`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-SO-000230.ps1) | Cryptography | Enforces FIPS-compliant algorithms for encryption, hashing, and signing |
| [`WN11-SO-000265`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-SO-000265.ps1) | Security Options | Restricts UAC elevation to apps installed in secure locations only |
| [`WN11-UC-000015`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-UC-000015.ps1) | Component Configuration | Disables toast notifications on the lock screen |
| [`WN11-UC-000020`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-UC-000020.ps1) | Component Configuration | Preserves zone origin info on file attachments for risk assessment |
