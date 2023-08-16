@echo off
echo Script by Jisll
setlocal
set "EdgePath=%ProgramFiles(x86)%\Microsoft\Edge"
set "EdgeWebViewPath=%EdgePath%\EdgeWebView\Application"
set "EdgePath=%EdgePath%\Application"
set "EdgeCorePath=%EdgePath%\EdgeCore"
for /f "tokens=*" %%i in ('dir /B /A:D "%EdgeWebViewPath%" ^| find "."') do (
    set "version=%%i"
)
echo Uninstalling EdgeWebView...
"%EdgeWebViewPath%\%version%\Installer\setup.exe" --uninstall --force-uninstall --msedgewebview --system-level --verbose-logging
echo Uninstalling Edge...
"%EdgePath%\%version%\Installer\setup.exe" --uninstall --force-uninstall --msedge --system-level --verbose-logging
echo Uninstalling EdgeCore...
"%EdgeCorePath%\%version%\Installer\setup.exe" --uninstall --force-uninstall --msedge --system-level --verbose-logging
echo Disabling Edge updates...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft" /v DoNotUpdateToEdgeWithChromium /t REG_DWORD /d 1 /f
pause
