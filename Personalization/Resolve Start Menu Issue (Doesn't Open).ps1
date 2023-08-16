$package = Get-AppxPackage Microsoft.Windows.ShellExperienceHost
Add-AppxPackage -Register $package.InstallLocation\AppxManifest.xml -DisableDevelopmentMode
