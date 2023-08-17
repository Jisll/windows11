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

:: Stop OneDrive process
echo --- Kill OneDrive process
taskkill /f /im OneDrive.exe

:: Uninstall OneDrive
echo --- Uninstall OneDrive
set "OneDriveSetup=%SystemRoot%\System32\OneDriveSetup.exe"
if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set "OneDriveSetup=%SystemRoot%\SysWOW64\OneDriveSetup.exe"
)
"%OneDriveSetup%" /uninstall 2>nul

:: Define OneDrive-related directories
set "OneDriveDirectories=(
    "%UserProfile%\OneDrive"
    "%LocalAppData%\Microsoft\OneDrive"
    "%ProgramData%\Microsoft OneDrive"
    "%SystemDrive%\OneDriveTemp"
)"

:: Remove OneDrive leftovers
echo --- Remove OneDrive leftovers
for %%d in %OneDriveDirectories% do (
    if exist "%%d" (
        rd "%%d" /q /s
    )
)

:: Define OneDrive-related shortcuts
set "OneDriveShortcuts=(
    "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft OneDrive.lnk"
    "%APPDATA%\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"
    "%USERPROFILE%\Links\OneDrive.lnk"
)"

:: Delete OneDrive shortcuts
echo --- Delete OneDrive shortcuts
for %%s in %OneDriveShortcuts% do (
    if exist "%%s" (
        del "%%s" /s /f /q
    )
)

:: Disable OneDrive usage
echo --- Disable usage of OneDrive
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSync /d 1 /f

:: Prevent automatic OneDrive install for current user
echo --- Prevent automatic OneDrive install for current user
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /f

:: Prevent automatic OneDrive install for new users
echo --- Prevent automatic OneDrive install for new users
reg load "HKU\Default" "%SystemDrive%\Users\Default\NTUSER.DAT"
reg delete "HKU\Default\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /f
reg unload "HKU\Default"

:: Remove OneDrive from explorer menu
echo --- Remove OneDrive from explorer menu
for %%key in (
    "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
    "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
) do (
    reg delete "%%key" /f
    reg add "%%key" /v System.IsPinnedToNameSpaceTree /d 0 /t REG_DWORD /f
)

:: Delete OneDrive related Services
echo --- Delete all OneDrive related Services
for /f "tokens=1 delims=," %%x in ('schtasks /query /fo csv ^| find "OneDrive"') do (
    schtasks /Delete /TN %%x /F
)

:: Delete OneDrive path from registry
echo --- Delete OneDrive path from registry
reg delete "HKCU\Environment" /v OneDrive /f

echo Optimization complete!
exit
