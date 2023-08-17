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

echo Disabling Microsoft Edge features...

set edgeKeyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge
set edgeUpdateKeyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EdgeUpdate
set microsoftKeyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft

reg add "%edgeKeyPath%" /v SyncDisabled /t REG_DWORD /d 1 /f
reg add "%edgeKeyPath%" /v BrowserSignin /t REG_DWORD /d 0 /f
reg add "%edgeKeyPath%" /v NewSmartScreenLibraryEnabled /t REG_DWORD /d 0 /f
reg add "%edgeKeyPath%" /v SmartScreenEnabled /t REG_DWORD /d 0 /f
reg add "%edgeKeyPath%" /v SmartScreenPuaEnabled /t REG_DWORD /d 0 /f
reg add "%edgeKeyPath%" /v StartupBoostEnabled /t REG_DWORD /d 0 /f
reg add "%edgeKeyPath%" /v BingAdsSuppression /t REG_DWORD /d 1 /f
reg add "%edgeKeyPath%" /v BackgroundModeEnabled /t REG_DWORD /d 0 /f
reg add "%edgeKeyPath%" /v ComponentUpdatesEnabled /t REG_DWORD /d 0 /f
reg add "%edgeKeyPath%" /v EdgeShoppingAssistantEnabled /t REG_DWORD /d 0 /f
reg add "%edgeKeyPath%" /v ForceGoogleSafeSearch /t REG_DWORD /d 1 /f

reg add "%edgeUpdateKeyPath%" /v AutoUpdateCheckPeriodMinutes /t REG_DWORD /d 0 /f
reg add "%edgeUpdateKeyPath%" /v UpdateDefault /t REG_DWORD /d 0 /f
reg add "%edgeUpdateKeyPath%" /v UpdatePolicy /t REG_DWORD /d 0 /f

reg add "%microsoftKeyPath%" /v DoNotUpdateToEdgeWithChromium /t REG_DWORD /d 1 /f

echo Microsoft Edge features have been disabled.
pause
