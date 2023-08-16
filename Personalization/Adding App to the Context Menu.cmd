@echo off
echo Script by Jisll
echo Applying Adding App to the Context Menu...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHC" /v PreviousUninstall /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealthCheck" /v installed /t REG_DWORD /d 1 /f
echo Adding App to the Context Menu applied.
pause
