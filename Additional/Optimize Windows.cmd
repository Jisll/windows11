@echo off
setlocal
color 17
cls
echo Script by Jisll

:: Disable Telemetry
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f

:: Disable WiFi AutoConnect
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d 0 /f

:: Disable Activity Feed
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableActivityFeed" /t REG_DWORD /d 1 /f

:: Clear Temp Files
del /q /s "%TEMP%\*.*"

:: Disable Location and Sensors
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f

:: Stop HomeGroup Services
net stop "HomeGroupListener"
net stop "HomeGroupProvider"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup" /v "DisableHomeGroup" /t REG_DWORD /d 1 /f

:: Disable Storage Sense
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "StorageSenseGlobal" /t REG_DWORD /d 0 /f

:: Disable Hibernate
powercfg /hibernate off

:: Disable Game DVR
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f

:: Set Windows Update Service to Manual Start
set "services=AJRouter ALG AppIDSvc AppMgmt AppReadiness AppVClient AppXSvc Appinfo AssignedAccessManagerSvc AudioEndpointBuilder AudioSrv Audiosrv AxInstSV BDESVC BFE BITS BTAGService BcastDVRUserService_dc2a4 BluetoothUserService_dc2a4 BrokerInfrastructure Browser BthAvctpSvc BthHFSrv CDPSvc CDPUserSvc_dc2a4 COMSysApp CaptureService_dc2a4 CertPropSvc ClipSVC ConsentUxUserSvc_dc2a4 CoreMessagingRegistrar CredentialEnrollmentManagerUserSvc_dc2a4 CryptSvc CscService DPS DcomLaunch DcpSvc DevQueryBroker DeviceAssociationBrokerSvc_dc2a4 DeviceAssociationService DeviceInstall DevicePickerUserSvc_dc2a4 DevicesFlowUserSvc_dc2a4 Dhcp DiagTrack DialogBlockingService DispBrokerDesktopSvc DisplayEnhancementService DmEnrollmentSvc Dnscache DoSvc DsSvc DsmSvc DusmSvc EFS EapHost EntAppSvc EventLog EventSystem FDResPub Fax FontCache FrameServer FrameServerMonitor GraphicsPerfSvc HomeGroupListener HomeGroupProvider HvHost IEEtwCollectorService IKEEXT InstallService InventorySvc IpxlatCfgSvc KeyIso KtmRm LSM LanmanServer LanmanWorkstation LicenseManager LxpSvc MSDTC MSiSCSI MapsBroker McpManagementService MessagingService_dc2a4 MicrosoftEdgeElevationService MixedRealityOpenXRSvc MpsSvc MsKeyboardFilter NPSMSvc_dc2a4 NaturalAuthentication NcaSvc NcbService NcdAutoSetup NetSetupSvc NetTcpPortSharing Netlogon Netman NgcCtnrSvc NgcSvc NlaSvc OneSyncSvc_dc2a4 P9RdrService_dc2a4 PNRPAutoReg PNRPsvc PcaSvc PeerDistSvc PenService_dc2a4 PerfHost PhoneSvc PimIndexMaintenanceSvc_dc2a4 PlugPlay PolicyAgent Power PrintNotify PrintWorkflowUserSvc_dc2a4 ProfSvc PushToInstall QWAVE RasAuto RasMan RemoteAccess RemoteRegistry RetailDemo RmSvc RpcEptMapper RpcLocator RpcSs SCPolicySvc SCardSvr SDRSVC SEMgrSvc SENS SNMPTRAP SNMPTrap SSDPSRV SamSs ScDeviceEnum Schedule SecurityHealthService Sense SensorDataService SensorService SensrSvc SessionEnv SgrmBroker SharedAccess SharedRealitySvc ShellHWDetection SmsRouter Spooler SstpSvc StateRepository StiSvc StorSvc SysMain SystemEventsBroker TabletInputService TapiSrv TermService TextInputManagementService Themes TieringEngineService TimeBroker TimeBrokerSvc TokenBroker TrkWks TroubleshootingSvc TrustedInstaller UI0Detect UdkUserSvc_dc2a4 UevAgentService UmRdpService UnistoreSvc_dc2a4 UserDataSvc_dc2a4 UserManager UsoSvc VGAuthService VMTools VSS VacSvc VaultSvc W32Time WEPHOSTSVC WFDSConMgrSvc WMPNetworkSvc WManSvc WPDBusEnum WSService WSearch WaaSMedicSvc WalletService WarpJITSvc WbioSrvc Wcmsvc WcsPlugInService WdNisSvc WdiServiceHost WdiSystemHost WebClient Wecsvc WerSvc WiaRpc WinDefend WinHttpAutoProxySvc WinRM Winmgmt WlanSvc WpcMonSvc WpnService WpnUserService_dc2a4 WwanSvc XblAuthManager XblGameSave XboxGipSvc XboxNetApiSvc autotimesvc bthserv camsvc cbdhsvc_dc2a4 cloudidsvc dcsvc defragsvc diagnosticshub.standardcollector.service diagsvc dmwappushservice dot3svc edgeupdate edgeupdatem embeddedmode fdPHost fhsvc gpsvc hidserv icssvc iphlpsvc lfsvc lltdsvc lmhosts mpssvc msiserver netprofm nsi p2pimsvc p2psvc perceptionsimulation pla seclogon shpamsvc smphost spectrum sppsvc ssh-agent svsvc swprv tiledatamodelsvc tzautoupdate uhssvc upnphost vds vm3dservice vmicguestinterface vmicheartbeat vmickvpexchange vmicrdv vmicshutdown vmictimesync vmicvmsession vmicvss vmvss wbengine wcncsvc webthreatdefsvc webthreatdefusersvc_dc2a4 wercplsupport wisvc wlidsvc wlpasvc wmiApSrv workfolderssvc wscsvc wuauserv wudfsvc"

for %%s in (%services%) do (
    sc config "%%s" start= demand
    echo "%%s" set to Manual
)

echo.
:: Disable Power Throttling
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f

:: Change Keyboard Indicator Behavior
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d 2 /f

:: Show File Extensions
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f

:: Disable User Account Control (UAC)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f

:: Disable Notification Center
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f

:: Disable Cortana and Windows Search
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f

echo Tweaks applied successfully.
pause
