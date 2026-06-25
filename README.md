# DISA STIG Remediations for Windows 11

> **Automate compliance. Eliminate drift. Harden with confidence.**

A growing collection of standalone PowerShell scripts that automatically detect and remediate DISA STIG (Security Technical Implementation Guide) findings on **Windows 11** endpoints. Each script is self-contained, self-verifying, and built for real-world ops.

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
| [`WN11-00-000150`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-00-000150.ps1) | General | Enables SEHOP (Structured Exception Handling Overwrite Protection) |
| [`WN11-CC-000150`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-CC-000150.ps1) | Component Config | Requires password on resume from sleep (AC/plugged-in) |
| [`WN11-SO-000265`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-SO-000265.ps1) | Security Options | Restricts UAC elevation to apps installed in secure locations only |
| [`WN11-CC-000385`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-CC-000385.ps1) | Access Control | Blocks Windows Ink Workspace access above the lock screen |
| [`WN11-SO-000100`](https://github.com/jarredward1/disa-stig-remediations/blob/main/STIG-ID_WN11-SO-000100.ps1) | Network Security | Enforces SMB packet signing to prevent man-in-the-middle attacks |
