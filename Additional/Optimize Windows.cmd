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
echo Press ENTER to start the process...
pause > nul

:HandleError
echo An error occurred: %1
echo Press any key to exit...
pause > nul
exit /b

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
set "services=ALG AppIDSvc AppMgmt AppReadiness AppXSvc Appinfo AxInstSV BDESVC BITS BTAGService BcastDVRUserService_dc2a4 BluetoothUserService_dc2a4 Browser CDPSvc COMSysApp CaptureService_dc2a4 CertPropSvc ClipSVC ConsentUxUserSvc_dc2a4 CredentialEnrollmentManagerUserSvc_dc2a4 CscService DcpSvc DevQueryBroker DeviceAssociationBrokerSvc_dc2a4 DeviceAssociationService DeviceInstall DevicePickerUserSvc_dc2a4 DevicesFlowUserSvc_dc2a4 DisplayEnhancementService DmEnrollmentSvc DoSvc DsSvc DsmSvc EFS EapHost EntAppSvc FDResPub Fax FrameServer FrameServerMonitor GraphicsPerfSvc HomeGroupListener HomeGroupProvider HvHost IEEtwCollectorService IKEEXT InstallService InventorySvc IpxlatCfgSvc KtmRm LicenseManager LxpSvc MSDTC MSiSCSI MapsBroker McpManagementService MessagingService_dc2a4 MicrosoftEdgeElevationService MixedRealityOpenXRSvc NPSMSvc_dc2a4 NaturalAuthentication NcaSvc NcbService NcdAutoSetup NetSetupSvc Netlogon Netman NgcCtnrSvc NgcSvc NlaSvc P9RdrService_dc2a4 PNRPAutoReg PNRPsvc PcaSvc PeerDistSvc PenService_dc2a4 PerfHost PhoneSvc PimIndexMaintenanceSvc_dc2a4 PlugPlay PolicyAgent PrintNotify PrintWorkflowUserSvc_dc2a4 PushToInstall QWAVE RasAuto RasMan RetailDemo RmSvc RpcLocator SCPolicySvc SCardSvr SDRSVC SEMgrSvc SNMPTRAP SNMPTrap SSDPSRV ScDeviceEnum SecurityHealthService Sense SensorDataService SensorService SensrSvc SessionEnv SharedAccess SharedRealitySvc SmsRouter SstpSvc StateRepository StiSvc StorSvc TabletInputService TapiSrv TextInputManagementService TieringEngineService TimeBroker TimeBrokerSvc TokenBroker TroubleshootingSvc TrustedInstaller UI0Detect UdkUserSvc_dc2a4 UmRdpService UnistoreSvc_dc2a4 UserDataSvc_dc2a4 UsoSvc VSS VacSvc W32Time WEPHOSTSVC WFDSConMgrSvc WMPNetworkSvc WManSvc WPDBusEnum WSService WSearch WaaSMedicSvc WalletService WarpJITSvc WbioSrvc WcsPlugInService WdNisSvc WdiServiceHost WdiSystemHost WebClient Wecsvc WerSvc WiaRpc WinHttpAutoProxySvc WinRM WpcMonSvc WpnService WwanSvc XblAuthManager XblGameSave XboxGipSvc XboxNetApiSvc autotimesvc bthserv camsvc cbdhsvc_dc2a4 cloudidsvc dcsvc defragsvc diagnosticshub.standardcollector.service diagsvc dmwappushservice dot3svc edgeupdate edgeupdatem embeddedmode fdPHost fhsvc hidserv icssvc lfsvc lltdsvc lmhosts msiserver netprofm p2pimsvc p2psvc perceptionsimulation pla seclogon smphost spectrum sppsvc svsvc swprv upnphost vds vm3dservice vmicguestinterface vmicheartbeat vmickvpexchange vmicrdv vmicshutdown vmictimesync vmicvmsession vmicvss vmvss wbengine wcncsvc webthreatdefsvc wercplsupport wisvc wlidsvc wlpasvc wmiApSrv workfolderssvc wscsvc wuauserv wudfsvc"
for %%s in (%services%) do (
    sc config "%%s" start= demand
    echo "%%s" set to Manual
)

:: Set Windows Update Service to Auto Start
set "services1=AudioEndpointBuilder AudioSrv Audiosrv BFE BrokerInfrastructure BthAvctpSvc BthHFSrv CDPUserSvc_dc2a4 CoreMessagingRegistrar CryptSvc DPS DcomLaunch Dhcp DispBrokerDesktopSvc Dnscache DusmSvc EventLog EventSystem FontCache KeyIso LSM LanmanServer LanmanWorkstation MpsSvc OneSyncSvc_dc2a4 Power ProfSvc RpcEptMapper RpcSs SENS SamSs Schedule SgrmBroker ShellHWDetection Spooler SysMain SystemEventsBroker TermService Themes TrkWks UserManager VGAuthService VMTools VaultSvc Wcmsvc WinDefend Winmgmt WlanSvc WpnUserService_dc2a4 gpsvc iphlpsvc mpssvc nsi tiledatamodelsvc webthreatdefusersvc_dc2a4"
for %%s in (%services1%) do (
    sc config "%%s" start= auto
    echo "%%s" set to Automatic 
)

:: Set Windows Update Service to Disabled Start
set "services=AJRouter AppVClient AssignedAccessManagerSvc DiagTrack DialogBlockingService MsKeyboardFilter NetTcpPortSharing RemoteAccess RemoteRegistry UevAgentService shpamsvc ssh-agent tzautoupdate uhssvc"
for %%s in (%services%) do (
    sc config "%%s" start= disabled
    echo "%%s" set to Disabled
)

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
