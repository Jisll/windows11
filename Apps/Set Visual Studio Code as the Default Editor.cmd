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

echo Applying VSCode Default Editor...

:: Set the path to VSCode executable
set "VSCodePath=E:\VSCode"

:: Define common registry key strings
set "regKeyHKCR=HKEY_CLASSES_ROOT"
set "regKeyCustomShell=%regKeyHKCR%\*\shell\Custom\shell\VsCode"
set "regKeyDirectoryShell=%regKeyHKCR%\Directory\shell\vscode"
set "regKeyDirectoryBackgroundShell=%regKeyHKCR%\Directory\Background\shell\vscode"

:: Add/Edit registry keys for editing with VSCode
reg add "%regKeyCustomShell%" /ve /d "Edit with VSCode" /f
reg add "%regKeyCustomShell%" /v Icon /d "%VSCodePath%\Code.exe,0" /f
reg add "%regKeyCustomShell%\command" /ve /d "\"%VSCodePath%\Code.exe\" \"%1\"" /f

:: Add/Edit registry keys for opening folder as VS Code project
reg add "%regKeyDirectoryShell%" /ve /d "Open Folder as VS Code Project" /f
reg add "%regKeyDirectoryShell%" /v Icon /d "%VSCodePath%\Code.exe,0" /f
reg add "%regKeyDirectoryShell%\command" /ve /d "\"%VSCodePath%\Code.exe\" \"%1\"" /f

:: Add/Edit registry keys for opening folder in VS Code project (background)
reg add "%regKeyDirectoryBackgroundShell%" /ve /d "Open Folder in VS Code Project" /f
reg add "%regKeyDirectoryBackgroundShell%" /v Icon /d "%VSCodePath%\Code.exe,0" /f
reg add "%regKeyDirectoryBackgroundShell%\command" /ve /d "\"%VSCodePath%\Code.exe\" \"%V\"" /f

echo VSCode Default Editor applied.
pause
