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

setlocal enabledelayedexpansion

:: Check if the script is run with administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo You must run this script as an Administrator. Exiting...
    pause >nul
    exit /b
)

:: List of folders to clean
set "folders_to_clean=%WinDir%\Temp %WinDir%\Prefetch %Temp% %AppData%\Temp %HomePath%\AppData\LocalLow\Temp"

:: Additional folders to clean
set "additional_folders_to_clean=%SystemRoot%\SoftwareDistribution\Download %SystemRoot%\Logs"

:: List of drivers folders (if needed)
:: set "drivers_folders=%SYSTEMDRIVE%\AMD %SYSTEMDRIVE%\NVIDIA %SYSTEMDRIVE%\INTEL"

echo Cleaning temporary files and folders...

:: Clean temporary files and folders
for %%F in (%folders_to_clean% %additional_folders_to_clean%) do (
    echo Deleting files in %%F
    del /s /f /q "%%F\*.*"
    rd /s /q "%%F" 2>nul
    md "%%F"
)

:: Clean drivers folders (if needed)
:: for %%D in (%drivers_folders%) do (
::     echo Deleting files in %%D
::     del /s /f /q "%%D\*.*"
::     rd /s /q "%%D"
:: )

echo.
echo Windows Clean Up Done! You can exit by pressing any key.
echo.

pause >nul
