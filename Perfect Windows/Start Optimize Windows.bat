@echo off
cd /d "%~dp0"
chcp 65001 >nul 2>&1
mode con lines=24 cols=106
setlocal enabledelayedexpansion
title Perfect Windows
call :Colors

REM Check for Administrator Privileges
whoami /groups | findstr /i /c:"S-1-16-12288" >nul
if %errorlevel% neq 0 (
    echo %BRIGHT_BLACK%To continue, run this tool as %DARK_RED%administrator%DARK_WHITE%.
    pause
    exit
)

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
for /f "tokens=1,2,* delims=_ " %%A in ('"findstr /b /c:":Menu_" "%~f0""') do (
    echo  !BRIGHT_BLUE!%%B !WHITE!%%C
)
echo.
set "choice="
set /p choice=%DARK_WHITE%Choose an option to continue: !BRIGHT_BLUE!
if not defined choice goto :Main-Menu
call :Menu_[%choice%] 2>nul || (echo %BRIGHT_BLACK%Invalid choice, please try again.%DARK_WHITE% & pause)
goto :Main-Menu

REM Option 1: Perfect Windows
:Menu_[1] Run Perfect Windows

REM Services
set "services_manual=ALG AppIDSvc Appinfo AppMgmt AppVClient AppXSvc AxInstSV BDESVC BFE BITS BluetoothUserService_dc2a4 BcastDVRUserService_dc2a4 BluetoothUserService_dc2a4 Browser CDPUserSvc_dc2a4 COMSysApp CaptureService_dc2a4 CertPropSvc ClipSVC ConsentUxUserSvc_dc2a4 CoreMessagingRegistrar CredentialEnrollmentManagerUserSvc_dc2a4 CryptSvc CscService DcomLaunch DcpSvc DevQueryBroker DeviceAssociationBrokerSvc_dc2a4 DeviceAssociationService DeviceInstall DevicePickerUserSvc_dc2a4 DevicesFlowUserSvc_dc2a4 Dhcp DiagTrack DialogBlockingService DispBrokerDesktopSvc DisplayEnhancementService DmEnrollmentSvc Dnscache DoSvc DsSvc DsmSvc DusmSvc EFS EapHost EntAppSvc EventLog EventSystem FDResPub Fax FontCache FrameServer FrameServerMonitor GraphicsPerfSvc HomeGroupListener HomeGroupProvider HvHost IEEtwCollectorService IKEEXT InstallService InventorySvc IpxlatCfgSvc KeyIso KtmRm LSM LanmanServer LanmanWorkstation LicenseManager LxpSvc MSDTC MSiSCSI MapsBroker McpManagementService MessagingService_dc2a4 MicrosoftEdgeElevationService MixedRealityOpenXRSvc MpsSvc MsKeyboardFilter NPSMSvc_dc2a4 NaturalAuthentication NcaSvc NcbService NcdAutoSetup NetSetupSvc NetTcpPortSharing Netlogon Netman NgcCtnrSvc NgcSvc NlaSvc OneSyncSvc P9RdrService_dc2a4 PNRPAutoReg PNRPsvc PcaSvc PeerDistSvc PenService_dc2a4 PerfHost PhoneSvc PimIndexMaintenanceSvc_dc2a4 PlugPlay PolicyAgent Power PrintNotify PrintWorkflowUserSvc_dc2a4 ProfSvc PushToInstall QWAVE RasAuto RasMan RemoteAccess RemoteRegistry RetailDemo RmSvc RpcEptMapper RpcLocator RpcSs SCPolicySvc SCardSvr SDRSVC SEMgrSvc SENS SNMPTRAP SNMPTrap SSDPSRV SamSs ScDeviceEnum Schedule SecurityHealthService Sense SensorDataService SensorService SensrSvc SessionEnv SgrmBroker SharedAccess SharedRealitySvc ShellHWDetection SmsRouter Spooler SstpSvc StateRepository StiSvc StorSvc SysMain SystemEventsBroker TabletInputService TapiSrv TextInputManagementService Themes TieringEngineService TimeBroker TimeBrokerSvc TokenBroker TrkWks TroubleshootingSvc TrustedInstaller UI0Detect UdkUserSvc_dc2a4 UevAgentService UmRdpService UnistoreSvc_dc2a4 UserDataSvc_dc2a4 UserManager UsoSvc VGAuthService VMTools VSS VacSvc VaultSvc W32Time WEPHOSTSVC WFDSConMgrSvc WMPNetworkSvc WManSvc WPDBusEnum WSService WSearch WaaSMedicSvc WalletService WarpJITSvc WbioSrvc Wcmsvc WcsPlugInService WdiServiceHost WdiSystemHost WebClient Wecsvc WerSvc WiaRpc WinDefend WinHttpAutoProxySvc WinRM Winmgmt WlanSvc WpcMonSvc WpnService WpnUserService_dc2a4 WwanSvc XblAuthManager XblGameSave XboxGipSvc XboxNetApiSvc autotimesvc bthserv camsvc cbdhsvc_dc2a4 cloudidsvc dcsvc defragsvc diagnosticshub.standardcollector.service diagsvc dmwappushservice dot3svc edgeupdate edgeupdatem embeddedmode fdPHost fhsvc gpsvc hidserv icssvc iphlpsvc lfsvc lltdsvc lmhosts mpssvc msiserver netprofm nsi p2pimsvc p2psvc perceptionsimulation pla seclogon shpamsvc smphost spectrum sppsvc ssh-agent svsvc swprv tiledatamodelsvc tzautoupdate uhssvc upnphost vds vm3dservice vmicguestinterface vmicheartbeat vmickvpexchange vmicrdv vmicshutdown vmictimesync vmicvmsession vmicvss vmvss wbengine wcncsvc webthreatdefsvc webthreatdefusersvc_dc2a4 wercplsupport wisvc wlidsvc wlpasvc wmiApSrv workfolderssvc wscsvc wuauserv wudfsvc"
set "services_auto=BFE BITS BrokerInfrastructure CryptSvc DcomLaunch Dhcp DPS EventLog EventSystem LanmanServer LanmanWorkstation MSMQ Netlogon ProfSvc RpcEptMapper RpcLocator RpcSs SamSs SENS SysMain Themes UserManager Windows Time WinDefend Winmgmt WinRM"
set "services_disabled=AJRouter AppVClient AssignedAccessManagerSvc DiagTrack DialogBlockingService MicrosoftEdgeElevationService RemoteAccess RemoteRegistry RetailDemo UevAgentService autotimesvc ssh-agent"

echo !BRIGHT_WHITE!Adjusting Service Settings...
echo !BRIGHT_WHITE!Setting Manual Services: 
for %%s in (%services_manual%) do (
    echo !DARK_YELLOW!Configuring %%s to start manually...
    sc config "%%s" start= demand
    echo Successfully set %%s to Manual
)
echo !BRIGHT_WHITE!Setting Automatic Services: 
for %%s in (%services_auto%) do (
    echo !DARK_BLUE!Stopping %%s...
    sc stop "%%s"
    echo Configuring %%s to start automatically...
    sc config "%%s" start= auto
    echo Successfully set %%s to Automatic
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
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v GPU Priority /t REG_DWORD /d "8" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d "6" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Scheduling Category /t REG_SZ /d "High" /f

REM Change boot menu policy to Legacy
echo !BRIGHT_WHITE!Changing boot menu policy to Legacy mode...
bcdedit /set {current} bootmenupolicy Legacy
echo !BRIGHT_WHITE!Boot menu policy has been successfully changed to Legacy mode.

REM Check Windows version before executing additional commands
echo !BRIGHT_WHITE!Check Windows version before executing additional commands...
ver | find "Version 10.0." > nul
if errorlevel 1 goto :eof

REM Modify Task Manager settings for Windows versions older than 22557
echo !BRIGHT_WHITE!Modify Task Manager settings for Windows versions older than 22557...
set taskmgr=""
for /f "tokens=2 delims= " %%v in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\TaskManager" /v Preferences ^| find Preferences') do set taskmgr=%%v
if %taskmgr% lss 22557 (
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
for /f "tokens=1,2,*" %%a in ('wmic memorychip get capacity ^| find /i " " ^| find "."') do set ram=%%c
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
rd /s /q C:\Windows\Temp rd /s /q %TEMP%
rd /s /q C:\Windows\Prefetch del /q /s /f “%LocalAppData%\Microsoft\Windows\INetCache*.*” > nul rd /s /q %LocalAppData%\Microsoft\Windows\INetCache rd /s /q %SystemDrive%$Recycle.Bin

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

cls
echo !BRIGHT_WHITE!All tweaks have been successfully applied! For the changes to take effect, please restart your computer.
echo Press !DARK_MAGENTA!ENTER !BRIGHT_WHITE!to return to the main menu.
pause >nul
cls
goto :Main-Menu

REM Option 2: Info
:Menu_[2] Information
cls
echo.
echo %BRIGHT_BLUE%Welcome to Perfect Windows!
echo.
echo %WHITE%Perfect Windows is a meticulously tool that aims to enhance your Windows performance and security.
echo %WHITE%It achieves this by fine-tuning various system parameters to optimize your system's settings.
echo.
echo %DARK_RED%Please note: While we strive to ensure the highest quality, use of this tool is at your own discretion.
echo %DARK_RED%Always ensure you have a backup of your system.
echo.
echo %BRIGHT_BLUE%Stay Connected:
echo %WHITE%Follow us on Twitter for updates and more: @Jisllos
echo %WHITE%Contribute or report issues on GitHub: https://github.com/Jisllos/Perfect-Windows
echo.
pause
goto :Main-Menu

REM Option 3: Exit
:Menu_[E] Exit
exit

:Colors
for /f "tokens=2 delims==" %%I in ('"wmic os get OSLanguage /value"') do set /a "lang=%%I"
if %lang% neq 1031 exit /b

REM Colors Definitions
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
