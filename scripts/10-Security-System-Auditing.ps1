# WN11-AU-000150 - Audit Security System Extension successes
# Run in an elevated PowerShell session on a test machine.
# Review change impact and preserve pre-change evidence.
auditpol /set /subcategory:"Security System Extension" /success:enable
auditpol /get /subcategory:"Security System Extension"
