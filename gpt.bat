# Check the current version of Windows
$osVersion = Get-WmiObject Win32_OperatingSystem | Select-Object Version

# Check the system architecture
$architecture = Get-WmiObject Win32_OperatingSystem | Select-Object OSArchitecture

# Check if the system is up to date
$update = Get-WUInstall -AcceptAll -IgnoreReboot

# Update the system
$update | Invoke-WUInstall

# Enable the firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Enable the Windows Defender antivirus
Set-MpPreference -DisableRealtimeMonitoring $false

# Enable automatic updates
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 0

# Set the password policy
Set-LocalUser -Name "Administrator" -PasswordNeverExpires $true
Set-LocalUser -Name "Administrator" -PasswordChangeable $false

# Set a strong password for the administrator account
$password
