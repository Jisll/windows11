@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

:: Enable color support
for /f "tokens=*" %%a in ('echo prompt $E^|cmd') do set "ESC=%%a"

:: Set console properties
chcp 65001 >nul 2>&1
mode con lines=35 cols=140
title Perfect Windows Optimizer

:: Check for Administrator Privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo %ESC%[91mThis script requires administrator privileges. Please run as administrator.%ESC%[0m
    pause
    exit /b 1
)

:: Define color codes
call :SetColors

:MainMenu
cls
echo.
echo  %CYAN%██████╗ ███████╗██████╗ ███████╗███████╗ ██████╗████████╗    ██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗███████╗
echo  %CYAN%██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝██╔════╝╚══██╔══╝    ██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔════╝
echo  %CYAN%██████╔╝█████╗  ██████╔╝█████╗  █████╗  ██║        ██║       ██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║███████╗
echo  %CYAN%██╔═══╝ ██╔══╝  ██╔══██╗██╔══╝  ██╔══╝  ██║        ██║       ██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║╚════██║
echo  %CYAN%██║     ███████╗██║  ██║██║     ███████╗╚██████╗   ██║       ╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝███████║
echo  %CYAN%╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝ ╚═════╝   ╚═╝        ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚══════╝
echo.
echo  %WHITE%═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.                                                                                              %BRIGHT_BLACK%Twitter @Jisllos%WHITE%
echo  %YELLOW%[1] %WHITE%Run All Optimizations
echo  %YELLOW%[2] %WHITE%Manage Services
echo  %YELLOW%[3] %WHITE%Clean Temporary Files
echo  %YELLOW%[4] %WHITE%Optimize Privacy Settings
echo  %YELLOW%[5] %WHITE%Disable Telemetry and Data Collection
echo  %YELLOW%[6] %WHITE%Optimize System Performance
echo  %YELLOW%[7] %WHITE%Disable System Mitigations (Advanced)
echo  %YELLOW%[8] %WHITE%Information
echo  %RED%[E] %WHITE%Exit
echo.
set /p "choice=%WHITE%Enter your choice: %YELLOW%"

if "%choice%"=="1" goto :RunAllOptimizations
if "%choice%"=="2" goto :ManageServices
if "%choice%"=="3" goto :CleanTemp
if "%choice%"=="4" goto :OptimizePrivacy
if "%choice%"=="5" goto :DisableTelemetry
if "%choice%"=="6" goto :OptimizePerformance
if "%choice%"=="7" goto :DisableMitigations
if "%choice%"=="8" goto :Information
if /i "%choice%"=="E" exit /b
goto :MainMenu

:RunAllOptimizations
call :ManageServices
call :CleanTemp
call :OptimizePrivacy
call :DisableTelemetry
call :OptimizePerformance
echo %GREEN%All optimizations have been applied. It's recommended to restart your computer.%WHITE%
pause
goto :MainMenu

:ManageServices
cls
echo %CYAN%Managing Windows Services...%WHITE%

:: Services to be set to Automatic
set "services_auto=AudioEndpointBuilder Audiosrv BITS BFE BluetoothUserService_dc2a4 BrokerInfrastructure Browser BthAvctpSvc BthHFSrv CaptureService_dc2a4 CDPUserSvc_dc2a4 COMSysApp CoreMessagingRegistrar CredentialEnrollmentManagerUserSvc_dc2a4 CryptSvc DPS Dhcp Dnscache DoSvc DsmSvc DusmSvc EapHost EventLog EventSystem FrameServer GraphicsPerfSvc HvHost IKEEXT LanmanServer LanmanWorkstation LicenseManager MMCSS MpsSvc NaturalAuthentication NgcCtnrSvc NgcSvc NlaSvc OneSyncSvc_dc2a4 ProfSvc Power PrintWorkflowUserSvc_dc2a4 RasAuto RasMan RemoteRegistry RpcEptMapper RpcLocator RpcSs SamSs Schedule SecurityHealthService SENS ShellHWDetection Spooler SSDPSRV SysMain TabletInputService Themes UsoSvc VGAuthService VMTools VSS WebClient WdiServiceHost WinDefend WlanSvc WpnUserService_dc2a4 XblAuthManager XboxNetApiSvc bthserv gpsvc iphlpsvc mpssvc nsi p2psvc perceptionsimulation sppsvc svsvc tzautoupdate vds webthreatdefusersvc_dc2a4 wscsvc"

:: Services to be disabled
set "services_disabled=AJRouter AppVClient DiagTrack DialogBlockingService DistributedLinkTrackingService EdgeUpdate edgeupdatem embeddedmode hidserv shpamsvc spectrum ssh-agent uhssvc wercplsupport webthreatdefsvc wuauserv"

:: Services to be set to Automatic (Delayed Start)
set "services_delayed=BITS DoSvc WSearch wscsvc"

echo %WHITE%Setting services to Automatic...
for %%s in (%services_auto%) do (
    sc query "%%s" >nul 2>&1
    if %errorlevel% equ 0 (
        sc config "%%s" start= auto
        sc start "%%s" >nul 2>&1
        if %errorlevel% equ 0 (
            echo Set %%s to Automatic
        ) else (
            echo Failed to start %%s
        )
    ) else (
        echo Service %%s does not exist.
    )
)

echo.
echo %WHITE%Setting services to Disabled...
for %%s in (%services_disabled%) do (
    sc query "%%s" >nul 2>&1
    if %errorlevel% equ 0 (
        sc config "%%s" start= disabled
        sc stop "%%s" >nul 2>&1
        if %errorlevel% equ 0 (
            echo Disabled %%s
        ) else (
            echo Failed to stop %%s
        )
    ) else (
        echo Service %%s does not exist.
    )
)

echo.
echo %WHITE%Setting services to Automatic (Delayed Start)...
for %%s in (%services_delayed%) do (
    sc query "%%s" >nul 2>&1
    if %errorlevel% equ 0 (
        sc config "%%s" start= delayed-auto
        echo Set %%s to Automatic (Delayed Start)
    ) else (
        echo Service %%s does not exist.
    )
)

echo.
echo %GREEN%Services have been optimized.%WHITE%
pause
goto :MainMenu

:CleanTemp
cls
echo %CYAN%Cleaning Temporary Files...%WHITE%

:: Define log file
set "logFile=%~dp0cleanup_log.txt"
echo [%date% %time%] Cleaning Temporary Files >> "%logFile%"

:: Function to clean directories
call :CleanDirectory "C:\Windows\Temp" "%logFile%"
call :CleanDirectory "%TEMP%" "%logFile%"
call :CleanDirectory "C:\Windows\Prefetch" "%logFile%"
call :CleanDirectory "C:\Windows\SoftwareDistribution" "%logFile%"
call :CleanDirectory "%SystemDrive%\$Recycle.Bin" "%logFile%"

:: Stop and start Windows Update service for SoftwareDistribution
echo [%date% %time%] Stopping Windows Update Service >> "%logFile%"
net stop wuauserv >nul 2>&1
echo [%date% %time%] Starting Windows Update Service >> "%logFile%"
net start wuauserv >nul 2>&1

:: Clean Windows.old if it exists
if exist C:\Windows.old (
    echo [%date% %time%] Removing Windows.old >> "%logFile%"
    rd /s /q C:\Windows.old >> "%logFile%" 2>&1
)

:: Clear Event Logs
echo [%date% %time%] Clearing Event Logs >> "%logFile%"
for /F "tokens=*" %%G in ('wevtutil el') do (
    wevtutil cl "%%G" >nul 2>&1
    echo Cleared %%G
)

:: Clear thumbnail cache
echo [%date% %time%] Clearing Thumbnail Cache >> "%logFile%"
del /f /s /q /a "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >> "%logFile%" 2>&1

echo %GREEN%Temporary files have been cleaned.%WHITE%
pause
goto :MainMenu

:CleanDirectory
:: %1 - Directory path
:: %2 - Log file
if exist %1 (
    rd /s /q %1 >> "%2%" 2>&1
    md %1 >> "%2%" 2>&1
    echo Cleaned %1
) else (
    echo Directory %1 does not exist. >> "%2%"
)
exit /b

:OptimizePrivacy
cls
echo %CYAN%Optimizing Privacy Settings...%WHITE%

:: Define log file
set "logFile=%~dp0privacy_log.txt"
echo [%date% %time%] Optimizing Privacy Settings >> "%logFile%"

:: Function to add registry keys
call :AddRegKey "HKLM\Software\Microsoft\PolicyManager\default\WiFi" "AllowWiFiHotSpotReporting" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\Software\Microsoft\PolicyManager\default\WiFi" "AllowAutoConnectToWiFiSenseHotspots" "REG_DWORD" "0" "%logFile%"

call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" "EnableActivityFeed" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" "PublishUserActivities" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" "UploadUserActivities" "REG_DWORD" "0" "%logFile%"

call :AddRegKey "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" "Value" "REG_SZ" "Deny" "%logFile%"
call :AddRegKey "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" "SensorPermissionState" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" "Status" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SYSTEM\Maps" "AutoUpdateEnabled" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\Biometrics" "Enabled" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" "EnableActivityFeed" "REG_DWORD" "0" "%logFile%"
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /f >> "%logFile%" 2>&1
echo Deleted Storage Sense StoragePolicy >> "%logFile%"

echo %GREEN%Privacy settings have been optimized.%WHITE%
pause
goto :MainMenu

:DisableTelemetry
cls
echo %CYAN%Disabling Telemetry and Data Collection...%WHITE%

:: Define log file
set "logFile=%~dp0telemetry_log.txt"
echo [%date% %time%] Disabling Telemetry and Data Collection >> "%logFile%"

call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" "AllowTelemetry" "REG_DWORD" "0" "%logFile%"

call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" "CEIPEnable" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\SQMClient" "CEIPEnable" "REG_DWORD" "0" "%logFile%"

call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" "AITEnable" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" "DisableInventory" "REG_DWORD" "1" "%logFile%"
call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" "DisableUAR" "REG_DWORD" "1" "%logFile%"

call :AddRegKey "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" "Disabled" "REG_DWORD" "1" "%logFile%"

echo %GREEN%Telemetry and data collection have been disabled.%WHITE%
pause
goto :MainMenu

:OptimizePerformance
cls
echo %CYAN%Optimizing System Performance...%WHITE%

:: Define log file
set "logFile=%~dp0performance_log.txt"
echo [%date% %time%] Optimizing System Performance >> "%logFile%"

:: Disable Superfetch (SysMain)
sc stop SysMain >> "%logFile%" 2>&1
sc config SysMain start= disabled >> "%logFile%" 2>&1
echo Disabled SysMain (Superfetch) >> "%logFile%"

:: Optimize visual effects for performance
call :AddRegKey "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" "VisualFXSetting" "REG_DWORD" "2" "%logFile%"

:: Disable Transparency
call :AddRegKey "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" "EnableTransparency" "REG_DWORD" "0" "%logFile%"

:: Disable Animations
call :AddRegKey "HKCU\Control Panel\Desktop\WindowMetrics" "MinAnimate" "REG_SZ" "0" "%logFile%"

:: Increase DNS Cache
ipconfig /flushdns >> "%logFile%" 2>&1
call :AddRegKey "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" "CacheHashTableBucketSize" "REG_DWORD" "1" "%logFile%"
call :AddRegKey "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" "CacheHashTableSize" "REG_DWORD" "384" "%logFile%"

:: Optimize Boot Performance
bcdedit /set {current} bootmenupolicy Standard >> "%logFile%" 2>&1
echo Set bootmenupolicy to Standard >> "%logFile%"

:: Disable Hibernation
powercfg /h off >> "%logFile%" 2>&1
echo Disabled Hibernation >> "%logFile%"

:: Optimize for performance power plan
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >> "%logFile%" 2>&1
echo Set Power Plan to High Performance >> "%logFile%"

:: Disable Fast Startup
call :AddRegKey "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" "HiberbootEnabled" "REG_DWORD" "0" "%logFile%"

echo %GREEN%System performance has been optimized.%WHITE%
pause
goto :MainMenu

:DisableMitigations
cls
echo %RED%WARNING: Disabling system mitigations can improve performance but may increase security risks.%WHITE%
echo Are you sure you want to proceed? Type %YELLOW%YES%WHITE% to continue or any other key to abort.
set /p "confirm=>"
if /i not "%confirm%"=="YES" goto :MainMenu

:: Define log file
set "logFile=%~dp0mitigations_log.txt"
echo [%date% %time%] Disabling System Mitigations >> "%logFile%"

echo %CYAN%Disabling System Mitigations...%WHITE%

:: Disable Process Mitigations via PowerShell
powershell -Command "Get-ProcessMitigation -System | ForEach-Object { Set-ProcessMitigation -System -Disable @{($_.Feature)} }" >> "%logFile%" 2>&1

:: Remove Image File Execution Options
powershell -Command "Remove-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\*' -Recurse -ErrorAction SilentlyContinue" >> "%logFile%" 2>&1
echo Removed Image File Execution Options >> "%logFile%"

:: Modify Registry to Disable Various Security Features
call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\FVE" "DisableExternalDMAUnderLock" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" "EnableVirtualizationBasedSecurity" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" "HVCIMATRequired" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" "DisableExceptionChainValidation" "REG_DWORD" "1" "%logFile%"
call :AddRegKey "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" "KernelSEHOPEnabled" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "EnableCfg" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" "ProtectionMode" "REG_DWORD" "0" "%logFile%"
call :AddRegKey "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "FeatureSettingsOverride" "REG_DWORD" "3" "%logFile%"
call :AddRegKey "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "FeatureSettingsOverrideMask" "REG_DWORD" "3" "%logFile%"

echo %GREEN%System mitigations have been disabled.%WHITE%
echo %RED%WARNING: Your system may be more vulnerable to certain types of attacks.%WHITE%
echo %YELLOW%It's recommended to re-enable mitigations if you're not experiencing significant performance issues.%WHITE%
pause
goto :MainMenu

:Information
cls
echo %CYAN%Perfect Windows Optimizer - Information%WHITE%
echo.
echo This tool is designed to enhance your Windows experience by optimizing various
echo system settings for improved performance, privacy, and user experience.
echo.
echo %YELLOW%Features:%WHITE%
echo - Service Management
echo - Temporary File Cleanup
echo - Privacy Optimization
echo - Telemetry and Data Collection Control
echo - System Performance Enhancement
echo - Advanced System Tweaks (Mitigation Control)
echo.
echo %RED%Disclaimer:%WHITE%
echo This tool makes significant changes to your Windows configuration.
echo While these changes are designed to improve performance and privacy,
echo they may cause compatibility issues with some software or reduce
echo certain security protections.
echo.
echo It's strongly recommended to:
echo 1. Create a system restore point before using this tool
echo 2. Only use this tool if you understand the implications of the changes
echo 3. Keep your system and all software up-to-date
echo.
echo %CYAN%For updates and support, visit: https://github.com/Jisll/windows11%WHITE%
echo %CYAN%Follow us on Twitter: @Jisllos%WHITE%
pause
goto :MainMenu

:SetColors
set "BLACK=%ESC%[30m"
set "RED=%ESC%[31m"
set "GREEN=%ESC%[32m"
set "YELLOW=%ESC%[33m"
set "BLUE=%ESC%[34m"
set "MAGENTA=%ESC%[35m"
set "CYAN=%ESC%[36m"
set "WHITE=%ESC%[37m"
set "BRIGHT_BLACK=%ESC%[90m"
set "BRIGHT_RED=%ESC%[91m"
set "BRIGHT_GREEN=%ESC%[92m"
set "BRIGHT_YELLOW=%ESC%[93m"
set "BRIGHT_BLUE=%ESC%[94m"
set "BRIGHT_MAGENTA=%ESC%[95m"
set "BRIGHT_CYAN=%ESC%[96m"
set "BRIGHT_WHITE=%ESC%[97m"
exit /b

:AddRegKey
:: %1 - Registry Path
:: %2 - Value Name
:: %3 - Value Type
:: %4 - Value Data
:: %5 - Log File
reg add "%1" /v "%2" /t "%3" /d "%4" /f >> "%5%" 2>&1
if %errorlevel% equ 0 (
    echo Added/Updated "%2" in "%1" >> "%5%"
) else (
    echo Failed to add/update "%2" in "%1" >> "%5%"
)
exit /b

:EOF
