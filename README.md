# Windows 11 DISA STIG Hardening Lab

A hands-on Windows 11 security-hardening lab using PowerShell, registry-backed policy settings, and `auditpol` to address ten findings from a DISA Windows 11 STIG compliance assessment (v2r9, as shown in the supplied screenshots).

## Project scope

- **Environment:** Windows 11 virtual machine
- **Tools:** Administrator PowerShell, Windows Group Policy refresh, `auditpol`, and a compliance scanner
- **Workflow:** Identify failed controls, apply targeted settings, verify the local result, capture evidence, and rescan
- **Evidence status:** The included screenshots demonstrate local command output. A post-remediation Tenable scan proving all ten checks passed has **not yet been supplied**.

## Ten controls

| # | STIG ID | Purpose | Script | PowerShell evidence |
|---|---|---|---|---|
| 1 | WN11-CC-000204 | Limit optional diagnostic data | [Script](scripts/01-Diagnostic-Data.ps1) | [Screenshot](screenshots/01-Diagnostic-Data.png) |
| 2 | WN11-CC-000345 | Disable WinRM Basic authentication | [Script](scripts/02-WinRM-Authentication.ps1) | [Screenshot](screenshots/02-WinRM-Authentication.png) |
| 3 | WN11-CC-000280 | Require RDP password prompts | [Script](scripts/03-RDP-Password-Policy.ps1) | [Screenshot](screenshots/03-RDP-Password-Policy.png) |
| 4 | WN11-CC-000290 | Require high RDP encryption | [Script](scripts/04-RDP-Encryption.ps1) | [Screenshot](screenshots/04-RDP-Encryption.png) |
| 5 | WN11-CC-000052 | Prefer NistP384 then NistP256 | [Script](scripts/05-ECC-Curve-Order.ps1) | [Screenshot](screenshots/05-ECC-Curve-Order.png) |
| 6 | WN11-SO-000220 | Require NTLMv2 and 128-bit server session security | [Script](scripts/06-NTLM-Security.ps1) | [Screenshot](screenshots/06-NTLM-Security.png) |
| 7 | WN11-CC-000060 | Block simultaneous non-domain network connections | [Script](scripts/07-Network-Connections.ps1) | [Screenshot](screenshots/07-Network-Connections.png) |
| 8 | WN11-AU-000575 | Audit MPSSVC rule-level policy change successes | [Script](scripts/08-MPSSVC-Auditing.ps1) | [Screenshot](screenshots/08-MPSSVC-Auditing.png) |
| 9 | WN11-CC-000155 | Disable solicited Remote Assistance | [Script](scripts/09-Remote-Assistance.ps1) | [Screenshot](screenshots/09-Remote-Assistance.png) |
| 10 | WN11-AU-000150 | Audit Security System Extension successes | [Script](scripts/10-Security-System-Auditing.ps1) | [Screenshot](screenshots/10-Security-System-Auditing.png) |

## How to reproduce safely

1. Use an authorized Windows 11 test VM, create a snapshot, and record the baseline compliance findings.
2. Review each script before execution. Run only the specific control you intend to change in **PowerShell as Administrator**.
3. Check the displayed registry or audit-policy value against the STIG requirement. A successful command alone does not prove scanner compliance.
4. Reboot if the control requires it, then rerun the compliance assessment and preserve before/after scan evidence.
5. Be aware that domain Group Policy or device management can override local settings. RDP, network, and authentication changes may affect connectivity.

## Lessons learned

This exercise practices configuration hardening, audit-policy management, remediation evidence collection, and compliance verification. The final scanner outcome remains to be documented.

## Reference

[DISA Windows 11 STIG package](https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_MS_Windows_11_V2R9_STIG.zip)

> Educational lab only. Do not apply these policies blindly to production endpoints.
