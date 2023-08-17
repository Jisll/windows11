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

echo Applying Prevent Wallpaper Changes...

:: Define Registry Keys
set "RegKeyHKCU=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop"
set "RegKeyHKLM=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop"

:: Prevent wallpaper changes
reg add "%RegKeyHKCU%" /v NoChangingWallPaper /t REG_DWORD /d 1 /f
reg add "%RegKeyHKLM%" /v NoChangingWallPaper /t REG_DWORD /d 1 /f

echo Prevent Wallpaper Changes applied.
pause
