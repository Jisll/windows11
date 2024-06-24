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
    sc config "%%s" start= auto
    sc start "%%s"
    echo Set %%s to Automatic
)

echo.
echo %WHITE%Setting services to Disabled...
for %%s in (%services_disabled%) do (
    sc config "%%s" start= disabled
    sc stop "%%s"
    echo Disabled %%s
)

echo.
echo %WHITE%Setting services to Automatic (Delayed Start)...
for %%s in (%services_delayed%) do (
    sc config "%%s" start= delayed-auto
    echo Set %%s to Automatic (Delayed Start)
)

echo.
echo %GREEN%Services have been optimized.%WHITE%
pause
goto :MainMenu

:CleanTemp
cls
echo %CYAN%Cleaning Temporary Files...%WHITE%

:: Clean Windows Temp folder
rd /s /q C:\Windows\Temp
md C:\Windows\Temp

:: Clean User Temp folder
rd /s /q %TEMP%
md %TEMP%

:: Clean Prefetch
rd /s /q C:\Windows\Prefetch
md C:\Windows\Prefetch

:: Clean SoftwareDistribution folder
net stop wuauserv
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution
net start wuauserv

:: Clean Windows.old if it exists
if exist C:\Windows.old rd /s /q C:\Windows.old

:: Empty Recycle Bin
rd /s /q %SystemDrive%\$Recycle.Bin

:: Clear Event Logs
for /F "tokens=*" %%G in ('wevtutil el') do (wevtutil cl "%%G")

:: Clear thumbnail cache
del /f /s /q /a %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db

echo %GREEN%Temporary files have been cleaned.%WHITE%
pause
goto :MainMenu

:OptimizePrivacy
cls
echo %CYAN%Optimizing Privacy Settings...%WHITE%

:: Disable Wi-Fi Sense
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v Value /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v Value /t REG_DWORD /d 0 /f

:: Disable Activity Feed
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities /t REG_DWORD /d 0 /f

:: Disable location tracking
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v Value /t REG_SZ /d "Deny" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v SensorPermissionState /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v Status /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\Maps" /v AutoUpdateEnabled /t REG_DWORD /d 0 /f

:: Disable Windows Hello Biometrics
reg add "HKLM\SOFTWARE\Policies\Microsoft\Biometrics" /v Enabled /t REG_DWORD /d 0 /f

:: Disable Timeline
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed /t REG_DWORD /d 0 /f

:: Disable Storage Sense
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /f

echo %GREEN%Privacy settings have been optimized.%WHITE%
pause
goto :MainMenu

:DisableTelemetry
cls
echo %CYAN%Disabling Telemetry and Data Collection...%WHITE%

:: Disable Telemetry
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

:: Disable Customer Experience Improvement Program
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v CEIPEnable /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient" /v CEIPEnable /t REG_DWORD /d 0 /f

:: Disable Application Impact Telemetry
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v AITEnable /t REG_DWORD /d 0 /f

:: Disable Inventory Collector
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableInventory /t REG_DWORD /d 1 /f

:: Disable Steps Recorder
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableUAR /t REG_DWORD /d 1 /f

:: Disable Windows Error Reporting
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f

echo %GREEN%Telemetry and data collection have been disabled.%WHITE%
pause
goto :MainMenu

:OptimizePerformance
cls
echo %CYAN%Optimizing System Performance...%WHITE%

:: Disable Superfetch
sc stop SysMain
sc config SysMain start= disabled

:: Optimize visual effects for performance
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f

:: Disable Transparency
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f

:: Disable Animations
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f

:: Increase DNS Cache
ipconfig /flushdns
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v CacheHashTableBucketSize /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v CacheHashTableSize /t REG_DWORD /d 384 /f

:: Optimize Boot Performance
bcdedit /set {current} bootmenupolicy Standard

:: Disable Hibernation
powercfg /h off

:: Optimize for performance
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

:: Disable Fast Startup
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f

echo %GREEN%System performance has been optimized.%WHITE%
pause
goto :MainMenu

:DisableMitigations
cls
echo %RED%WARNING: Disabling system mitigations can improve performance but may increase security risks.%WHITE%
echo Are you sure you want to proceed? Type %YELLOW%YES%WHITE% to continue or any other key to abort.
set /p "confirm=>"
if /i not "%confirm%"=="YES" goto :MainMenu

echo %CYAN%Disabling System Mitigations...%WHITE%

powershell -Command "& {ForEach($v in (Get-Command -Name 'Set-ProcessMitigation').Parameters['Disable'].Attributes.ValidValues){Set-ProcessMitigation -System -Disable $v.ToString() -ErrorAction SilentlyContinue}}"
powershell -Command "& {Remove-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\*' -Recurse -ErrorAction SilentlyContinue}"

reg add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v "DisableExternalDMAUnderLock" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Mreg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f

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

:EOF
