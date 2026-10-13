# WN11-CC-000280 - Require RDP password prompts
# Run in an elevated PowerShell session on a test machine.
# Review change impact and preserve pre-change evidence.
$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
New-Item -Path $Path -Force | Out-Null
New-ItemProperty -Path $Path -Name "fPromptForPassword" -Value 1 -PropertyType DWORD -Force | Out-Null
gpupdate /force
Get-ItemPropertyValue -Path $Path -Name "fPromptForPassword"
