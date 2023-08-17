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

:: List of features to disable
set "features_to_disable=SNMP WMISnmpProvider Windows-Identity-Foundation DirectoryServices-ADAM-Client IIS-WebServerRole IIS-WebServer IIS-CommonHttpFeatures IIS-HttpErrors IIS-HttpRedirect IIS-ApplicationDevelopment IIS-NetFxExtensibility IIS-NetFxExtensibility45 IIS-HealthAndDiagnostics IIS-HttpLogging IIS-LoggingLibraries IIS-RequestMonitor IIS-HttpTracing IIS-Security IIS-URLAuthorization IIS-RequestFiltering IIS-IPSecurity IIS-Performance IIS-HttpCompressionDynamic IIS-WebServerManagementTools IIS-ManagementScriptingTools IIS-IIS6ManagementCompatibility IIS-Metabase WAS-WindowsActivationService WAS-ProcessModel WAS-ConfigurationAPI IIS-HostableWebCore IIS-CertProvider IIS-WindowsAuthentication IIS-DigestAuthentication IIS-ClientCertificateMappingAuthentication IIS-IISCertificateMappingAuthentication IIS-ODBCLogging IIS-StaticContent IIS-DefaultDocument IIS-DirectoryBrowsing IIS-WebDAV IIS-WebSockets IIS-ApplicationInit IIS-ASPNET IIS-ASPNET45 IIS-ASP IIS-CGI IIS-ISAPIExtensions IIS-ISAPIFilter IIS-ServerSideIncludes IIS-CustomLogging IIS-BasicAuthentication IIS-HttpCompressionStatic IIS-ManagementConsole IIS-ManagementService IIS-WMICompatibility IIS-LegacyScripts IIS-LegacySnapIn IIS-FTPServer IIS-FTPSvc IIS-FTPExtensibility MSMQ-Container MSMQ-Server MSMQ-Triggers MSMQ-ADIntegration MSMQ-HTTP MSMQ-Multicast MSMQ-DCOMProxy WCF-HTTP-Activation45 WCF-TCP-Activation45 WCF-Pipe-Activation45 WCF-MSMQ-Activation45 WCF-HTTP-Activation WCF-NonHTTP-Activation Microsoft-Windows-MobilePC-Client-Premium-Package-net Printing-XPSServices-Features Printing-Foundation-Features Printing-Foundation-InternetPrinting-Client RasCMAK RasRip MSRDC-Infrastructure TelnetClient TelnetServer TFTP TIFFIFilter WorkFolders-Client SMB1Protocol SMB1Protocol-Client SMB1Protocol-Server SMB2Protocol Microsoft-Hyper-V-All Microsoft-Hyper-V-Tools-All Microsoft-Hyper-V Microsoft-Hyper-V-Management-Clients Microsoft-Hyper-V-Management-PowerShell MFaxServicesClientPackage MediaPlayback LegacyComponents Printing-PrintToPDFServices-Features Printing-Foundation-Features SmbDirect"

:: Loop through the list of features and disable them if not already disabled
for %%a in (%features_to_disable%) do (
  for /f "tokens=2 delims=: " %%b in ('DISM /Online /Get-FeatureInfo /FeatureName:%%a ^| findstr State') do (
    if "%%b" neq "Disabled" (
      echo Disabling feature: %%a
      DISM /Online /Disable-Feature /featurename:%%a /Remove /NoRestart
    )
  )
)

echo Feature disabling completed.
pause
