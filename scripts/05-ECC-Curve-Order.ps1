# WN11-CC-000052 - Prefer NistP384 then NistP256
# Run in an elevated PowerShell session on a test machine.
# Review change impact and preserve pre-change evidence.
$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002"
New-Item -Path $Path -Force | Out-Null
New-ItemProperty -Path $Path -Name "EccCurves" -Value @("NistP384", "NistP256") -PropertyType MultiString -Force | Out-Null
gpupdate /force
Get-ItemPropertyValue -Path $Path -Name "EccCurves"
