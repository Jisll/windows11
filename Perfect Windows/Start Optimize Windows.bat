@echo off
cd /d "%~dp0"
chcp 65001 >nul 2>&1
mode con lines=24 cols=132
setlocal enabledelayedexpansion
title Perfect Windows
color 0F
call :Colors

REM Check for Windows 10 Compatibility
:Compatibility-Check
ver | find "10" >nul 2>&1
if not %errorlevel% == 0 (
    echo %BRIGHT_BLACK%Sorry, your system is not compatible with this tool%DARK_WHITE%
    pause
    exit
)

REM Check for Administrator Privileges
:Privileges-Check
openfiles 1>nul 2>&1
if not %errorlevel% == 0 (
    echo %BRIGHT_BLACK%To continue run this tool as %DARK_RED%administrator%DARK_WHITE%
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
echo.
echo.
echo ══════════════════════════════════════════════════════════════
echo.                                            %BRIGHT_BLACK%Twitter @Jisllos%WHITE%
for /f "tokens=1,2,* delims=_ " %%A in ('"findstr /b /c:":Menu_" "%~f0""') do (
    echo  !BRIGHT_GREEN!%%B !WHITE!%%C
)
echo.
set "choice="
set /p choice=%DARK_WHITE%Choose an option to continue: %DARK_GREEN%
if not defined choice (
    echo %BRIGHT_BLACK%Invalid choice, please try again.%DARK_WHITE%
    pause
    goto :Main-Menu
)
color 0F
call:Menu_[%choice%]
goto :Main-Menu

REM Option 1: Custom Tweaks
:Menu_[1] Run Perfect Windows
cls 
REM Details about what this option does...
@echo off
setlocal EnableDelayedExpansion
echo.
echo.
echo    ____        _      __    ___            ___      ____
echo   / __/_______(_)__  / /_  / _ )__ __  __ / (_)__  / / /
echo  _\ \/ __/ __/ / _ \/ __/ / _  / // / / // / (_- // / /
echo /___/\__/_/ /_/ .__/\__/ /____/\_, /  \___/_/__ /_ /_/  
echo              /_/              /___/                    
echo.
echo.

REM Services
set "services_manual=ALG AppIDSvc AppMgmt AppReadiness AppXSvc Appinfo AxInstSV BDESVC BITS BTAGService BcastDVRUserService_dc2a4 BluetoothUserService_dc2a4 Browser CDPSvc COMSysApp CaptureService_dc2a4 CertPropSvc ClipSVC ConsentUxUserSvc_dc2a4 CredentialEnrollmentManagerUserSvc_dc2a4 CscService DcpSvc DevQueryBroker DeviceAssociationBrokerSvc_dc2a4 DeviceAssociationService DeviceInstall DevicePickerUserSvc_dc2a4 DevicesFlowUserSvc_dc2a4 DisplayEnhancementService DmEnrollmentSvc DoSvc DsSvc DsmSvc EFS EapHost EntAppSvc FDResPub Fax FrameServer FrameServerMonitor GraphicsPerfSvc HomeGroupListener HomeGroupProvider HvHost IEEtwCollectorService IKEEXT InstallService InventorySvc IpxlatCfgSvc KtmRm LicenseManager LxpSvc MSDTC MSiSCSI MapsBroker McpManagementService MessagingService_dc2a4 MicrosoftEdgeElevationService MixedRealityOpenXRSvc NPSMSvc_dc2a4 NaturalAuthentication NcaSvc NcbService NcdAutoSetup NetSetupSvc Netlogon Netman NgcCtnrSvc NgcSvc NlaSvc P9RdrService_dc2a4 PNRPAutoReg PNRPsvc PcaSvc PeerDistSvc PenService_dc2a4 PerfHost PhoneSvc PimIndexMaintenanceSvc_dc2a4 PlugPlay PolicyAgent PrintNotify PrintWorkflowUserSvc_dc2a4 PushToInstall QWAVE RasAuto RasMan RetailDemo RmSvc RpcLocator SCPolicySvc SCardSvr SDRSVC SEMgrSvc SNMPTRAP SNMPTrap SSDPSRV ScDeviceEnum SecurityHealthService Sense SensorDataService SensorService SensrSvc SessionEnv SharedAccess SharedRealitySvc SmsRouter SstpSvc StateRepository StiSvc StorSvc TabletInputService TapiSrv TextInputManagementService TieringEngineService TimeBroker TimeBrokerSvc TokenBroker TroubleshootingSvc TrustedInstaller UI0Detect UdkUserSvc_dc2a4 UmRdpService UnistoreSvc_dc2a4 UserDataSvc_dc2a4 UsoSvc VSS VacSvc W32Time WEPHOSTSVC WFDSConMgrSvc WMPNetworkSvc WManSvc WPDBusEnum WSService WSearch WaaSMedicSvc WalletService WarpJITSvc WbioSrvc WcsPlugInService WdNisSvc WdiServiceHost WdiSystemHost WebClient Wecsvc WerSvc WiaRpc WinHttpAutoProxySvc WinRM WpcMonSvc WpnService WwanSvc XblAuthManager XblGameSave XboxGipSvc XboxNetApiSvc autotimesvc bthserv camsvc cbdhsvc_dc2a4 cloudidsvc dcsvc defragsvc diagnosticshub.standardcollector.service diagsvc dmwappushservice dot3svc edgeupdate edgeupdatem embeddedmode fdPHost fhsvc hidserv icssvc lfsvc lltdsvc lmhosts msiserver netprofm p2pimsvc p2psvc perceptionsimulation pla seclogon smphost spectrum sppsvc svsvc swprv upnphost vds vm3dservice vmicguestinterface vmicheartbeat vmickvpexchange vmicrdv vmicshutdown vmictimesync vmicvmsession vmicvss vmvss wbengine wcncsvc webthreatdefsvc wercplsupport wisvc wlidsvc wlpasvc wmiApSrv workfolderssvc wscsvc wuauserv wudfsvc"
set "services_auto=AudioEndpointBuilder AudioSrv Audiosrv BFE BrokerInfrastructure BthAvctpSvc BthHFSrv CDPUserSvc_dc2a4 CoreMessagingRegistrar CryptSvc DPS DcomLaunch Dhcp DispBrokerDesktopSvc Dnscache DusmSvc EventLog EventSystem FontCache KeyIso LSM LanmanServer LanmanWorkstation MpsSvc OneSyncSvc_dc2a4 Power ProfSvc RpcEptMapper RpcSs SENS SamSs Schedule SgrmBroker ShellHWDetection Spooler SysMain SystemEventsBroker TermService Themes TrkWks UserManager VGAuthService VMTools VaultSvc Wcmsvc WinDefend Winmgmt WlanSvc WpnUserService_dc2a4 gpsvc iphlpsvc mpssvc nsi tiledatamodelsvc webthreatdefusersvc_dc2a4"
set "services_disabled=AJRouter AppVClient AssignedAccessManagerSvc DiagTrack DialogBlockingService MsKeyboardFilter NetTcpPortSharing RemoteAccess RemoteRegistry UevAgentService shpamsvc ssh-agent tzautoupdate uhssvc"

for %%s in (%services_manual%) do sc config "%%s" start= demand && echo "%%s" set to %BRIGHT_YELLOW%Manual
for %%s in (%services_auto%) do sc config "%%s" start= auto && echo "%%s" set to %BRIGHT_BLUE%Automatic
for %%s in (%services_disabled%) do sc config "%%s" start= disabled && echo "%%s" set to %BRIGHT_RED%Disabled

REM Disable Telemetry Tasks
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

REM Disable Telemetry Tasks
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable

REM Disable Telemetry via Registry
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v ContentDeliveryAllowed /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OemPreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEnabled /t REG_DWORD /d 0 /f

REM Change boot menu policy to Legacy
bcdedit /set {current} bootmenupolicy Legacy

REM Check Windows build version
for /f "tokens=3" %%i in ('ver') do set "version=%%i"
if %version% lss 22557 (
    start "" taskmgr.exe
    :wait
    timeout /t 1 >nul
    tasklist /FI "IMAGENAME eq taskmgr.exe" | find /i "taskmgr.exe" >nul && (taskkill /f /im taskmgr.exe && goto :wait) || goto :continue
)

:continue

REM Disable Wi-Fi Sense
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v Value /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v Value /t REG_DWORD /d 0 /f

REM Disable Activity Feed
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities /t REG_DWORD /d 0 /f

REM Delete Temporary Files
del /q /s C:\Windows\Temp\*.* > nul
del /q /s %TEMP%\*.* > nul

REM Deny location access
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v Value /t REG_SZ /d "Deny" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v SensorPermissionState /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v Status /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\Maps" /v AutoUpdateEnabled /t REG_DWORD /d 0 /f

REM Stop HomeGroup Services
net stop "HomeGroupListener"
net stop "HomeGroupProvider"
sc config HomeGroupListener start= demand
sc config HomeGroupProvider start= demand
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup" /v "DisableHomeGroup" /t REG_DWORD /d 1 /f

REM Disable Storage Sense
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "StorageSenseGlobal" /t REG_DWORD /d 0 /f

REM Disable Hibernate
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HibernateEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowHibernateOption" /t REG_DWORD /d 0 /f
powercfg.exe /hibernate off

REM Disable Game DVR
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f

REM Disable Power Throttling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d 0 /f

REM Change Keyboard Indicator Behavior
reg add "HKU\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_DWORD /d 0 /f

REM Show File Extensions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f

REM Disable User Account Control (UAC)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f

REM Disable Notification Center
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 0 /f

REM Disable Cortana
powershell -Command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"

@echo off
cls
echo Press any key . . .
pause >nul
taskkill /f /im explorer.exe >nul 2>&1
start explorer >nul 2>&1
timeout /t 2 >nul
cls
echo Tweaks applied successfully. Please proceed to restart your computer.
echo Press ENTER to return to the start.
pause >nul
cls
goto :eof


REM Option 2: Info
:Menu_[I] Info
cls
echo.
echo  %WHITE%██████%BRIGHT_PURPLE%╗ %WHITE%██%BRIGHT_PURPLE%╗   %WHITE%██%BRIGHT_PURPLE%╗         %WHITE%██%WHITE%╗%WHITE%██%WHITE%╗%WHITE%███████%WHITE%╗%WHITE%██%WHITE%╗     %WHITE%██%WHITE%╗     
echo  %WHITE%██%BRIGHT_PURPLE%╔══%WHITE%██%BRIGHT_PURPLE%╗╚%WHITE%██%BRIGHT_PURPLE%╗ %WHITE%██%BRIGHT_PURPLE%╔╝         %WHITE%██%WHITE%║%WHITE%██%WHITE%║%WHITE%██%WHITE%╔════╝%WHITE%██%WHITE%║     %WHITE%██%WHITE%║     
echo  %WHITE%██████%BRIGHT_PURPLE%╔╝ ╚%WHITE%████%BRIGHT_PURPLE%╔╝          %WHITE%██%WHITE%║%WHITE%██%WHITE%║%WHITE%███████%WHITE%╗%WHITE%██%WHITE%║     %WHITE%██%WHITE%║     
echo  %WHITE%██%BRIGHT_PURPLE%╔══%WHITE%██%BRIGHT_PURPLE%╗  ╚%WHITE%██%BRIGHT_PURPLE%╔╝      %WHITE%██   %WHITE%██%WHITE%║%WHITE%██%WHITE%║%WHITE%╚════%WHITE%██%WHITE%║%WHITE%██%WHITE%║     %WHITE%██%WHITE%║     
echo  %WHITE%██%WHITE%████%BRIGHT_PURPLE%╔╝   %WHITE%██%BRIGHT_PURPLE%║%WHITE%       ╚%WHITE%█████%WHITE%╔╝%WHITE%██%WHITE%║%WHITE%███████%WHITE%║%WHITE%███████%WHITE%╗%WHITE%███████%WHITE%╗
echo  %BRIGHT_PURPLE%╚═════╝    ╚═╝        %WHITE%╚════╝ ╚═╝╚══════╝╚══════╝╚══════╝                                                                                                                                                                                                                                                                                                             
echo.
echo.
pause
goto :eof

REM Option 3: Exit
:Menu_[E] Exit
exit

REM Backup Warning
:BackUp-Warn
cls
choice /c:YN /m "Did you back up your system"
if not %errorlevel% == 1 (
    cls
    echo %BRIGHT_BLACK%Please back up your system to prevent any %DARK_RED%errors or damages %BRIGHT_BLACK%then try to run the tool%DARK_WHITE%
    pause
    exit /b
)

REM Colors Definitions
:Colors
set "DARK_RED=[31m"
set "DARK_GREEN=[32m"
set "DARK_BLUE=[34m"
set "DARK_CYAN=[36m"
set "DARK_WHITE=[37m"
set "BRIGHT_BLACK=[90m"
set "BRIGHT_RED=[91m"
set "BRIGHT_GREEN=[92m"
set "BRIGHT_BLUE=[94m"
set "BRIGHT_CYAN=[96m"
set "BRIGHT_YELLOW=[93m"
set "WHITE=[97m"
set "UNDERLINE=[4m"
set "NO_UNDERLINE=[24m"
set "BRIGHT_PURPLE=[38;5;207m"
