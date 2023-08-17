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

:: Set variables for Edge paths
set "ProgramFilesPath=%ProgramFiles(x86)%"
set "EdgePath=%ProgramFilesPath%\Microsoft\Edge"
set "EdgeWebViewPath=%EdgePath%\EdgeWebView\Application"
set "EdgePath=%EdgePath%\Application"
set "EdgeCorePath=%EdgePath%\EdgeCore"

:: Find the latest version of EdgeWebView
for /f "delims=" %%i in ('dir /B /A:D "%EdgeWebViewPath%"') do (
    set "version=%%i"
)

:: Uninstall EdgeWebView
echo Uninstalling EdgeWebView...
"%EdgeWebViewPath%\%version%\Installer\setup.exe" --uninstall --force-uninstall --msedgewebview --system-level --verbose-logging

:: Uninstall Edge
echo Uninstalling Edge...
"%EdgePath%\%version%\Installer\setup.exe" --uninstall --force-uninstall --msedge --system-level --verbose-logging

:: Uninstall EdgeCore
echo Uninstalling EdgeCore...
"%EdgeCorePath%\%version%\Installer\setup.exe" --uninstall --force-uninstall --msedge --system-level --verbose-logging

:: Disable Edge updates by adding a registry key
echo Disabling Edge updates...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft" /v DoNotUpdateToEdgeWithChromium /t REG_DWORD /d 1 /f

echo Script completed.
pause
