# WN11-CC-000060 - Block simultaneous non-domain network connections
# Run in an elevated PowerShell session on a test machine.
# Review change impact and preserve pre-change evidence.
$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy"
New-Item -Path $Path -Force | Out-Null
New-ItemProperty -Path $Path -Name "fBlockNonDomain" -Value 1 -PropertyType DWORD -Force | Out-Null
gpupdate /force
Get-ItemPropertyValue -Path $Path -Name "fBlockNonDomain"
