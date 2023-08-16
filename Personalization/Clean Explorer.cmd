@echo off
echo Script by Jisll
echo Applying Clean Explorer...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f
setlocal enabledelayedexpansion
set "folders_to_hide=31C0DD25-9439-4F12-BF41-7FF4EDA38722 35286a68-3c57-41a1-bbb1-0eae73d76c95 f42ee2d3-909f-4907-8871-4c22fc0bf756 7d83ee9b-2244-4e70-b1f5-5393042af1e4 0ddd015d-b06c-45d5-8c4c-f59713854639 a0c69a99-21c8-4671-8703-7934162fcf1d B4BFCC3A-DB2C-424C-B029-7FE99A87C641"
for %%f in (%folders_to_hide%) do (
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{%%f}\PropertyBag" /v ThisPCPolicy /t REG_SZ /d Hide /f
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{%%f}\PropertyBag" /v ThisPCPolicy /t REG_SZ /d Hide /f
)
taskkill /F /IM explorer.exe
start explorer.exe
echo Clean Explorer applied.
pause
