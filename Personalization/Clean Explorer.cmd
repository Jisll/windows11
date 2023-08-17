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

echo Applying Clean Explorer...

:: Set folders to hide
set "folders_to_hide=31C0DD25-9439-4F12-BF41-7FF4EDA38722 35286a68-3c57-41a1-bbb1-0eae73d76c95 f42ee2d3-909f-4907-8871-4c22fc0bf756 7d83ee9b-2244-4e70-b1f5-5393042af1e4 0ddd015d-b06c-45d5-8c4c-f59713854639 a0c69a99-21c8-4671-8703-7934162fcf1d B4BFCC3A-DB2C-424C-B029-7FE99A87C641"

:: Hide specified folders in This PC
for %%f in (%folders_to_hide%) do (
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{%%f}\PropertyBag" /v ThisPCPolicy /t REG_SZ /d Hide /f
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{%%f}\PropertyBag" /v ThisPCPolicy /t REG_SZ /d Hide /f
)

:: Restart Explorer
taskkill /F /IM explorer.exe
start explorer.exe

echo Clean Explorer applied.
pause
