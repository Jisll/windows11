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

:: Make sure before you run this, to install Winget + OpenShell. Check /optional_helpers/install_apps.cmd
cd %windir%\SystemApps

:: Function to kill and move apps
:KillAndMove
taskkill /f /im %1
taskkill /f /im %1
move %2 %2.old
goto :eof

:: Define apps and their corresponding directories
set "AppsToDisable=(
    "SearchApp.exe=Microsoft.Windows.Search_cw5n1h2txyewy"
    "StartMenuExperienceHost.exe=Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy"
    "TextInputHost.exe=MicrosoftWindows.Client.CBS_cw5n1h2txyewy"
    "Microsoft.XboxGameCallableUI_cw5n1h2txyewy=Microsoft.XboxGameCallableUI_cw5n1h2txyewy"
    "Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe=Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe"
    "Microsoft.Windows.PeopleExperienceHost_cw5n1h2txyewy=Microsoft.Windows.PeopleExperienceHost_cw5n1h2txyewy"
    "microsoft.windows.narratorquickstart_8wekyb3d8bbwe=microsoft.windows.narratorquickstart_8wekyb3d8bbwe"
)"

:: Loop through apps and disable/move them
for %%a in %AppsToDisable% do (
    for /f "tokens=1,2 delims==" %%i in (%%a) do (
        call :KillAndMove "%%i" "%%j"
    )
)

echo Optimization complete!
exit /b
