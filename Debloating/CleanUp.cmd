@echo off
echo Script By Jisll
Dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase /SPSuperseded
del /q "%temp%\NVIDIA Corporation\NV_Cache\*"
del /q "%programdata%\NVIDIA Corporation\NV_Cache\*"
for /d %%x in ("%temp%\NVIDIA Corporation\NV_Cache\*") do @rd /s /q "%%x"
del /s /f /q "%userprofile%\Recent\*.*"
del /s /f /q "%systemdrive%\Windows\Prefetch\*.*"
del /s /f /q "%systemdrive%\Windows\Temp\*.*"
del /s /f /q "%USERPROFILE%\AppData\Local\Temp\*.*"
erase /f /s /q "%systemdrive%\Windows\SoftwareDistribution\*.*" && rmdir /s /q "%systemdrive%\Windows\SoftwareDistribution"
erase /s /f /q "%localappdata%\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\*.*"
echo Cleanup and optimization completed.
pause
