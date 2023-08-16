@echo off
Script By Jisll
setlocal

:: Make sure before you run this, to install Winget + OpenShell. Check /optional_helpers/install_apps.cmd
cd %windir%\SystemApps

:: Function to kill and move apps
:KillAndMove
taskkill /f /im %1
taskkill /f /im %1
move %2 %2.old
goto :eof

:: Disable Search
call :KillAndMove "SearchApp.exe" "Microsoft.Windows.Search_cw5n1h2txyewy"

:: Disable Start Menu
call :KillAndMove "StartMenuExperienceHost.exe" "Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy"

:: Disable Text Input
call :KillAndMove "TextInputHost.exe" "MicrosoftWindows.Client.CBS_cw5n1h2txyewy"

:: Additional apps
call :KillAndMove "Microsoft.XboxGameCallableUI_cw5n1h2txyewy" "Microsoft.XboxGameCallableUI_cw5n1h2txyewy"
call :KillAndMove "Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" "Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe"
call :KillAndMove "Microsoft.Windows.PeopleExperienceHost_cw5n1h2txyewy" "Microsoft.Windows.PeopleExperienceHost_cw5n1h2txyewy"
call :KillAndMove "microsoft.windows.narratorquickstart_8wekyb3d8bbwe" "microsoft.windows.narratorquickstart_8wekyb3d8bbwe"

echo Optimization complete!
exit /b
