@echo off
echo Script By Jisll
setlocal enabledelayedexpansion
echo *** Stopping Microsoft Edge ***
taskkill /F /IM msedge.exe >nul 2>&1
set "DesktopFolder=%HOMEDRIVE%%HOMEPATH%\Desktop"
echo Current directory: %CD%
echo Desktop folder: %DesktopFolder%
echo *** Removing Microsoft Edge ***
call :KillDir "C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
call :KillDir "C:\Program Files (x86)\Microsoft\Edge"
call :KillDir "C:\Program Files (x86)\Microsoft\EdgeUpdate"
call :KillDir "C:\Program Files (x86)\Microsoft\EdgeCore"
call :KillDir "C:\Program Files (x86)\Microsoft\EdgeWebView"
echo *** Modifying registry ***
call :EditRegistry
echo *** Removing shortcuts ***
call :DeleteShortcut "%Public%\Desktop\Microsoft Edge.lnk"
call :DeleteShortcut "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"
call :DeleteShortcut "%APPDATA%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk"
echo Finished!
exit
:KillDir
set "Directory=%~1"
echo Removing dir !Directory!
if exist "!Directory!" (
    takeown /a /r /d Y /f "!Directory!" > NUL
    icacls "!Directory!" /grant administrators:f /t > NUL
    rd /s /q "!Directory!" > NUL
    if exist "!Directory!" (
        echo ...Failed.
    ) else (
        echo ...Deleted.
    )
) else (
    echo ...does not exist.
)
exit /B 0
:EditRegistry
echo Editing registry
(
    echo Windows Registry Editor Version 5.00
    echo.
    echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EdgeUpdate]
    echo "DoNotUpdateToEdgeWithChromium"=dword:00000001
    echo.
    echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{9459C573-B17A-45AE-9F64-1857B5D58CEE}]
) > RemoveEdge.reg
regedit /s RemoveEdge.reg
del RemoveEdge.reg
echo ...done.
exit /B 0
:DeleteShortcut
set "ShortcutPath=%~1"
echo Removing shortcut !ShortcutPath!
if exist "!ShortcutPath!" (
    del "!ShortcutPath!"
    echo ...done.
) else (
    echo ...does not exist.
)
exit /B 0
