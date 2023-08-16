:: Remove Metadata Tracking
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /f

:: Disable Nvidia Telemetry
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v OptInOrOutPreference /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID44231 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID64640 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID66610 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NvTelemetryContainer" /v Start /t REG_DWORD /d 4 /f
for %%i in (NvTmMon NvTmRep NvProfile) do for /f "tokens=1 delims=," %%a in ('schtasks /query /fo csv^| findstr /v "TaskName"^| findstr "%%~i"') do schtasks /change /tn "%%a" /disable >nul 2>&1

:: Enforce Security-Only Telemetry (disable other kinds of Telemetry)
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

:: Disable Application Telemetry
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v AITEnable /t REG_DWORD /d 0 /f

:: Disable inking and typing recognition data sending
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Input\TIPC" /v Enabled /t REG_DWORD /d 0 /f

:: Disable app usage tracking
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\EdgeUI" /v DisableMFUTracking /t REG_DWORD /d 1 /f

:: Disable more data collection on explorer
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoInstrumentation /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoInstrumentation /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v PreventHandwritingErrorReports /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowDeviceNameInTelemetry /t REG_DWORD /d 0 /f

:: Disable more error reports
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v DoReport /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v ShowUI /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\PCHealth\ErrorReporting" /v DoReport /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\PCHealth\ErrorReporting" /v ShowUI /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Off" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v EnabledV9 /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v HideRecentlyAddedApps /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v NoActiveHelp /t REG_DWORD /d 1 /f

:: Disable crash telemetry
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl\StorageTelemetry" /v DeviceDumpEnabled /t REG_DWORD /d 0 /f

:: Disable telemetry collector
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CompatTelRunner.exe" /v Debugger /t REG_SZ /d "%windir%\System32\taskkill.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeviceCensus.exe" /v Debugger /t REG_SZ /d "%windir%\System32\taskkill.exe" /f

:: ====================================================================================================================================

:: IP Block
set hostspath=%windir%\System32\drivers\etc\hosts

for %%i in (
	vortex.data.microsoft.com,
	vortex-win.data.microsoft.com,
	telecommand.telemetry.microsoft.com,
	telecommand.telemetry.microsoft.com.nsatc.net,
	oca.telemetry.microsoft.com,
	oca.telemetry.microsoft.com.nsatc.net,
	sqm.telemetry.microsoft.com,
	sqm.telemetry.microsoft.com.nsatc.net,
	watson.telemetry.microsoft.com,
	watson.telemetry.microsoft.com.nsatc.net,
	redir.metaservices.microsoft.com,
	choice.microsoft.com,
	choice.microsoft.com.nsatc.net,
	df.telemetry.microsoft.com,
	reports.wes.df.telemetry.microsoft.com,
	services.wes.df.telemetry.microsoft.com,
	sqm.df.telemetry.microsoft.com,
	telemetry.microsoft.com,
	watson.ppe.telemetry.microsoft.com,
	telemetry.appex.bing.net,
	telemetry.urs.microsoft.com,
	telemetry.appex.bing.net:443,
	vortex-sandbox.data.microsoft.com,
	settings-sandbox.data.microsoft.com,
	vortex.data.microsoft.com,
	vortex-win.data.microsoft.com,
	telecommand.telemetry.microsoft.com,
	telecommand.telemetry.microsoft.com.nsatc.net,
	oca.telemetry.microsoft.com,
	oca.telemetry.microsoft.com.nsatc.net,
	sqm.telemetry.microsoft.com,
	sqm.telemetry.microsoft.com.nsatc.net,
	watson.telemetry.microsoft.com,
	watson.telemetry.microsoft.com.nsatc.net,
	redir.metaservices.microsoft.com,
	choice.microsoft.com,
	choice.microsoft.com.nsatc.net,
	vortex-sandbox.data.microsoft.com,
	settings-sandbox.data.microsoft.com,
	df.telemetry.microsoft.com,
	reports.wes.df.telemetry.microsoft.com,
	sqm.df.telemetry.microsoft.com,
	telemetry.microsoft.com,
	watson.microsoft.com,
	watson.ppe.telemetry.microsoft.com,
	wes.df.telemetry.microsoft.com,
	telemetry.appex.bing.net,
	telemetry.urs.microsoft.com,
	survey.watson.microsoft.com,
	watson.live.com,
	services.wes.df.telemetry.microsoft.com,
	telemetry.appex.bing.net,
	vortex.data.microsoft.com,
	vortex-win.data.microsoft.com,
	telecommand.telemetry.microsoft.com,
	telecommand.telemetry.microsoft.com.nsatc.net,
	oca.telemetry.microsoft.com,
	oca.telemetry.microsoft.com.nsatc.net,
	sqm.telemetry.microsoft.com,
	sqm.telemetry.microsoft.com.nsatc.net,
	watson.telemetry.microsoft.com,
	watson.telemetry.microsoft.com.nsatc.net,
	redir.metaservices.microsoft.com,
	choice.microsoft.com,
	choice.microsoft.com.nsatc.net,
	df.telemetry.microsoft.com,
	reports.wes.df.telemetry.microsoft.com,
	wes.df.telemetry.microsoft.com,
	services.wes.df.telemetry.microsoft.com,
	sqm.df.telemetry.microsoft.com,
	telemetry.microsoft.com,
	watson.ppe.telemetry.microsoft.com,
	telemetry.appex.bing.net,
	telemetry.urs.microsoft.com,
	telemetry.appex.bing.net:443,
	settings-sandbox.data.microsoft.com,
	vortex-sandbox.data.microsoft.com,
	survey.watson.microsoft.com,
	watson.live.com,
	watson.microsoft.com,
	statsfe2.ws.microsoft.com,
	corpext.msitadfs.glbdns2.microsoft.com,
	compatexchange.cloudapp.net,
	cs1.wpc.v0cdn.net,
	a-0001.a-msedge.net,
	a-0002.a-msedge.net,
	a-0003.a-msedge.net,
	a-0004.a-msedge.net,
	a-0005.a-msedge.net,
	a-0006.a-msedge.net,
	a-0007.a-msedge.net,
	a-0008.a-msedge.net,
	a-0009.a-msedge.net,
	msedge.net,
	a-msedge.net,
	statsfe2.update.microsoft.com.akadns.net,
	sls.update.microsoft.com.akadns.net,
	fe2.update.microsoft.com.akadns.net,
	diagnostics.support.microsoft.com,
	corp.sts.microsoft.com,
	statsfe1.ws.microsoft.com,
	pre.footprintpredict.com,
	i1.services.social.microsoft.com,
	i1.services.social.microsoft.com.nsatc.net,
	feedback.windows.com,
	feedback.microsoft-hohm.com,
	feedback.search.microsoft.com,
	live.rads.msn.com,
	ads1.msn.com,
	static.2mdn.net,
	g.msn.com,
	a.ads2.msads.net,
	b.ads2.msads.net,
	ad.doubleclick.net,
	ac3.msn.com,
	rad.msn.com,
	msntest.serving-sys.com,
	bs.serving-sys.com1,
	flex.msn.com,
	ec.atdmt.com,
	cdn.atdmt.com,
	db3aqu.atdmt.com,
	cds26.ams9.msecn.net,
	sO.2mdn.net,
	aka-cdn-ns.adtech.de,
	secure.flashtalking.com,
	adnexus.net,
	adnxs.com,
	*.rad.msn.com,
	*.msads.net,
	*.msecn.net
) do echo 127.0.0.1 %%i >> %hostspath%

