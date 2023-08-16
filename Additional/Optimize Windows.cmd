@echo off
echo Script by Jisll
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableActivityFeed" /t REG_DWORD /d 1 /f
del /q /s "%TEMP%\*.*"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f
net stop "HomeGroupListener"
net stop "HomeGroupProvider"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup" /v "DisableHomeGroup" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "StorageSenseGlobal" /t REG_DWORD /d 0 /f
powercfg /hibernate off
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f
sc config "wuauserv" start= demand
sc config "wercplsupport" start= demand
sc config "diagnosticshub.standardcollector.service" start= demand
sc config "RetailDemo" start= demand
sc config "lfsvc" start= demand
sc config "MapsBroker" start= demand
sc config "MessagingService_83f5d90" start= demand
sc config "BcastDVRUserService" start= demand
sc config "PhoneSvc" start= demand
sc config "BthHFSrv" start= demand
sc config "PimIndexMaintenanceSvc" start= demand
sc config "SensorDataService" start= demand
sc config "dmwappushservice" start= demand
sc config "WMPNetworkSvc" start= demand
sc config "WpnUserService" start= demand
sc config "WpnUserService_83f5d90" start= demand
sc config "wlidsvc" start= demand
sc config "WalletService" start= demand
sc config "RemoteDesktopServer" start= demandreg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d 2 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
echo Tweaks applied successfully.
pause
