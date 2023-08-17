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

echo Applying Turn Off Lock Screen Spotlight...

:: Define Registry Keys
set "RegKeyCloudContent=HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
set "RegKeyPersonalization=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization"

:: Turn off Lock Screen Spotlight
reg add "%RegKeyCloudContent%" /v DisableWindowsSpotlightWindowsWelcomeExperience /t REG_DWORD /d 1 /f
reg add "%RegKeyPersonalization%" /v NoChangingLockScreen /t REG_DWORD /d 0 /f
reg add "%RegKeyCloudContent%" /v DisableWindowsSpotlightFeatures /t REG_DWORD /d 1 /f
reg add "%RegKeyCloudContent%" /v DisableWindowsSpotlightOnActionCenter /t REG_DWORD /d 1 /f
reg add "%RegKeyCloudContent%" /v DisableWindowsSpotlightOnSettings /t REG_DWORD /d 1 /f
reg add "%RegKeyCloudContent%" /v DisableThirdPartySuggestions /t REG_DWORD /d 1 /f

echo Turn Off Lock Screen Spotlight applied.
pause
