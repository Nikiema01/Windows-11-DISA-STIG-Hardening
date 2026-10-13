# WN11-CC-000155 - Disable solicited Remote Assistance
# Run in an elevated PowerShell session on a test machine.
# Review change impact and preserve pre-change evidence.
$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
New-Item -Path $Path -Force | Out-Null
New-ItemProperty -Path $Path -Name "fAllowToGetHelp" -Value 0 -PropertyType DWORD -Force | Out-Null
gpupdate /force
Get-ItemPropertyValue -Path $Path -Name "fAllowToGetHelp"
