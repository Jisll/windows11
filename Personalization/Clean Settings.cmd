@echo off
echo Script by Jisll
echo Applying Clean Settings...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v AllowOnlineTips /t REG_DWORD /d 0 /f
echo Clean Settings applied.
pause
