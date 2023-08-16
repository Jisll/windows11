@echo off
echo Script By Jisll
setlocal enabledelayedexpansion

echo --- Kill OneDrive process
taskkill /f /im OneDrive.exe

echo --- Uninstall OneDrive
if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    "%SystemRoot%\System32\OneDriveSetup.exe" /uninstall 2>nul
) else (
    "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall 2>nul
)

echo --- Remove OneDrive leftovers
for %%d in (
    "%UserProfile%\OneDrive"
    "%LocalAppData%\Microsoft\OneDrive"
    "%ProgramData%\Microsoft OneDrive"
    "%SystemDrive%\OneDriveTemp"
) do (
    if exist "%%d" (
        rd "%%d" /q /s
    )
)

echo --- Delete OneDrive shortcuts
for %%s in (
    "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft OneDrive.lnk"
    "%APPDATA%\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"
    "%USERPROFILE%\Links\OneDrive.lnk"
) do (
    if exist "%%s" (
        del "%%s" /s /f /q
    )
)

echo --- Disable usage of OneDrive
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v DisableFileSyncNGSC /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v DisableFileSync /d 1 /f

echo --- Prevent automatic OneDrive install for current user
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /f

echo --- Prevent automatic OneDrive install for new users
reg load "HKU\Default" "%SystemDrive%\Users\Default\NTUSER.DAT"
reg delete "HKU\Default\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /f
reg unload "HKU\Default"

echo --- Remove OneDrive from explorer menu
for %%key in (
    "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
    "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
) do (
    reg delete "%%key" /f
    reg add "%%key" /v System.IsPinnedToNameSpaceTree /d 0 /t REG_DWORD /f
)

echo --- Delete all OneDrive related Services
for /f "tokens=1 delims=," %%x in ('schtasks /query /fo csv ^| find "OneDrive"') do (
    schtasks /Delete /TN %%x /F
)
echo --- Delete OneDrive path from registry
reg delete "HKCU\Environment" /v OneDrive /f
echo Optimization complete!
exit