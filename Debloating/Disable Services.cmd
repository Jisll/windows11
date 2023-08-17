@echo off
setlocal EnableDelayedExpansion
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
echo Before proceeding, make sure to create a backup of your system.
echo This script will modify various settings. Continue only if you understand the changes.
echo.
set /p "continue=Press ENTER to start the process..."

:: Disable Storage Sense
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense" /f

:: Disable drivers to prevent errors
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dhcp" /v DependOnService /t REG_MULTI_SZ /d "NSI\0Afd" /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\hidserv" /v DependOnService /t REG_MULTI_SZ /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Class\{4d36e96c-e325-11ce-bfc1-08002be10318}" /v UpperFilters /t REG_MULTI_SZ /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Class\{4d36e967-e325-11ce-bfc1-08002be10318}" /v LowerFilters /t REG_MULTI_SZ /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Class\{4d36e967-e325-11ce-bfc1-08002be10318}" /v LowerFilters /t REG_MULTI_SZ /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Class\{6bdd1fc6-810f-11d0-bec7-08002be2092f}" /v UpperFilters /t REG_MULTI_SZ /d "" /f

:: Disable Bitlocker support (partial)
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Class\{71a27cdd-812a-11d0-bec7-08002be2092f}" /v LowerFilters /t REG_MULTI_SZ /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\fvevol" /v ErrorControl /t REG_DWORD /d 0 /f

:: ====================================================================================================================================

:: Startup Types: 0 = Boot, 1 = System, 2 = Automatic, 3 = Manual, 4 = Disabled
:: DelayedAutoStart 0 or 1, same level as Start key

:: Alter reg/registry through Linux by using "chntpw -e /media/YOUR_USER/YOUR_MOUNTED_DISK/Windows/System32/config/SYSTEM" or a different value path that you want, from config folder. You can use ? to show commands, but ls and ed REGKEY is enough to alter unless you want to add new.

:: Disable Services

:: -----------------------------------------------------------
:: Services requiring additional permissions

:: Windows Defender Firewall
call %~dp0\..\optional_helpers\run_minsudo "REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\mpssvc" /v Start /t REG_DWORD /d 4 /f"

:: Security Center
call %~dp0\..\optional_helpers\run_minsudo "REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc" /v Start /t REG_DWORD /d 4 /f"

call %~dp0\..\optional_helpers\run_minsudo "REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SamSs" /v Start /t REG_DWORD /d 4 /f"

:: Windows Defender
call %~dp0\..\optional_helpers\run_minsudo "REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v Start /t REG_DWORD /d 4 /f"
call %~dp0\..\optional_helpers\run_minsudo "REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend" /v Start /t REG_DWORD /d 4 /f"

call %~dp0\..\optional_helpers\run_minsudo "REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TrkWks" /v Start /t REG_DWORD /d 4 /f"

call %~dp0\..\optional_helpers\run_minsudo "REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DPS" /v Start /t REG_DWORD /d 4 /f"

call %~dp0\..\optional_helpers\run_minsudo "REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdiServiceHost" /v Start /t REG_DWORD /d 4 /f"

:: -----------------------------------------------------------

REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks\{C855DFE3-7C4B-41B6-92D3-CEFA7D42FE20}" /f

:: Last time it caused problems with Valorant anti-cheat
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hwpolicy" /v Start /t REG_DWORD /d 4 /f 

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\rdbss" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AxInstSV" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinRM" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\pcmcia" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\DevicesFlowUserSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\DevicePickerUserSvc" /v Start /t REG_DWORD /d 4 /f

:: UAC
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\luafv" /v Start /t REG_DWORD /d 4 /f

:: If stopped, firewall stop working
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent" /v Start /t REG_DWORD /d 3 /f

:: Keep enabled, so firewalls continue working
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\BFE" /v Start /t REG_DWORD /d 4 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\lltdio" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\FontCache" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\rdyboost" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\CSC" /v Start /t REG_DWORD /d 4 /f

:: Task Scheduler
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule" /v Start /t REG_DWORD /d 2 /f
:: Background work on Task scheduler
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TimeBrokerSvc" /v Start /t REG_DWORD /d 4 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\storflt" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\srvnet" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\rspndr" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Psched" /v Start /t REG_DWORD /d 4 /f

:: Windows Update related
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\UsoSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\uhssvc" /v Start /t REG_DWORD /d 4 /f

:: Seemed to cause problems in windows
::REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Power" /v Start /t REG_DWORD /d 4 /f
::REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\atapi" /v Start /t REG_DWORD /d 4 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WerSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DEFRAGSVC" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\upnphost" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MessagingService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stisvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MapsBroker" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\ALG" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\AppMgmt" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\PeerDistSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\CertPropSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\irmon" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MSiSCSI" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NaturalAuthentication" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Netlogon" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\RpcLocator" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\RetailDemo" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SCPolicySvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMPTRAP" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMP" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\wcncsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\wisvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WwanSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\XblAuthManager" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\XboxNetApiSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SessionEnv" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\TermService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\UmRdpService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\AJRouter" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\BthHFSrv" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\bthserv" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\dmwappushsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\HvHost" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmickvpexchange" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmicguestinterface" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmicshutdown" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmicheartbeat" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmicvmsession" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmicrdv" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmictimesync" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vmicvss" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\VMAuthdService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\VMnetDHCP" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\VMware" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\VMUSBArbService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\VMwareHostd" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SharedAccess" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SmsRouter" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\CscService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SEMgrSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\PhoneSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SensorDataService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SensrSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SensorService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\ScDeviceEnum" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\TabletInputService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WebClient" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WFDSConSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\FrameServer" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\icssvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\xbgm" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\XblGameSave" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\lfsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NcdAutoSetup" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NfsClnt" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WMPNetworkSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\edgeupdate" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\edgeupdatem" /v Start /t REG_DWORD /d 4 /f

:: Cannot disable otherwise Win11 will be stuck right after boot on infinite loading, waiting Local Session manager to load.
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\TextInputManagementService" /v Start /t REG_DWORD /d 2 /f

:: Related to Undocked Dev Kit / runtime lib
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\UdkUserSv" /v Start /t REG_DWORD /d 4 /f

:: Wifi
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WlanSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vwififlt" /v Start /t REG_DWORD /d 4 /f

:: VPN and PPoE WAN
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\PptpMiniport" /v Start /t REG_DWORD /d 4 /f
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\RasAgileVpn" /v Start /t REG_DWORD /d 4 /f
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Rasl2tp" /v Start /t REG_DWORD /d 4 /f
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\RasSstp" /v Start /t REG_DWORD /d 4 /f
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\RasPppoe" /v Start /t REG_DWORD /d 4 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\RasMan" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\lmhosts" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\p2pimsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\PcaSvc" /v Start /t REG_DWORD /d 4 /f

:: Disable IPV6
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\iphlpsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip6" /v Start /t REG_DWORD /d 4 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\PNRPsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\RemoteRegistry" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\HomeGroupListener" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\HomeGroupProvider" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SENS" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SysMain" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BluetoothUserService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\vdrvroot" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\BTAGService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\BthAvctpSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\RmSvc" /v Start /t REG_DWORD /d 4 /f

:: Disable files and printers share support
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\LanmanWorkstation" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\LanmanServer" /v Start /t REG_DWORD /d 4 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\DevicesFlowUserSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\MsKeyboardFilter" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\PimIndexMaintenanceSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Beep" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Telemetry" /v Start /t REG_DWORD /d 4 /f

:: Can break dynamic disks
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\volmgrx" /v Start /t REG_DWORD /d 4 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\esifsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\GpuEnergyDrv" /v Start /t REG_DWORD /d 4 /f

:: Disable AMD Logging
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\amdlog" /v Start /t REG_DWORD /d 4 /f

:: Can break microsoft store installation / games
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\wcifs" /v Start /t REG_DWORD /d 4 /f
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FileInfo" /v Start /t REG_DWORD /d 4 /f
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FileCrypt" /v Start /t REG_DWORD /d 4 /f

:: Might affect installation of store / appx apps, if so, change to 3
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppXSvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wlidsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PushToInstall" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\msiserver" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\InstallService" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSService" /v Start /t REG_DWORD /d 3 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\tdx" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\AsusPTPService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\CDPUserSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\OneSyncSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\ShellHWDetection" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\CDPSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\DisplayEnhancementService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\hidserv" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\DusmSvc" /v Start /t REG_DWORD /d 4 /f

:: Related to Xbox Auth
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\TokenBroker" /v Start /t REG_DWORD /d 4 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Ndu" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\dmwappushservice" /v Start /t REG_DWORD /d 4 /f

:: Cause issues with nvcleaninstall driver telemetry tweak
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\KeyIso" /v Start /t REG_DWORD /d 3 /f

:: Can break Nework setting view
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WpnService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\WpnUserService" /v Start /t REG_DWORD /d 4 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MsLldp" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\storqosflt" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBIOS" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NvTelemetryContainer" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\dam" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SstpSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\NcbService" /v Start /t REG_DWORD /d 4 /f

:: VR
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\perceptionsimulation" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MixedRealityOpenXRSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedRealitySvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\spectrum" /v Start /t REG_DWORD /d 4 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WbioSrvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\autotimesvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Fax" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintNotify" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TapiSrv" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NPSMSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NPSMSvc_4bc8c" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Sense" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdBoot" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdFilter" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisDrv" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Wdnsfltr" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NPSMSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NcaSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\diagsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserDataSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\GoogleChromeElevationService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ibtsiva" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\pla" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ssh-agent" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sshd" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetTcpPortSharing" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gupdate" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gupdatem" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UnistoreSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\debugregsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VaultSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\fhsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteAccess" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSearch" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SCardSvr" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RtkBtManServ" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdiSystemHost" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wercplsupport" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\shpamsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TroubleshootingSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\fvevol" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BDESVC" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RasAuto" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UevAgentService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\GamingServices" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sppsvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClickToRunSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DtsApo4Service" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VacSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VSStandardCollectorService150" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ss_conn_service" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ss_conn_service2" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AudioEndpointBuilder" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\KtmRm" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppVClient" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WpcMonSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\COMSysApp" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppIDSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cbdhsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CryptSvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DispBrokerDesktopSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DsmSvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eaphost" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\fdPHost" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FDResPub" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gcs" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\IKEEXT" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\IpxlatCfgSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MSDTC" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Themes" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmcompute" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WarpJITSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WEPHOSTSVC" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WPDBusEnum" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\3ware" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ADP80XX" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AmdK8" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\arcsas" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AsyncMac" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bindflt" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bttflt" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\buttonconverter" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CAD" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cdfs" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CimFS" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\circlass" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cnghwassist" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CompositeBus" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dfsc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ErrDev" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\fdc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\flpydisk" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthA2dp" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthEnum" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthHFEnum" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthLEEnum" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthMini" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHMODEM" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthPan" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHPORT" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHUSB" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidBth" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Microsoft_Bluetooth_AvrcpTransport" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RFCOMM" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cnghwassist" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CmBatt" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gencounter" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hvcrash" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hvservice" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hvsocketcontrol" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\KSecPkg" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb10" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb20" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NdisVirtualBus" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvraid" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\passthruparser" /v Start /t REG_DWORD /d 4 /f

:: Breaks streaming apps
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PEAUTH" /v Start /t REG_DWORD /d 4 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\pvhdparser" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sfloppy" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SiSRaid2" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SiSRaid4" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\spaceparser" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\srv2" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tcpipreg" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\udfs" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\umbus" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VerifierExt" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vhdparser" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Vid" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vkrnlintvsc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vkrnlintvsp" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmbus" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmbusr" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmgid" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vpci" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vsmraid" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VSTXRAID" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wcnfs" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WindowsTrustedRTProxy" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LicenseManager" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC" /v Start /t REG_DWORD /d 3 /f

:: Related to UAC
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Appinfo" /v Start /t REG_DWORD /d 3 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DcomLaunch" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dhcp" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BrokerInfrastructure" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CoreMessagingRegistrar" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventSystem" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LSM" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\netprofm" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nsi" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PlugPlay" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ProfSvc" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcEptMapper" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcSs" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SgrmBroker" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\StateRepository" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SystemEventsBroker" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserManager" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Wcmsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Winmgmt" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cdrom" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\intelpep" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netman" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetSetupSvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache3.0.0.0" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WacomPen" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PktMon" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\webthreatdefusersvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\webthreatdefsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AarSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AssignedAccessManagerSvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tzautoupdate" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wbengine" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Smartcard" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\embeddedmode" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wlpasvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppReadiness" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppHostSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\aspnet_state" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\camsvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\c2wts" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Browser" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DsSvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationService" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceInstall" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DmEnrollmentSvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevQueryBroker" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DsRoleSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EFS" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EntAppSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gpsvc" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hns" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmms" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\IISADMIN" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UI0Detect" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lltdsvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LPDSVC" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LxssManager" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MSMQ" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MSMQTriggers" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ftpsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NgcSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NgcCtnrSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\swprv" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\smphost" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WmsRepair" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Wms" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetMsmqActivator" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetPipeActivator" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetTcpActivator" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\p2psvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PerfHost" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PNRPAutoReg" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QWAVE" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\iprip" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PenService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\P9RdrService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WFDSConMgrSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FrameServerMonitor" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\McpManagementService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AssignedAccessManagerSvc" /v Start /t REG_DWORD /d 4 /f

:: If stopped, logon stop working
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\seclogon" /v Start /t REG_DWORD /d 3 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\simptcp" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\svsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WiaRpc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\StorSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TieringEngineService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TimeBroker" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UwfServcingSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vds" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VSS" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3LOGSVC" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WalletService" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WMSVC" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AudioSrv" /v Start /t REG_DWORD /d 2 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SDRSVC" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Wecsvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WAS" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\dot3svc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wmiApSrv" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\workfolderssvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MicrosoftEdgeElevationService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WcesComm" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RapiMgr" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UxSms" /v Start /t REG_DWORD /d 4 /f

:: Do not disable this service
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MMCSS" /v Start /t REG_DWORD /d 4 /f

:: Can break task manager or even cause BSOD, keep at 0, to boot
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\pcw" /v Start /t REG_DWORD /d 0 /f

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cphs" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cplspcon" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EasyAntiCheat" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Service KMSELDI" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tiledatamodelsvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WFDSConMgrSvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ZoomCptService" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintWorkflowUserSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CldFlt" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Modem" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sermouse" /v Start /t REG_DWORD /d 4 /f

:: Disable CPU turbo, only do if you decide to alter BCLK
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\intelppm" /v Start /t REG_DWORD /d 4 /f
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\amdppm" /v Start /t REG_DWORD /d 4 /f
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Processor" /v Start /t REG_DWORD /d 4 /f

:: One seem to be causing random BSOD, put all to 3 if not able to find which. Though I disabled a device that could have been responsible.
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\rdpbus" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hvcmon" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QWAVEdrv" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kdnic" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NdisCap" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RasAcd" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wanarp" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wanarpv6" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ndiswanlegacy" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NdisTapi" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NdisWan" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RDPDR" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TsUsbGD" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tsusbhub" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tsusbflt" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RdpVideoMiniport" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppVClient" /v Start /t REG_DWORD /d 4 /f

