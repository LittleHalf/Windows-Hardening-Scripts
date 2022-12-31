# Update the system
$update = Get-WUInstall -AcceptAll -IgnoreReboot

# Install the latest patches and updates
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

# Disable unnecessary services
Set-Service -Name "TrustedInstaller" -StartupType Disabled
Set-Service -Name "Windows Update" -StartupType Disabled

# Set the screen lock time
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaveTimeOut" -Value 1800

# Set the screen saver to the default
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "SCRNSAVE.EXE" -Value "%SystemRoot%\System32\ssmypics.scr"

# Set the power plan to high performance
Set-PowerPlan -Plan "High Performance"

# Set the power options
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "PowerButtonAction" -Value 2
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -Name "HibernateEnabled" -Value 0
