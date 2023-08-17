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

echo Disabling OS Upgrade and Automatic Updates...

set wuKeyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate
set auKeyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU
set driverKeyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching

reg add "%wuKeyPath%" /v DisableOSUpgrade /t REG_DWORD /d 1 /f
reg add "%wuKeyPath%" /v SetDisableUXWUAccess /t REG_DWORD /d 1 /f

reg add "%auKeyPath%" /v NoAutoUpdate /t REG_DWORD /d 1 /f
reg add "%auKeyPath%" /v AUOptions /t REG_DWORD /d 2 /f
reg add "%auKeyPath%" /v ScheduledInstallDay /t REG_DWORD /d 0 /f
reg add "%auKeyPath%" /v ScheduledInstallTime /t REG_DWORD /d 3 /f

reg add "%driverKeyPath%" /v SearchOrderConfig /t REG_DWORD /d 0 /f

echo OS upgrades, Automatic Updates, and AutoInstall Drivers have been disabled.
pause
