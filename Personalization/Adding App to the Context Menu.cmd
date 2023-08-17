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

echo Applying Adding App to the Context Menu...

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHC" /v PreviousUninstall /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealthCheck" /v installed /t REG_DWORD /d 1 /f

echo Adding App to the Context Menu applied.
pause
