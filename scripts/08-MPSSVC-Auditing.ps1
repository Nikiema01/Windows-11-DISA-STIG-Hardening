# WN11-AU-000575 - Audit MPSSVC rule-level policy change successes
# Run in an elevated PowerShell session on a test machine.
# Review change impact and preserve pre-change evidence.
auditpol /set /subcategory:"MPSSVC Rule-Level Policy Change" /success:enable
auditpol /get /subcategory:"MPSSVC Rule-Level Policy Change"
