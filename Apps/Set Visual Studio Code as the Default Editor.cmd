@echo off
echo Script by Jisll
echo Applying VSCode Default Editor...
set "VSCodePath=E:\VSCode"
reg add "HKEY_CLASSES_ROOT\*\shell\Custom\shell\VsCode" /ve /d "Edit with VSCode" /f
reg add "HKEY_CLASSES_ROOT\*\shell\Custom\shell\VsCode" /v Icon /d "%VSCodePath%\Code.exe,0" /f
reg add "HKEY_CLASSES_ROOT\*\shell\Custom\shell\VsCode\command" /ve /d "\"%VSCodePath%\Code.exe\" \"%1\"" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\vscode" /ve /d "Open Folder as VS Code Project" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\vscode" /v Icon /d "%VSCodePath%\Code.exe,0" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\vscode\command" /ve /d "\"%VSCodePath%\Code.exe\" \"%1\"" /f
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\vscode" /ve /d "Open Folder in VS Code Project" /f
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\vscode" /v Icon /d "%VSCodePath%\Code.exe,0" /f
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\vscode\command" /ve /d "\"%VSCodePath%\Code.exe\" \"%V\"" /f
echo VSCode Default Editor applied.
pause
