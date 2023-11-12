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
set "services_manual=ALG AppIDSvc AppMgmt AppReadiness AppVClient AppXSvc AxInstSV BDESVC BthAvctpSvc BthHFSrv CDPSvc CDPUserSvc_dc2a4 COMSysApp CaptureService_dc2a4 CertPropSvc ClipSVC ConsentUxUserSvc_dc2a4 CoreMessagingRegistrar CredentialEnrollmentManagerUserSvc_dc2a4 CscService DcpSvc DevQueryBroker DeviceAssociationBrokerSvc_dc2a4 DeviceAssociationService DeviceInstall DevicePickerUserSvc_dc2a4 DevicesFlowUserSvc_dc2a4 DiagTrack DialogBlockingService DispBrokerDesktopSvc DisplayEnhancementService DmEnrollmentSvc Dnscache DoSvc DsSvc DsmSvc DusmSvc EFS EapHost EntAppSvc EventSystem FDResPub Fax FontCache FrameServer FrameServerMonitor GraphicsPerfSvc IKEEXT InstallService InventorySvc IpxlatCfgSvc KeyIso KtmRm LanmanServer LanmanWorkstation LicenseManager LxpSvc MSDTC MSiSCSI MapsBroker McpManagementService MessagingService_dc2a4 MicrosoftEdgeElevationService MixedRealityOpenXRSvc MsKeyboardFilter NPSMSvc_dc2a4 NaturalAuthentication NcaSvc NcbService NcdAutoSetup NetSetupSvc Netlogon Netman NgcCtnrSvc NgcSvc NlaSvc OneSyncSvc_dc2a4 P9RdrService_dc2a4 PNRPAutoReg PNRPsvc PcaSvc PeerDistSvc PenService_dc2a4 PerfHost PhoneSvc PimIndexMaintenanceSvc_dc2a4 PlugPlay PolicyAgent PrintNotify PrintWorkflowUserSvc_dc2a4 ProfSvc PushToInstall QWAVE RasAuto RasMan RemoteAccess RemoteRegistry RetailDemo RmSvc RpcLocator SCardSvr SDRSVC SEMgrSvc SENS SNMPTrap SNMPTrap SSDPSRV SamSs ScDeviceEnum SecurityHealthService Sense SensorDataService SensorService SensrSvc SessionEnv SgrmBroker SharedAccess SharedRealitySvc ShellHWDetection SmsRouter Spooler SstpSvc StateRepository StiSvc StorSvc SystemEventsBroker TabletInputService TapiSrv TermService TextInputManagementService Themes TieringEngineService TimeBroker TimeBrokerSvc TokenBroker TrkWks TrustedInstaller UI0Detect UdkUserSvc_dc2a4 UserDataSvc_dc2a4 UserManager UsoSvc VSS VacSvc VaultSvc W32Time WEPHOSTSVC WFDSConMgrSvc WMPNetworkSvc WManSvc WPDBusEnum WSService WaaSMedicSvc WalletService WarpJITSvc WbioSrvc Wcmsvc WcsPlugInService WdNisSvc WdiServiceHost WdiSystemHost WebClient Wecsvc WerSvc WiaRpc WinDefend WinHttpAutoProxySvc Winmgmt WlanSvc WpcMonSvc WpnService WwanSvc XblAuthManager XblGameSave XboxGipSvc XboxNetApiSvc autotimesvc bthserv camsvc cbdhsvc_dc2a4 cloudidsvc dcsvc defragsvc diagnosticshub.standardcollector.service diagsvc dmwappushservice dot3svc edgeupdate edgeupdatem embeddedmode fdPHost fhsvc gpsvc hidserv icssvc iphlpsvc lfsvc lltdsvc lmhosts mpssvc msiserver netprofm nsi p2pimsvc p2psvc perceptionsimulation pla seclogon shpamsvc smphost spectrum sppsvc svsvc swprv tiledatamodelsvc tzautoupdate uhssvc upnphost vds vm3dservice vmicguestinterface vmicheartbeat vmickvpexchange vmicrdv vmicshutdown vmictimesync vmicvmsession vmicvss vmvss wbengine wcncsvc webthreatdefsvc webthreatdefusersvc_dc2a4 wercplsupport wisvc wlidsvc wlpasvc wmiApSrv workfolderssvc wscsvc"
set "services_auto=AudioEndpointBuilder AudioSrv Audiosrv BFE BluetoothUserService_dc2a4 BrokerInfrastructure CryptSvc Dhcp DcomLaunch Dnscache DPS EventLog EventSystem HomeGroupListener HomeGroupProvider HvHost IkeEXT LanmanServer LanmanWorkstation LmHosts LSM MSiSCSI MpsSvc ProfSvc RpcEptMapper SCardSvr Schedule SecurityHealthService Spooler SSDPSRV SamSs SysMain SystemEventsBroker TokenBroker TrkWks TrustedInstaller UI0Detect UserManager VGAuthService VMTools VSS VaultSvc W32Time WebClient WerSvc WinDefend Winmgmt WlanSvc WpnUserService_dc2a4 XblAuthManager XblGameSave XboxGipSvc XboxNetApiSvc WinRM WudfSvc WSearch WaaSMedicSvc"
set "services_disabled=AJRouter AssignedAccessManagerSvc DiagTrack DialogBlockingService RemoteAccess RemoteRegistry UevAgentService ssh-agent"

echo Adjusting Service Settings...
echo Setting Manual Services: 
for %%s in (%services_manual%) do (
    echo Stopping %%s...
    sc stop "%%s"
    echo Configuring %%s to start manually...
    sc config "%%s" start= demand
    echo Successfully set %%s to Manual
)

echo Setting Automatic Services: 
for %%s in (%services_auto%) do (
    echo Stopping %%s...
    sc stop "%%s"
    echo Configuring %%s to start automatically...
    sc config "%%s" start= auto
    echo Successfully set %%s to Automatic
)

echo Setting Disabled Services: 
for %%s in (%services_disabled%) do (
    echo Stopping %%s...
    sc stop "%%s"
    echo Disabling %%s...
    sc config "%%s" start= disabled
    echo Successfully set %%s to Disabled
)
echo All service settings have been successfully adjusted.

REM Disable Telemetry Tasks
echo Disable Telemetry Tasks
for %%t in (
    "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
    "Microsoft\Windows\Application Experience\ProgramDataUpdater"
    "Microsoft\Windows\Autochk\Proxy"
    "Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
    "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
    "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
    "Microsoft\Windows\Feedback\Siuf\DmClient"
    "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
    "Microsoft\Windows\Windows Error Reporting\QueueReporting"
) do schtasks /Change /TN "%%t" /Disable

REM Disable Telemetry via Registry
echo Disable Telemetry via Registry
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v ContentDeliveryAllowed /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OemPreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEnabled /t REG_DWORD /d 0 /f

REM Change boot menu policy to Legacy
echo Changing boot menu policy to Legacy mode...
bcdedit /set {current} bootmenupolicy Legacy
echo Boot menu policy has been successfully changed to Legacy mode.

REM Check Windows build version
echo Check Windows build version
for /f "tokens=3" %%i in ('ver') do set "version=%%i"
set "version=!version:~1,-1!"
if !version! lss 22557 (
    start "" taskmgr.exe
    :wait
    timeout /t 3 >nul
    tasklist /FI "IMAGENAME eq taskmgr.exe" | find /i "taskmgr.exe" >nul && (taskkill /f /im taskmgr.exe && goto :wait)
)

:continue

REM Disable Wi-Fi Sense
echo Disable Wi-Fi Sense
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v Value /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v Value /t REG_DWORD /d 0 /f

REM Disable Activity Feed
echo Disable Activity Feed
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities /t REG_DWORD /d 0 /f

REM Delete Temporary Files
echo Delete Temporary Files
rd /s /q C:\Windows\Temp rd /s /q %TEMP%
rd /s /q C:\Windows\Prefetch del /q /s /f “%LocalAppData%\Microsoft\Windows\INetCache*.*” > nul rd /s /q %LocalAppData%\Microsoft\Windows\INetCache rd /s /q %SystemDrive%$Recycle.Bin

REM Deny location access
echo Deny location access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v Value /t REG_SZ /d "Deny" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v SensorPermissionState /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v Status /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\Maps" /v AutoUpdateEnabled /t REG_DWORD /d 0 /f

REM Stop HomeGroup Services
echo Stop HomeGroup Services
net stop "HomeGroupListener"
net stop "HomeGroupProvider"
sc config HomeGroupListener start= demand
sc config HomeGroupProvider start= demand
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup" /v "DisableHomeGroup" /t REG_DWORD /d 1 /f

REM Disable Storage Sense
echo Disable Storage Sense
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "StorageSenseGlobal" /t REG_DWORD /d 0 /f

REM Disable Hibernate
echo Disable Hibernate
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HibernateEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowHibernateOption" /t REG_DWORD /d 0 /f
powercfg.exe /hibernate off

REM Disable GameDVR
echo Disable GameDVR
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f

REM Disable Power Throttling
echo Disable Power Throttling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d 0 /f

REM Change Keyboard Indicator Behavior
echo Change Keyboard Indicator Behavior
reg add "HKU\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_DWORD /d 0 /f

REM Show File Extensions
echo Show File Extensions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f

REM Disable User Account Control (UAC)
echo Disable User Account Control
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f

REM Disable Cortana
echo Disable Cortana
powershell -Command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"

echo All tweaks have been successfully applied! For the changes to take effect, please restart your computer.
echo Press ENTER to return to the main menu.
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
