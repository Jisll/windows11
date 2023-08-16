@echo off
setlocal enabledelayedexpansion
echo Script By Jisll

:: Check if the script is run with administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo You must run this script as an Administrator. Exiting...
    pause >nul
    exit /b
)

:: List of folders to clean
set "folders_to_clean=%WinDir%\Temp %WinDir%\Prefetch %Temp% %AppData%\Temp %LocalAppData%\Temp"

echo Cleaning temporary files and folders...

:: Clean temporary files and folders
for %%F in (%folders_to_clean%) do (
    echo Deleting files in %%F
    del /s /f /q "%%F\*.*" 2>nul
    rd /s /q "%%F" 2>nul
    mkdir "%%F"
)

echo.
echo Windows Clean Up Done! You can exit by pressing any key.
echo.

pause >nul
