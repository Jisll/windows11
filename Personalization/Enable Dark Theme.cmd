@echo off
echo Script by Jisll
echo Applying Enable Dark Theme...
set RegKey=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize
reg add "%RegKey%" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul
reg add "%RegKey%" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul
reg add "%RegKey%" /v EnableTransparency /t REG_DWORD /d 1 /f >nul
echo Enable Dark Theme applied.
pause
