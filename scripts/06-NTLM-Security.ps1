# WN11-SO-000220 - Require NTLMv2 and 128-bit server session security
# Run in an elevated PowerShell session on a test machine.
# Review change impact and preserve pre-change evidence.
$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"
New-Item -Path $Path -Force | Out-Null
New-ItemProperty -Path $Path -Name "NtlmMinServerSec" -Value 537395200 -PropertyType DWORD -Force | Out-Null
gpupdate /force
Get-ItemPropertyValue -Path $Path -Name "NtlmMinServerSec"
