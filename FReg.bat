@echo off
set black=[30m
set red=[31m
set green=[32m
set yellow=[33m
set blue=[34m
set magenta=[35m
set cyan=[36m
set white=[37m
@Title Import REG
mode con:cols=75 lines=40
color 6
cls

echo.
echo  1/%Red%5%Yellow%
echo.
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ValidateAdminCodeSignatures" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKCR\*\shell\runas" /v "MUIVerb" /t REG_SZ /d "Grant Admin Full Control" /f
Reg.exe add "HKCR\*\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKCR\*\shell\runas" /v "icon" /t REG_SZ /d "%SystemRoot%\system32\imageres.dll ,73" /f
Reg.exe add "HKCR\*\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
Reg.exe add "HKCR\*\shell\runas\command" /v "IsolatedCommand" /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
Reg.exe add "HKCR\exefile\shell\runas2" /ve /t REG_SZ /d "Grant Admin Full Control" /f
Reg.exe add "HKCR\exefile\shell\runas2" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKCR\exefile\shell\runas2" /v "icon" /t REG_SZ /d "%SystemRoot%\system32\imageres.dll ,73" /f
Reg.exe add "HKCR\exefile\shell\runas2\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
Reg.exe add "HKCR\exefile\shell\runas2\command" /v "IsolatedCommand" /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
Reg.exe add "HKCR\Directory\shell\runas" /ve /t REG_SZ /d "Grant Admin Full Control" /f
Reg.exe add "HKCR\Directory\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\shell\runas" /v "icon" /t REG_SZ /d "%SystemRoot%\system32\imageres.dll ,73" /f
Reg.exe add "HKCR\Directory\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t" /f
Reg.exe add "HKCR\Directory\shell\runas\command" /v "IsolatedCommand" /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t" /f

@timeout /t 01>nul
cd /d %~dp0
color 6

echo.
echo  2/%Red%5%Yellow%
echo.
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "00000003" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "00000003" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "CursorBlinkRate" /t REG_SZ /d "-1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/Main" /v "Enabled" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/PfApLog" /v "Enabled" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/StoreLog" /v "Enabled" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d "00000004" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableAppUpdate" /t REG_DWORD /d "00000001" /f

@timeout /t 01>nul
cd /d %~dp0
color 6

echo.
echo  3/%Red%5%Yellow%
echo.
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "00000001" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "00000001" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "00000032" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "00000032" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "00000001" /f
Reg.exe add HKEY_CLASSES_ROOT\.bat\ShellNew /v NullFile /t REG_SZ /f

@timeout /t 01>nul
cd /d %~dp0
color 6

echo.
echo  4/%Red%5%Yellow%
echo.
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "00000003" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "00000003" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "CursorBlinkRate" /t REG_SZ /d "-1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/Main" /v "Enabled" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/PfApLog" /v "Enabled" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/StoreLog" /v "Enabled" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d "00000004" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableAppUpdate" /t REG_DWORD /d "00000001" /f

timeout /t 01>nul
cd /d %~dp0
color 6

echo.
echo  5/%Red%5%Yellow%
echo.
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "00000001" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "00000001" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "00000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "00000032" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "00000032" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "00000001" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "00000038" /f
Reg.exe add HKEY_CLASSES_ROOT\.bat\ShellNew /v NullFile /t REG_SZ /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "1" /f
netsh int tcp set global autotuninglevel=normal
netsh interface tcp set global autotuninglevel=normal
timeout /t 01>nul