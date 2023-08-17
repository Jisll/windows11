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

echo Performing system cleanup and optimization...

:: Run DISM to clean up and reset Windows component store
Dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase /SPSuperseded

:: Clean NVIDIA cache
del /q "%temp%\NVIDIA Corporation\NV_Cache\*"
del /q "%programdata%\NVIDIA Corporation\NV_Cache\*"
for /d %%x in ("%temp%\NVIDIA Corporation\NV_Cache\*") do @rd /s /q "%%x"

:: Clean recent files
del /s /f /q "%userprofile%\Recent\*.*"

:: Clean Windows prefetch
del /s /f /q "%systemdrive%\Windows\Prefetch\*.*"

:: Clean Windows and user temporary files
del /s /f /q "%systemdrive%\Windows\Temp\*.*"
del /s /f /q "%USERPROFILE%\AppData\Local\Temp\*.*"

:: Clean Windows Software Distribution
erase /f /s /q "%systemdrive%\Windows\SoftwareDistribution\*.*" && rmdir /s /q "%systemdrive%\Windows\SoftwareDistribution"

:: Clean Start Menu Experience Host cache
erase /s /f /q "%localappdata%\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\*.*"

echo Cleanup and optimization completed.
pause
