# WN11-CC-000345 - Disable WinRM Basic authentication
# Run in an elevated PowerShell session on a test machine.
# Review change impact and preserve pre-change evidence.
$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"
New-Item -Path $Path -Force | Out-Null
New-ItemProperty -Path $Path -Name "AllowBasic" -Value 0 -PropertyType DWORD -Force | Out-Null
gpupdate /force
Get-ItemPropertyValue -Path $Path -Name "AllowBasic"
