@echo off
cd /d "%~dp0"
chcp 65001 >nul 2>&1
mode con lines=30 cols=136
setlocal enabledelayedexpansion
title Perfect Windows
call :Colors

REM Check for Administrator Privileges
whoami /groups | findstr /i /c:"S-1-16-12288" >nul 2>&1 || (echo %BRIGHT_BLACK%To continue, run this tool as %DARK_RED%administrator%DARK_WHITE%. && pause && exit)

REM Main Menu
:Main-Menu
cls
echo.
echo  %WHITE%███████%BRIGHT_RED%╗ %WHITE%██████%BRIGHT_RED%╗%WHITE%██████%BRIGHT_RED%╗ %WHITE%██%BRIGHT_RED%╗%WHITE%██████%BRIGHT_RED%╗ %WHITE%████████%BRIGHT_RED%╗    %WHITE%██████%BRIGHT_BLUE%╗ %WHITE%██%BRIGHT_BLUE%╗   %WHITE%██%BRIGHT_BLUE%╗         %WHITE%██%BRIGHT_CYAN%╗%WHITE%██%BRIGHT_CYAN%╗%WHITE%███████%BRIGHT_CYAN%╗%WHITE%██%BRIGHT_CYAN%╗     %WHITE%██%BRIGHT_CYAN%╗     
echo  %WHITE%██%BRIGHT_RED%╔════╝%WHITE%██%BRIGHT_RED%╔════╝%WHITE%██%BRIGHT_RED%╔══%WHITE%██%BRIGHT_RED%╗%WHITE%██%BRIGHT_RED%║%WHITE%██%BRIGHT_RED%╔══%WHITE%██%BRIGHT_RED%╗╚══%WHITE%██%BRIGHT_RED%╔══╝    %WHITE%██%BRIGHT_BLUE%╔══%WHITE%██%BRIGHT_BLUE%╗╚%WHITE%██%BRIGHT_BLUE%╗ %WHITE%██%BRIGHT_BLUE%╔╝         %WHITE%██%BRIGHT_CYAN%║%WHITE%██%BRIGHT_CYAN%║%WHITE%██%BRIGHT_CYAN%╔════╝%WHITE%██%BRIGHT_CYAN%║     %WHITE%██%BRIGHT_CYAN%║     
echo  %WHITE%███████%BRIGHT_RED%╗%WHITE%██%BRIGHT_RED%║     %WHITE%██████%BRIGHT_RED%╔╝%WHITE%██%BRIGHT_RED%║%WHITE%██████%BRIGHT_RED%╔╝   %WHITE%██%BRIGHT_RED%║       %WHITE%██████%BRIGHT_BLUE%╔╝ ╚%WHITE%████%BRIGHT_BLUE%╔╝          %WHITE%██%BRIGHT_CYAN%║%WHITE%██%BRIGHT_CYAN%║%WHITE%███████%BRIGHT_CYAN%╗%WHITE%██%BRIGHT_CYAN%║     %WHITE%██%BRIGHT_CYAN%║     
echo  %BRIGHT_RED%╚════%WHITE%██%BRIGHT_RED%║%WHITE%██%BRIGHT_RED%║     %WHITE%██%BRIGHT_RED%╔══%WHITE%██%BRIGHT_RED%╗%WHITE%██%BRIGHT_RED%║%WHITE%██%BRIGHT_RED%╔═══╝    %WHITE%██%BRIGHT_RED%║       %WHITE%██%BRIGHT_BLUE%╔══%WHITE%██%BRIGHT_BLUE%╗  ╚%WHITE%██%BRIGHT_BLUE%╔╝      %WHITE%██   %WHITE%██%BRIGHT_CYAN%║%WHITE%██%BRIGHT_CYAN%║%BRIGHT_CYAN%╚════%WHITE%██%BRIGHT_CYAN%║%WHITE%██%BRIGHT_CYAN%║     %WHITE%██%BRIGHT_CYAN%║     
echo  %WHITE%███████%BRIGHT_RED%║%BRIGHT_RED%╚%WHITE%██████%BRIGHT_RED%╗%WHITE%██%BRIGHT_RED%║  %WHITE%██%BRIGHT_RED%║%WHITE%██%BRIGHT_RED%║%WHITE%██%BRIGHT_RED%║        %WHITE%██%BRIGHT_RED%║       %WHITE%██████%BRIGHT_BLUE%╔╝   %WHITE%██%BRIGHT_BLUE%║       %BRIGHT_CYAN%╚%WHITE%█████%BRIGHT_CYAN%╔╝%WHITE%██%BRIGHT_CYAN%║%WHITE%███████%BRIGHT_CYAN%║%WHITE%███████%BRIGHT_CYAN%╗%WHITE%███████%BRIGHT_CYAN%╗
echo  %BRIGHT_RED%╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝       %BRIGHT_BLUE%╚═════╝    ╚═╝        %BRIGHT_CYAN%╚════╝ ╚═╝╚══════╝╚══════╝╚══════╝                                                                                                                                                                                                                                                                                                             
echo ══════════════════════════════════════════════════════════════
echo.                                              %BRIGHT_BLACK%Twitter @Jisllos%WHITE%
echo  %BRIGHT_BLUE%1%BRIGHT_WHITE%: Run Perfect Windows
echo  %BRIGHT_BLUE%2%BRIGHT_WHITE%: Information
echo  %BRIGHT_RED%E%BRIGHT_WHITE%: Exit
echo.
set "choice="
set /p choice=%DARK_WHITE%Choose an option to continue: !BRIGHT_BLUE!
if not defined choice goto :Main-Menu
if "%choice%"=="1" goto Menu_1
if "%choice%"=="2" goto Menu_2
if /I "%choice%"=="E" goto Menu_E
echo %BRIGHT_BLACK%Invalid choice, please try again.%DARK_WHITE%
pause
goto :Main-Menu

REM Option 1: Perfect Windows
:Menu_1
REM Services
set services_auto=AudioEndpointBuilder Audiosrv BITS BFE BluetoothUserService_dc2a4 BrokerInfrastructure Browser BthAvctpSvc BthHFSrv CaptureService_dc2a4 CDPUserSvc_dc2a4 COMSysApp CoreMessagingRegistrar CredentialEnrollmentManagerUserSvc_dc2a4 CryptSvc DPS Dhcp Dnscache DoSvc DsmSvc DusmSvc EapHost EventLog EventSystem FrameServer GraphicsPerfSvc HvHost IKEEXT LanmanServer LanmanWorkstation LicenseManager MMCSS MpsSvc NaturalAuthentication NgcCtnrSvc NgcSvc NlaSvc OneSyncSvc_dc2a4 ProfSvc Power PrintWorkflowUserSvc_dc2a4 RasAuto RasMan RemoteRegistry RpcEptMapper RpcLocator RpcSs SamSs Schedule SecurityHealthService SENS ShellHWDetection Spooler SSDPSRV SysMain TabletInputService Themes UsoSvc VGAuthService VMTools VSS WebClient WdiServiceHost WinDefend WlanSvc WpnUserService_dc2a4 XblAuthManager XboxNetApiSvc bthserv gpsvc iphlpsvc mpssvc nsi p2psvc perceptionsimulation sppsvc svsvc tzautoupdate vds webthreatdefusersvc_dc2a4 wscsvc
set services_disabled=AJRouter AppVClient DiagTrack DialogBlockingService DistributedLinkTrackingService EdgeUpdate edgeupdatem embeddedmode hidserv shpamsvc spectrum ssh-agent uhssvc wercplsupport webthreatdefsvc wuauserv
set services_autodelay=BITS DoSvc WSearch wscsvc

echo !BRIGHT_WHITE!Adjusting Service Settings...
echo !BRIGHT_WHITE!Setting All Services to Manual: 
for /f "tokens=1,2" %%a in ('sc query state^= all ^| find "SERVICE_NAME:"') do (
    echo !DARK_YELLOW!Configuring %%b to start manually...
    sc config "%%b" start= demand
    echo Successfully set %%b to Manual
)

echo !BRIGHT_WHITE!Setting Important Services to Automatic: 
for %%s in (%services_auto%) do (
    echo !DARK_BLUE!Configuring %%s to start automatically...
    sc config "%%s" start= auto
    echo Successfully set %%s to Automatic
)

echo !BRIGHT_WHITE!Setting AutomaticDelayedStart Services: 
for %%s in (%services_autodelay%) do (
    echo !DARK_GREEN!Configuring %%s to start automatically with delay...
    sc config "%%s" start= delayed-auto
    echo Successfully set %%s to AutomaticDelayedStart
)

echo !BRIGHT_WHITE!Setting Disabled Services: 
for %%s in (%services_disabled%) do (
    echo !DARK_RED!Disabling %%s...
    sc config "%%s" start= disabled
    echo Successfully set %%s to Disabled
)
echo !BRIGHT_WHITE!All service settings have been successfully adjusted.

REM Disable Scheduled Tasks
echo !BRIGHT_WHITE!Disable Scheduled Tasks
schtasks /change /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable
schtasks /change /tn "Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable
schtasks /change /tn "Microsoft\Windows\Autochk\Proxy" /disable
schtasks /change /tn "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable
schtasks /change /tn "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable
schtasks /change /tn "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
schtasks /change /tn "Microsoft\Windows\Feedback\Siuf\DmClient" /disable
schtasks /change /tn "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /disable
schtasks /change /tn "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable
schtasks /change /tn "Microsoft\Windows\Application Experience\MareBackup" /disable
schtasks /change /tn "Microsoft\Windows\Application Experience\StartupAppTask" /disable
schtasks /change /tn "Microsoft\Windows\Application Experience\PcaPatchDbTask" /disable
schtasks /change /tn "Microsoft\Windows\Maps\MapsUpdateTask" /disable

REM Disable Telemetry via Registry
echo !BRIGHT_WHITE!Disable Telemetry via Registry
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v ContentDeliveryAllowed /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OemPreInstalledAppsEnabled /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEnabled /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEverEnabled /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338387Enabled /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353698Enabled /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableTailoredExperiencesWithDiagnosticData /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v EnthusiastMode /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v LongPathsEnabled /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d "4294967295" /f
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_DWORD /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Services\Ndu" /v Start /t REG_DWORD /d "2" /f
reg add "HKCU\Control Panel\Mouse" /v MouseHoverTime /t REG_SZ /d "400" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v IRPStackSize /t REG_DWORD /d "30" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d "2" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d "6" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f

REM Change boot menu policy to Legacy
echo !BRIGHT_WHITE!Changing boot menu policy to Legacy mode...
bcdedit /set {current} bootmenupolicy Legacy
echo !BRIGHT_WHITE!Boot menu policy has been successfully changed to Legacy mode.

REM Check Windows version before executing additional commands
echo !BRIGHT_WHITE!Check Windows version before executing additional commands...
ver | find "Version 10.0." > nul
if errorlevel 1 goto continue

REM Modify Task Manager settings for Windows versions older than 22557
echo !BRIGHT_WHITE!Modify Task Manager settings for Windows versions older than 22557...
for /f "tokens=4-5 delims=[]. " %%i in ('ver') do set "winver=%%i.%%j"
if "%winver%" lss "22557" (
    start "" /min taskmgr.exe
    :loop
    ping -n 1 127.0.0.1 > nul
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\TaskManager" /v Preferences > nul 2>&1
    if %errorlevel% equ 0 (
        taskkill /f /im taskmgr.exe
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\TaskManager" /v Preferences /t REG_BINARY /d 0 /f
    ) else (
        goto loop
    )
)

REM Group svchost.exe processes
echo !BRIGHT_WHITE!Group svchost.exe processes...
for /f "skip=1 tokens=1" %%a in ('wmic computersystem get totalphysicalmemory') do set "ram=%%a"
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d %ram% /f

REM Delete AutoLogger-Diagtrack-Listener.etl and deny permissions
echo !BRIGHT_WHITE!Delete AutoLogger-Diagtrack-Listener.etl and deny permissions...
set "autoLoggerDir=%PROGRAMDATA%\Microsoft\Diagnosis\ETLLogs\AutoLogger"
if exist "%autoLoggerDir%\AutoLogger-Diagtrack-Listener.etl" (
    del "%autoLoggerDir%\AutoLogger-Diagtrack-Listener.etl"
)
icacls "%autoLoggerDir%" /deny SYSTEM:(OI)(CI)F
:continue

REM Disable Wi-Fi Sense
echo !BRIGHT_WHITE!Disable Wi-Fi Sense
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v Value /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v Value /t REG_DWORD /d 0 /f

REM Disable Activity Feed
echo !BRIGHT_WHITE!Disable Activity Feed
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities /t REG_DWORD /d 0 /f

REM Delete Temporary Files
echo !BRIGHT_WHITE!Delete Temporary Files
rd /s /q C:\Windows\Temp
rd /s /q %TEMP%
rd /s /q C:\Windows\Prefetch
del /q /s /f "%LocalAppData%\Microsoft\Windows\INetCache\*.*" > nul
rd /s /q %LocalAppData%\Microsoft\Windows\INetCache
rd /s /q %SystemDrive%\$Recycle.Bin
net stop wuauserv
rd /s /q C:\Windows\SoftwareDistribution
net start wuauserv
for /F "tokens=*" %%G in ('wevtutil el') do (wevtutil cl "%%G")
rd /s /q C:\ProgramData\Microsoft\Windows\WER\ReportQueue
rd /s /q C:\ProgramData\Microsoft\Windows\WER\ReportArchive
rd /s /q C:\Windows.old
rd /s /q "%LocalAppData%\DirectX Shader Cache"
del /f /s /q /a "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db"

REM Deny location access
echo !BRIGHT_WHITE!Deny location access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v Value /t REG_SZ /d "Deny" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v SensorPermissionState /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v Status /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\Maps" /v AutoUpdateEnabled /t REG_DWORD /d 0 /f

REM Stop HomeGroup Services
echo !BRIGHT_WHITE!Stop HomeGroup Services
net stop "HomeGroupListener"
net stop "HomeGroupProvider"
sc config HomeGroupListener start= demand
sc config HomeGroupProvider start= demand
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup" /v DisableHomeGroup /t REG_DWORD /d 1 /f

REM Disable Storage Sense
echo !BRIGHT_WHITE!Disable Storage Sense
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /f

REM Disable Hibernate
echo !BRIGHT_WHITE!Disable Hibernate
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HibernateEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v ShowHibernateOption /t REG_DWORD /d 0 /f
powercfg.exe /hibernate off

REM Disable GameDVR
echo !BRIGHT_WHITE!Disable GameDVR
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_DXGIHonorFSEWindowsCompatible /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_EFSEFeatureFlags /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f

REM Disable Telemetry
echo !BRIGHT_WHITE!Disable Telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

REM Disable Compatibility Telemetry
echo !BRIGHT_WHITE!Disable Compatibility Telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

REM Disable Advertising ID
echo !BRIGHT_WHITE!Disable Advertising ID...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f

REM Disable Wi-Fi Sense
echo !BRIGHT_WHITE!Disable Wi-Fi Sense...
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v Value /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v Value /t REG_DWORD /d 0 /f

REM Disable Diagnostic Data
echo !BRIGHT_WHITE!Disable Diagnostic Data...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v MaxTelemetryAllowed /t REG_DWORD /d 0 /f

REM Disable Handwriting Data Sharing
echo !BRIGHT_WHITE!Disable Handwriting Data Sharing...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v PreventHandwritingErrorReports /t REG_DWORD /d 1 /f

REM Disable Windows Hello Biometrics
echo !BRIGHT_WHITE!Disable Windows Hello Biometrics...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Biometrics" /v Enabled /t REG_DWORD /d 0 /f

REM Disable Timeline Function
echo !BRIGHT_WHITE!Disable Timeline Function...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed /t REG_DWORD /d 0 /f

REM Disable Location Tracking
echo !BRIGHT_WHITE!Disable Location Tracking...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /t REG_DWORD /d 1 /f

REM Disable Feedback Notifications
echo !BRIGHT_WHITE!Disable Feedback Notifications...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f

REM Disable Windows Tips
echo !BRIGHT_WHITE!Disable Windows Tips...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f

REM Disable Lock Screen Ads
echo !BRIGHT_WHITE!Disable Lock Screen Ads...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreenCamera /t REG_DWORD /d 1 /f

REM Disable Automatic Installation of Apps
echo !BRIGHT_WHITE!Disable Automatic Installation of Apps...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f

REM Disable Start Menu App Suggestions
echo !BRIGHT_WHITE!Disable Start Menu App Suggestions...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f

REM Disable Setting App Ads
echo !BRIGHT_WHITE!Disable Setting App Ads...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled /t REG_DWORD /d 0 /f

REM Disable Customer Experience Improvement Program
echo !BRIGHT_WHITE!Disable Customer Experience Improvement Program...
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v CEIPEnable /t REG_DWORD /d 0 /f

REM Disable Help Experience Program
echo !BRIGHT_WHITE!Disable Help Experience Program...
reg add "HKLM\SOFTWARE\Policies\Assist" /v NoImplicitFeedback /t REG_DWORD /d 1 /f

REM Disable Experimental Features
echo !BRIGHT_WHITE!Disable Experimental Features...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\FlightSettings" /v UserPreferredRedirectStage /t REG_DWORD /d 0 /f

REM Disable Inventory Collector
echo !BRIGHT_WHITE!Disable Inventory Collector...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

REM Disable Get More Out of Windows
echo !BRIGHT_WHITE!Disable Get More Out of Windows...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353698Enabled /t REG_DWORD /d 0 /f

cls
echo Are you sure you want to disable system mitigations? 
echo This can improve performance but also increases security risks.
echo.
echo !BRIGHT_GREEN!Positive: Improved system performance.
echo !BRIGHT_RED!Negative: Increased vulnerability to security threats.!BRIGHT_WHITE!
echo.
echo Please type !BRIGHT_MAGENTA!YES !BRIGHT_WHITE!to continue or any other key to abort.
set /p UserInput="Enter your choice: "
if /I "%UserInput%"=="YES" (
    echo !BRIGHT_WHITE!Disabling Mitigations...
    call :DisableMitigations
    echo !BRIGHT_WHITE!Mitigations have been disabled.
) else (
    echo !BRIGHT_RED!Operation aborted.
)
pause
cls
echo !BRIGHT_WHITE!All tweaks have been successfully applied! For the changes to take effect, please restart your computer.
echo Press !BRIGHT_MAGENTA!ENTER !BRIGHT_WHITE!to return to the main menu.
pause >nul
cls
goto :Main-Menu

:DisableMitigations
    powershell -Command "& {ForEach($v in (Get-Command -Name 'Set-ProcessMitigation').Parameters['Disable'].Attributes.ValidValues){Set-ProcessMitigation -System -Disable $v.ToString() -ErrorAction SilentlyContinue}}"
    powershell -Command "& {Remove-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\*' -Recurse -ErrorAction SilentlyContinue}"
    call :UpdateRegistry
    goto :eof

:UpdateRegistry
    reg add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v "DisableExternalDMAUnderLock" /t REG_DWORD /d "0" /f
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired" /t REG_DWORD /d "0" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "1" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "0" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
    pause
    goto :eof

REM Option 2: Information
:Menu_2
cls
echo.
echo %BRIGHT_BLUE%Welcome to Perfect Windows - Your Ultimate Performance Enhancer!
echo.
echo %WHITE%Perfect Windows is a meticulously crafted tool, designed with the sole aim of elevating your Windows experience to new heights.
echo %WHITE%It does so by fine-tuning various system parameters, optimizing your system's settings to deliver peak performance and robust security.
echo.
echo %DARK_RED%Disclaimer: We strive to ensure the highest quality and reliability. However, the use of this tool is at your own discretion.
echo %DARK_RED%We strongly recommend maintaining a backup of your system for safety.
echo.
echo %BRIGHT_BLUE%Stay Connected:
echo %WHITE%For updates, insights and more, follow us on Twitter: @Jisllos
echo %WHITE%To contribute or report issues, visit our GitHub page: https://github.com/Jisll/windows11
echo.
pause
goto :Main-Menu

REM Option E: Exit
:Menu_E
exit

REM Colors
:Colors
set "DARK_BLACK=[30m"
set "DARK_RED=[31m"
set "DARK_GREEN=[32m"
set "DARK_YELLOW=[33m"
set "DARK_BLUE=[34m"
set "DARK_MAGENTA=[35m"
set "DARK_CYAN=[36m"
set "DARK_WHITE=[37m"
set "BRIGHT_BLACK=[90m"
set "BRIGHT_RED=[91m"
set "BRIGHT_GREEN=[92m"
set "BRIGHT_YELLOW=[93m"
set "BRIGHT_BLUE=[94m"
set "BRIGHT_MAGENTA=[95m"
set "BRIGHT_CYAN=[96m"
set "BRIGHT_WHITE=[97m"
set "WHITE=[97m"
exit /b
