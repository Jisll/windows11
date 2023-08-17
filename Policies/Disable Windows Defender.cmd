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

echo Disabling Windows Defender...

set keyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender
set rtKeyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection
set ssKeyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen
set suKeyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates
set spKeyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet
set mfKeyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features

reg add "%keyPath%" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "%keyPath%" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
reg add "%keyPath%" /v DisableAntiVirus /t REG_DWORD /d 1 /f
reg add "%keyPath%" /v DisableSpecialRunningModes /t REG_DWORD /d 1 /f
reg add "%keyPath%" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /f
reg add "%keyPath%" /v ServiceKeepAlive /t REG_DWORD /d 0 /f

reg add "%rtKeyPath%" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
reg add "%rtKeyPath%" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
reg add "%rtKeyPath%" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /f
reg add "%rtKeyPath%" /v DisableIOAVProtection /t REG_DWORD /d 1 /f
reg add "%rtKeyPath%" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f

reg add "%ssKeyPath%" /v ConfigureAppInstallControlEnabled /t REG_DWORD /d 0 /f

reg add "%suKeyPath%" /v ForceUpdateFromMU /t REG_DWORD /d 0 /f

reg add "%spKeyPath%" /v DisableBlockAtFirstSeen /t REG_DWORD /d 1 /f
reg add "%spKeyPath%" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f
reg add "%spKeyPath%" /v SpynetReporting /t REG_DWORD /d 0 /f

reg add "%mfKeyPath%" /v TamperProtection /t REG_DWORD /d 0 /f

reg add "%keyPath%" /v ServiceStartStates /t REG_DWORD /d 1 /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 1 /f

echo Windows Defender has been disabled.
pause
