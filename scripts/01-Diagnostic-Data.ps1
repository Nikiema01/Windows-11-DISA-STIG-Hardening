# WN11-CC-000204 - Limit optional diagnostic data
# Run in an elevated PowerShell session on a test machine.
# Review change impact and preserve pre-change evidence.
$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
New-Item -Path $Path -Force | Out-Null
New-ItemProperty -Path $Path -Name "LimitEnhancedDiagnosticDataWindowsAnalytics" -Value 1 -PropertyType DWORD -Force | Out-Null
gpupdate /force
Get-ItemPropertyValue -Path $Path -Name "LimitEnhancedDiagnosticDataWindowsAnalytics"
