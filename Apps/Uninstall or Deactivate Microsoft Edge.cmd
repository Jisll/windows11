@echo off
echo Script by Jisll
echo Applying changes to the registry...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "1" /d "msedge.exe" /f
echo Registry changes applied.
pause
