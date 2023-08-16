:: Disabled scheduled apps tasks
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\Schedule Scan' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\UpdateModelTask' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\USO_UxBroker' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\Report policies' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\UUS Failover Task' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\Refresh Settings' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\Schedule work' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\Start Oobe Expedite Work' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScan' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScanAfterUpdate' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\StartOobeAppsScan_LicenseAccepted' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work' /f"
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\UpdateOrchestrator\Schedule Maintenance Work' /f"

:: Deleting this task, it comes back after restart. Even if disabled, it comes back at some point. Same as Windows update services. Fix needed.
call %~dp0\..\optional_helpers\run_minsudo "powershell schtasks /delete /tn 'Microsoft\Windows\WindowsUpdate\Scheduled Start' /f"

schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\ProgramDataUpdater" /f
schtasks /delete /tn "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /f
schtasks /delete /tn "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /f
schtasks /delete /tn "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /f
schtasks /delete /tn "Microsoft\Windows\Shell\FamilySafetyMonitor" /f
schtasks /delete /tn "Microsoft\Windows\Shell\FamilySafetyRefresh" /f
schtasks /delete /tn "Microsoft\Windows\Shell\FamilySafetyUpload" /f
schtasks /delete /tn "Microsoft\Windows\Autochk\Proxy" /f
schtasks /delete /tn "Microsoft\Windows\Maintenance\WinSAT" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\AitAgent" /f
schtasks /delete /tn "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /f
schtasks /delete /tn "Microsoft\Windows\FileHistory\File History (maintenance mode)" /f
schtasks /delete /tn "Microsoft\Windows\PI\Sqm-Tasks" /f
schtasks /delete /tn "Microsoft\Windows\AppID\SmartScreenSpecific" /f
schtasks /delete /tn "Microsoft\Windows\SettingSync\BackgroundUploadTask" /f
schtasks /delete /tn "Microsoft\Windows\AppID\SmartScreenSpecific" /f
schtasks /delete /tn "Microsoft\Windows\ApplicationData\CleanupTemporaryState" /f
schtasks /delete /tn "Microsoft\Windows\ApplicationData\DsSvcCleanup" /f
schtasks /delete /tn "Microsoft\Windows\ApplicationData\appuriverifierinstall" /f
schtasks /delete /tn "Microsoft\Windows\ApplicationData\appuriverifierdaily" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\AitAgent" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\ProgramDataUpdater" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\StartupAppTask" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\PcaPatchDbTask" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\HypervisorFlightingTask" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /f
schtasks /delete /tn "Microsoft\Windows\Diagnosis\Scheduled" /f
schtasks /delete /tn "Microsoft\Windows\DiskFootprint\Diagnostics" /f
schtasks /delete /tn "Microsoft\Windows\DiskFootprint\StorageSense" /f
schtasks /delete /tn "Microsoft\Windows\ErrorDetails\EnableErrorDetailsUpdate" /f
schtasks /delete /tn "Microsoft\Windows\Feedback\Siuf\DmClient" /f
schtasks /delete /tn "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /f
schtasks /delete /tn "Microsoft\Windows\File Classification Infrastructure\Property Definition Sync" /f
schtasks /delete /tn "Microsoft\Windows\Management\Provisioning\Logon" /f
schtasks /delete /tn "Microsoft\Windows\Maps\MapsToastTask" /f
schtasks /delete /tn "Microsoft\Windows\Maps\MapsUpdateTask" /f
schtasks /delete /tn "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /f
schtasks /delete /tn "Microsoft\Windows\Multimedia\SystemSoundsService" /f
schtasks /delete /tn "Microsoft\Windows\NlaSvc\WiFiTask" /f
schtasks /delete /tn "Microsoft\Windows\NetCfg\BindingWorkItemQueueHandler" /f
schtasks /delete /tn "Microsoft\Windows\NetTrace\GatherNetworkInfo" /f
schtasks /delete /tn "Microsoft\Windows\Offline Files\Background Synchronization" /f
schtasks /delete /tn "Microsoft\Windows\Offline Files\Logon Synchronization" /f
schtasks /delete /tn "Microsoft\Windows\PI\Sqm-Tasks" /f
schtasks /delete /tn "Microsoft\Windows\Ras\MobilityManager" /f
schtasks /delete /tn "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /f
schtasks /delete /tn "Microsoft\Windows\Servicing\StartComponentCleanup" /f
schtasks /delete /tn "Microsoft\Windows\Shell\FamilySafetyMonitor" /f
schtasks /delete /tn "Microsoft\Windows\Shell\FamilySafetyRefresh" /f
schtasks /delete /tn "Microsoft\Windows\SpacePort\SpaceAgentTask" /f
schtasks /delete /tn "Microsoft\Windows\SpacePort\SpaceManagerTask" /f
schtasks /delete /tn "Microsoft\Windows\Speech\SpeechModelDownloadTask" /f
schtasks /delete /tn "Microsoft\Windows\User Profile Service\HiveUploadTask" /f
schtasks /delete /tn "Microsoft\Windows\WCM\WiFiTask" /f
schtasks /delete /tn "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /f
schtasks /delete /tn "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /f
schtasks /delete /tn "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /f
schtasks /delete /tn "Microsoft\Windows\Windows Defender\Windows Defender Verification" /f
schtasks /delete /tn "Microsoft\Windows\Windows Error Reporting\QueueReporting" /f
schtasks /delete /tn "Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /f
schtasks /delete /tn "Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /f
schtasks /delete /tn "Microsoft\Windows\Wininet\CacheTask" /f
schtasks /delete /tn "Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /f
schtasks /delete /tn "Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /f
schtasks /delete /tn "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /f
schtasks /delete /tn "Microsoft\XblGameSave\XblGameSaveTask" /f
schtasks /delete /tn "Microsoft\XblGameSave\XblGameSaveTaskLogon" /f
schtasks /delete /tn "Driver Easy Scheduled Scan" /f
schtasks /delete /tn "Microsoft\Office\OfficeTelemetryAgentFallBack2016" /f
schtasks /delete /tn "Microsoft\Office\OfficeTelemetryAgentLogOn2016" /f
schtasks /delete /tn "Microsoft\Office\Office ClickToRun Service Monitor" /f
schtasks /delete /tn "Microsoft\Office\OfficeTelemetryAgentLogOn" /f
schtasks /delete /tn "Microsoft\Office\OfficeTelemetryAgentFallBack" /f
schtasks /delete /tn "Microsoft\Office\Office 15 Subscription Heartbeat" /f
schtasks /delete /tn "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /f
schtasks /delete /tn "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /f
schtasks /delete /tn "Microsoft\Windows\HelloFace\FODCleanupTask" /f
schtasks /delete /tn "Microsoft\Windows\Defrag\ScheduledDefrag" /f
schtasks /delete /tn "Microsoft\Windows\Clip\License Validation" /f
schtasks /delete /tn "Microsoft\Windows\Device Information\Device" /f
schtasks /delete /tn "Microsoft\Windows\Device Information\Device User" /f
schtasks /delete /tn "Microsoft\Windows\PerfTrack\BackgroundConfigSurveyor" /f
schtasks /delete /tn "Microsoft\Windows\Location\Notifications" /f
schtasks /delete /tn "Microsoft\Windows\Location\WindowsActionDialog" /f
schtasks /delete /tn "Microsoft\Windows\Retail Demo\CleanupOfflineContent" /f
schtasks /delete /tn "Microsoft\Windows\Shell\FamilySafetyRefreshTask" /f
schtasks /delete /tn "Microsoft\Windows\UPnP\UPnPHostConfig" /f
schtasks /delete /tn "Microsoft\Windows\WaaSMedic\PerformRemediation" /f
schtasks /delete /tn "Microsoft\Windows\Time Zone\SynchronizeTimeZone" /f
schtasks /delete /tn "Microsoft\Windows\Time Synchronization\SynchronizeTime" /f
schtasks /delete /tn "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /f
schtasks /delete /tn "Microsoft\Windows\StateRepository\MaintenanceTasks" /f
schtasks /delete /tn "Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskNetwork" /f
schtasks /delete /tn "Microsoft\Windows\Shell\IndexerAutomaticMaintenance" /f
schtasks /delete /tn "Microsoft\Windows\Registry\RegIdleBackup" /f
schtasks /delete /tn "Microsoft\Windows\PushToInstall\LoginCheck" /f
schtasks /delete /tn "Microsoft\Windows\Printing\EduPrintProv" /f
schtasks /delete /tn "Microsoft\Windows\MUI\LPRemove" /f
schtasks /delete /tn "Microsoft\Windows\Management\Provisioning\Cellular" /f
schtasks /delete /tn "Microsoft\Windows\InstallService\SmartRetry" /f
schtasks /delete /tn "Microsoft\Windows\InstallService\ScanForUpdatesAsUser" /f
schtasks /delete /tn "Microsoft\Windows\InstallService\ScanForUpdates" /f
schtasks /delete /tn "Microsoft\Windows\DiskCleanup\SilentCleanup" /f
schtasks /delete /tn "Microsoft\Windows\Device Setup\Metadata Refresh" /f
schtasks /delete /tn "Microsoft\Windows\BrokerInfrastructure\BgTaskRegistrationMaintenanceTask" /f
schtasks /delete /tn "AMDInstallLauncher" /f
schtasks /delete /tn "AMDLinkUpdate" /f
schtasks /delete /tn "AMDRyzenMasterSDKTask" /f
schtasks /delete /tn "DUpdaterTask" /f
schtasks /delete /tn "ModifyLinkUpdate" /f
schtasks /delete /tn "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319" /f
schtasks /delete /tn "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64" /f
schtasks /delete /tn "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical" /f
schtasks /delete /tn "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical" /f
schtasks /delete /tn "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /f
schtasks /delete /tn "Microsoft\Windows\DUSM\dusmtask" /f
schtasks /delete /tn "Microsoft\Windows\EnterpriseMgmt\MDMMaintenenceTask" /f
schtasks /delete /tn "Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /f
schtasks /delete /tn "Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" /f
schtasks /delete /tn "Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" /f
schtasks /delete /tn "Microsoft\Windows\Flighting\OneSettings\RefreshCache" /f
schtasks /delete /tn "Microsoft\Windows\Input\LocalUserSyncDataAvailable" /f
schtasks /delete /tn "Microsoft\Windows\Input\MouseSyncDataAvailable" /f
schtasks /delete /tn "Microsoft\Windows\Input\PenSyncDataAvailable" /f
schtasks /delete /tn "Microsoft\Windows\Input\TouchpadSyncDataAvailable" /f
schtasks /delete /tn "Microsoft\Windows\International\Synchronize Language Settings" /f
schtasks /delete /tn "Microsoft\Windows\LanguageComponentsInstaller\Installation" /f
schtasks /delete /tn "Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /f
schtasks /delete /tn "Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /f
schtasks /delete /tn "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /f
schtasks /delete /tn "Microsoft\Windows\Printing\PrinterCleanupTask" /f
schtasks /delete /tn "Microsoft\Windows\PushToInstall\Registration" /f
schtasks /delete /tn "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /f
schtasks /delete /tn "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /f
schtasks /delete /tn "Microsoft\Windows\Setup\SetupCleanupTask" /f
schtasks /delete /tn "Microsoft\Windows\Setup\SnapshotCleanupTask" /f
schtasks /delete /tn "Microsoft\Windows\Storage Tiers Management\Storage Tiers Management Initialization" /f
schtasks /delete /tn "Microsoft\Windows\Sysmain\ResPriStaticDbSync" /f
schtasks /delete /tn "Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /f
schtasks /delete /tn "Microsoft\Windows\Task Manager\Interactive" /f
schtasks /delete /tn "Microsoft\Windows\TPM\Tpm-HASCertRetr" /f
schtasks /delete /tn "Microsoft\Windows\TPM\Tpm-Maintenance" /f
schtasks /delete /tn "Microsoft\Windows\WDI\ResolutionHost" /f
schtasks /delete /tn "Microsoft\Windows\WlanSvc\CDSSync" /f
schtasks /delete /tn "Microsoft\Windows\WOF\WIM-Hash-Management" /f
schtasks /delete /tn "Microsoft\Windows\WOF\WIM-Hash-Validation" /f
schtasks /delete /tn "Microsoft\Windows\WwanSvc\NotificationTask" /f
schtasks /delete /tn "Microsoft\Windows\WwanSvc\OobeDiscovery" /f
schtasks /delete /tn "MicrosoftEdgeUpdateTaskMachineUA" /f
schtasks /delete /tn "MicrosoftEdgeUpdateTaskMachineCore" /f
schtasks /delete /tn "Microsoft\Windows\DirectX\DirectXDatabaseUpdater" /f
schtasks /delete /tn "Microsoft\Windows\BitLocker\BitLocker Encrypt All Drives" /f
schtasks /delete /tn "Microsoft\Windows\BitLocker\BitLocker MDM policy Refresh" /f
schtasks /delete /tn "Microsoft\Windows\DirectX\DXGIAdapterCache" /f
schtasks /delete /tn "Microsoft\Windows\USB\Usb-Notifications" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\IntegrityCheck" /f
schtasks /delete /tn "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /f
schtasks /delete /tn "Microsoft\Windows\Chkdsk\SyspartRepair" /f
schtasks /delete /tn "Microsoft\Windows\AppID\EDPPolicyManager" /f
schtasks /delete /tn "Microsoft\Windows\AppListBackup\Backup" /f
schtasks /delete /tn "Microsoft\Windows\Bluetooth\UninstallDeviceTask" /f
schtasks /delete /tn "Microsoft\Windows\Chkdsk\ProactiveScan" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\HandleCommand" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\HandleWnsCommand" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\LocateCommandUserSession" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceAccountChange" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePolicyChange" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceProtectionStateChanged" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceSettingChange" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\RegisterUserDevice" /f
schtasks /delete /tn "Microsoft\Windows\CertificateServicesClient\SystemTask" /f
schtasks /delete /tn "Microsoft\Windows\CertificateServicesClient\UserTask" /f
schtasks /delete /tn "Microsoft\Windows\CertificateServicesClient\UserTask-Roam" /f
schtasks /delete /tn "Microsoft\Windows\EDP\EDPAppLaunchTask" /f
schtasks /delete /tn "Microsoft\Windows\EDP\EDPAuthTask" /f
schtasks /delete /tn "Microsoft\Windows\EDP\EDPInaccessibleCredentialsTask" /f
schtasks /delete /tn "Microsoft\Windows\EDP\StorageCardEncryptionTask" /f
schtasks /delete /tn "Microsoft\Windows\Shell\CreateObjectTask" /f
schtasks /delete /tn "Microsoft\Windows\Shell\ThemesSyncedImageDownload" /f
schtasks /delete /tn "Microsoft\Windows\Shell\UpdateUserPictureTask" /f
schtasks /delete /tn "Microsoft\Windows\TaskScheduler\Maintenance Configurator" /f
schtasks /delete /tn "Microsoft\Windows\WindowsColorSystem\Calibration Loader" /f
schtasks /delete /tn "Microsoft\Windows\Printing\PrintJobCleanupTask" /f
schtasks /delete /tn "Microsoft\Windows\InstallService\WakeUpAndContinueUpdates" /f
schtasks /delete /tn "Microsoft\Windows\InstallService\WakeUpAndScanForUpdates" /f
schtasks /delete /tn "Microsoft\Windows\Input\InputSettingsRestoreDataAvailable" /f
schtasks /delete /tn "Microsoft\Windows\Input\syncpensettings" /f

schtasks /change /tn "CreateExplorerShellUnelevatedTask" /enable
:: schtasks /change /tn "Microsoft\Windows\TextServicsFramework\MsCtfMonitor" /enable :: (keylogger) is required to be able to type within Settings and etc
:: schtasks /change /tn "Microsoft\Windows\RecoveryEnvironment\VerifyWinRE" /enable :: Leave this ON to diagnostic problems on boot


del /F /Q "C:\Windows\System32\Tasks\Microsoft\Windows\SettingSync\*"