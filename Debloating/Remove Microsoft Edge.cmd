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

:: Stop Microsoft Edge
echo *** Stopping Microsoft Edge ***
taskkill /F /IM msedge.exe >nul 2>&1

:: Set desktop folder
set "DesktopFolder=%HOMEDRIVE%%HOMEPATH%\Desktop"
echo Current directory: %CD%
echo Desktop folder: %DesktopFolder%

:: Define Edge-related directories
set "EdgeDirectories=(
    "C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
    "C:\Program Files (x86)\Microsoft\Edge"
    "C:\Program Files (x86)\Microsoft\EdgeUpdate"
    "C:\Program Files (x86)\Microsoft\EdgeCore"
    "C:\Program Files (x86)\Microsoft\EdgeWebView"
)"

:: Loop through and remove Edge directories
echo *** Removing Microsoft Edge ***
for %%d in %EdgeDirectories% do (
    call :KillDir "%%~d"
)

:: Modify registry
echo *** Modifying registry ***
call :EditRegistry

:: Define Edge-related shortcuts
set "EdgeShortcuts=(
    "%Public%\Desktop\Microsoft Edge.lnk"
    "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"
    "%APPDATA%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk"
)"

:: Loop through and delete Edge shortcuts
echo *** Removing shortcuts ***
for %%s in %EdgeShortcuts% do (
    call :DeleteShortcut "%%~s"
)

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
