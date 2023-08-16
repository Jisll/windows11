@echo off
setlocal
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
echo Press ENTER to undo the tweaks...
pause > nul

:: Enable Telemetry
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /f

:: Enable WiFi AutoConnect
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /f

:: Enable Activity Feed
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableActivityFeed" /f

:: Restore Temp Files (No action needed, as they were deleted in the previous script)

:: Enable Location and Sensors
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /f

:: Start HomeGroup Services
net start "HomeGroupListener"
net start "HomeGroupProvider"
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup" /v "DisableHomeGroup" /f

:: Enable Storage Sense
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "StorageSenseGlobal" /f

:: Enable Hibernate
powercfg /hibernate on

:: Enable Game DVR
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /f

:: Set Windows Update Service back to Manual Start
set "services=AJRouter ALG AppIDSvc AppMgmt AppReadiness AppVClient AppXSvc Appinfo AssignedAccessManagerSvc AxInstSV BDESVC BFE BITS BTAGService BcastDVRUserService_dc2a4 BluetoothUserService_dc2a4 BrokerInfrastructure Browser BthAvctpSvc BthHFSrv CDPSvc CDPUserSvc_dc2a4 COMSysApp CaptureService_dc2a4 CertPropSvc ClipSVC ConsentUxUserSvc_dc2a4 CoreMessagingRegistrar CredentialEnrollmentManagerUserSvc_dc2a4 CryptSvc CscService DPS DcomLaunch DcpSvc DevQueryBroker DeviceAssociationBrokerSvc_dc2a4 DeviceAssociationService DeviceInstall DevicePickerUserSvc_dc2a4 DevicesFlowUserSvc_dc2a4 Dhcp DiagTrack DialogBlockingService DispBrokerDesktopSvc DisplayEnhancementService DmEnrollmentSvc Dnscache DoSvc DsSvc DsmSvc DusmSvc EFS EapHost EntAppSvc EventLog EventSystem FDResPub Fax FontCache FrameServer FrameServerMonitor GraphicsPerfSvc HomeGroupListener HomeGroupProvider HvHost IEEtwCollectorService IKEEXT InstallService InventorySvc IpxlatCfgSvc KeyIso KtmRm LSM LanmanServer LanmanWorkstation LicenseManager LxpSvc MSDTC MSiSCSI MapsBroker McpManagementService MessagingService_dc2a4 MicrosoftEdgeElevationService MixedRealityOpenXRSvc MpsSvc MsKeyboardFilter NPSMSvc_dc2a4 NaturalAuthentication NcaSvc NcbService NcdAutoSetup NetSetupSvc NetTcpPortSharing Netlogon Netman NgcCtnrSvc NgcSvc NlaSvc OneSyncSvc_dc2a4 P9RdrService_dc2a4 PNRPAutoReg PNRPsvc PcaSvc PeerDistSvc PenService_dc2a4 PerfHost PhoneSvc PimIndexMaintenanceSvc_dc2a4 PlugPlay PolicyAgent Power PrintNotify PrintWorkflowUserSvc_dc2a4 ProfSvc PushToInstall QWAVE RasAuto RasMan RemoteAccess RemoteRegistry RetailDemo RmSvc RpcEptMapper RpcLocator RpcSs SCPolicySvc SCardSvr SDRSVC SEMgrSvc SENS SNMPTRAP SNMPTrap SSDPSRV SamSs ScDeviceEnum Schedule SecurityHealthService Sense SensorDataService SensorService SensrSvc SessionEnv SgrmBroker SharedAccess SharedRealitySvc ShellHWDetection SmsRouter Spooler SstpSvc StateRepository StiSvc StorSvc SysMain SystemEventsBroker TabletInputService TapiSrv TermService TextInputManagementService Themes TieringEngineService TimeBroker TimeBrokerSvc TokenBroker TrkWks TroubleshootingSvc TrustedInstaller UI0Detect UdkUserSvc_dc2a4 UevAgentService UmRdpService UnistoreSvc_dc2a4 UserDataSvc_dc2a4 UserManager UsoSvc VGAuthService VMTools VSS VacSvc VaultSvc W32Time WEPHOSTSVC WFDSConMgrSvc WMPNetworkSvc WManSvc WPDBusEnum WSService WSearch WaaSMedicSvc WalletService WarpJITSvc WbioSrvc Wcmsvc WcsPlugInService WdNisSvc WdiServiceHost WdiSystemHost WebClient Wecsvc WerSvc WiaRpc WinDefend WinHttpAutoProxySvc WinRM Winmgmt WlanSvc WpcMonSvc WpnService WpnUserService_dc2a4 WwanSvc XblAuthManager XblGameSave XboxGipSvc XboxNetApiSvc autotimesvc bthserv camsvc cbdhsvc_dc2a4 cloudidsvc dcsvc defragsvc diagnosticshub.standardcollector.service diagsvc dmwappushservice dot3svc edgeupdate edgeupdatem embeddedmode fdPHost fhsvc gpsvc hidserv icssvc iphlpsvc lfsvc lltdsvc lmhosts mpssvc msiserver netprofm nsi p2pimsvc p2psvc perceptionsimulation pla seclogon shpamsvc smphost spectrum sppsvc ssh-agent svsvc swprv tiledatamodelsvc tzautoupdate uhssvc upnphost vds vm3dservice vmicguestinterface vmicheartbeat vmickvpexchange vmicrdv vmicshutdown vmictimesync vmicvmsession vmicvss vmvss wbengine wcncsvc webthreatdefsvc webthreatdefusersvc_dc2a4 wercplsupport wisvc wlidsvc wlpasvc wmiApSrv workfolderssvc wscsvc wuauserv wudfsvc"
for %%s in (%services%) do (
    sc config "%%s" start= auto
    echo "%%s" set to Auto
)

echo Tweaks undone successfully.
pause
