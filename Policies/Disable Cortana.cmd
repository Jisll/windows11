@echo off
setlocal EnableDelayedExpansion
color 17
cls
echo.
echo.
echo    ____        _      __    ___            ___      ____
echo   / __/_______(_)__  / /_  / _ )__ __  __ / (_)__  / / /
echo  _\ \/ __/ __/ / _ \/ __/ / _  / // / / // / (_- // / /
echo /___/\__/_/ /_/ .__/\__/ /____/\_, /  \___/_/__ /_ /_/
echo              /_/              /___/
echo.
echo.
echo Before proceeding, make sure to create a backup of your system.
echo This script will modify various settings. Continue only if you understand the changes.
echo.
set /p "continue=Press ENTER to start the process..."

echo Disabling Cloud Search and Cortana...

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCloudSearch /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortanaAboveLock /t REG_DWORD /d 0 /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaEnabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 0 /f

echo Cloud Search and Cortana have been disabled successfully.
pause
