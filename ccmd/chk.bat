@echo off
@Title DQS-CHK
setlocal EnableDelayedExpansion
set black=[30m
set red=[91m
set rred=[41m
set green=[32m
set ggreen=[42m
set yellow=[33m
set yyellow=[43m
set blue=[34m
set bblue=[44m
set magenta=[35m
set bmagenta=[45m
set cyan=[36m
set white=[37m
set defcolor=[49m
set gold=[38;5;220m
set grey=[90m
set ggrey=[100m
set orange=[38;5;208m
set indigo=[38;5;105m
SET ERROR=0
SET CULTD=1
SET progress=0
color 7
SET chk_1_1=ERR
SET chk_1_2=ERR
SET chk_1_3=ERR
SET chk_1_4=ERR
SET chk_1_5=ERR
SET chk_1_6=ERR
SET chk_1_7=ERR
SET chk_1_8=ERR
SET chk_1_9=ERR
SET chk_1_10=ERR
SET chk_1_11=ERR
SET chk_1_12=ERR
SET chk_1_13=ERR
SET chk_1_14=ERR
SET chk_1_15=ERR
SET chk_1_16=ERR
SET chk_1_17=ERR
SET chk_1_18=ERR
SET chk_1_19=ERR
SET chk_1_20=ERR
SET chk_1_21=ERR
SET chk_1_22=ERR
SET chk_1_23=ERR
SET chk_1_24=ERR
SET chk_1_25=ERR
SET chk_1_26=ERR
SET chk_1_27=ERR
SET chk_1_28=ERR
SET chk_1_29=ERR
SET chk_1_30=ERR
SET chk_1_31=ERR
SET chk_1_32=ERR
SET chk_1_33=ERR
SET chk_1_34=ERR
SET chk_1_35=ERR
SET chk_1_36=ERR
SET chk_1_37=ERR
SET chk_1_38=ERR
SET chk_1_39=ERR
SET chk_1_40=ERR
SET chk_1_41=ERR
SET chk_1_42=ERR
SET chk_1_43=ERR
SET chk_1_44=ERR
SET chk_1_45=ERR
SET chk_1_46=ERR
SET chk_1_47=ERR
SET chk_1_48=ERR
SET chk_1_49=ERR
SET chk_1_50=ERR
SET chk_1_51=ERR
SET chk_1_52=ERR
SET chk_1_53=ERR
SET chk_1_54=ERR
SET chk_1_55=ERR
SET chk_1_56=ERR
SET chk_1_57=ERR
SET chk_1_58=ERR
SET chk_1_59=ERR
SET chk_1_60=ERR
SET chk_1_61=ERR
SET chk_1_62=ERR
SET chk_1_63=ERR
SET chk_1_64=ERR
SET chk_1_65=ERR
SET chk_1_66=ERR
cls

REM ###---------FILES_1-----------------------------------------------------------------------------------###

call :bar 1
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Control\BootControl" /v "BootProgressAnimation"') DO set chk_1_1=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness"') DO set chk_1_2=%%a >NUL 2>nul
for /f %%A in ('powershell.exe -File "ccm\GetGPUPriority.ps1" 2^> $null') do set chk_1_3=%%A
call :bar 2
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority"') DO set chk_1_4=%%a >NUL 2>nul
for /f %%A in ('powershell.exe -File "ccm\Scheduling.ps1" 2^> $null') do set chk_1_5=%%A
call :bar 3
for /f %%A in ('powershell.exe -File "ccm\SFIO.ps1" 2^> $null') do set chk_1_6=%%A
call :bar 4
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn"') DO set chk_1_7=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex"') DO set chk_1_8=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode"') DO set chk_1_9=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize"') DO set chk_1_10=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize"') DO set chk_1_11=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers"') DO set chk_1_12=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation"') DO set chk_1_13=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate"') DO set chk_1_14=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Control\Session Manager" /v "HeapDeCommitFreeBlockThreshold"') DO set chk_1_15=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled"') DO set chk_1_16=%%a >NUL 2>nul
call :bar 5
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut"') DO set chk_1_17=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled"') DO set chk_1_18=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled"') DO set chk_1_19=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions"') DO set chk_1_20=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\System\ControlSet001\Control\Session Manager\kernel" /v "MitigationOptions"') DO set chk_1_21=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\System\ControlSet002\Control\Session Manager\kernel" /v "MitigationOptions"') DO set chk_1_22=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe" /v "MitigationAuditOptions"') DO set chk_1_23=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe" /v "MitigationOptions"') DO set chk_1_24=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity"') DO set chk_1_25=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Internet Explorer\Main" /v "DEPOff"') DO set chk_1_26=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoDataExecutionPrevention"') DO set chk_1_27=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Windows\System" /v "DisableHHDEP"') DO set chk_1_28=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Microsoft\PolicyManager\default\DmaGuard\DeviceEnumerationPolicy" /v "value"') DO set chk_1_29=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\FVE" /v "DisableExternalDMAUnderLock"') DO set chk_1_30=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired"') DO set chk_1_31=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground"') DO set chk_1_32=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle"') DO set chk_1_33=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Biometrics" /v "Enabled"') DO set chk_1_34=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory"') DO set chk_1_35=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled"') DO set chk_1_36=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable"') DO set chk_1_37=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Internet Explorer\SQM" /v "DisableCustomerImprovementProgram"') DO set chk_1_38=%%a >NUL 2>nul
call :bar 6
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable"') DO set chk_1_39=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\AppV\CEIP" /v "CEIPEnable"') DO set chk_1_40=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Messenger\Client" /v "CEIP"') DO set chk_1_41=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\MSDeploy\3" /v "EnableTelemetry"') DO set chk_1_42=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled"') DO set chk_1_43=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection"') DO set chk_1_44=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection"') DO set chk_1_45=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing"') DO set chk_1_46=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports"') DO set chk_1_47=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy"') DO set chk_1_48=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy"') DO set chk_1_49=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled"') DO set chk_1_50=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect"') DO set chk_1_51=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Control Panel\Desktop" /v "DragFullWindows"') DO set chk_1_52=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\GameBar" /v "GamepadDoublePressIntervalMs"') DO set chk_1_53=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled"') DO set chk_1_54=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution"') DO set chk_1_55=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControl"') DO set chk_1_56=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Policies\Microsoft\MRT" /v "DontReportInfectionInformation"') DO set chk_1_57=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\Software\Microsoft\Input\Settings" /v "HarvestContacts"') DO set chk_1_58=%%a >NUL 2>nul
call :bar 7
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent"') DO set chk_1_59=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControlEnabled"') DO set chk_1_60=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultConsent"') DO set chk_1_61=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions"') DO set chk_1_62=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUPowerManagement"') DO set chk_1_63=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "IncludeRecommendedUpdates"') DO set chk_1_64=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate"') DO set chk_1_65=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests"') DO set chk_1_66=%%a >NUL 2>nul
IF EXIST $null DEL $null >NUL 2>nul
cls
call :bar 8
REM ###---------FILES_1-----------------------------------------------------------------------------------###

IF %chk_1_1%==0x1 (
	echo BootProgressAnimation = Correct registry key>err.log
) else (
	echo BootProgressAnimation = Incorrect registry key>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_2%==0x0 (
	echo SystemResponsiveness = Correct registry key>>err.log
) else (
	echo SystemResponsiveness = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_3%==8 (
	echo GPU Priority = Correct registry key>>err.log
) else (
	echo GPU Priority = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_4%==0x6 (
	echo Priority = Correct registry key>>err.log
) else (
	echo Priority = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_5%==High (
	echo Scheduling Category = Correct registry key>>err.log
) else (
	echo Scheduling Category = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_6%==High (
	echo SFIO Priority = Correct registry key>>err.log
) else (
	echo SFIO Priority = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_7%==0x1 (
	echo AlwaysOn = Correct registry key>>err.log
) else (
	echo AlwaysOn = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_8%==0xffffffff (
	echo NetworkThrottlingIndex = Correct registry key>>err.log
) else (
	echo NetworkThrottlingIndex = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_9%==0x1 (
	echo NoLazyMode = Correct registry key>>err.log
) else (
	echo NoLazyMode = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_10%==0x18 (
	echo KeyboardDataQueueSize = Correct registry key>>err.log
) else (
	echo KeyboardDataQueueSize = Custom registry key>>err.log
)

IF %chk_1_11%==0x18 (
	echo MouseDataQueueSize = Correct registry key>>err.log
) else (
	echo MouseDataQueueSize = Custom registry key>>err.log
)

IF %chk_1_12%==0x1 (
	echo DoNotHoldNicBuffers = Correct registry key>>err.log
) else (
	echo DoNotHoldNicBuffers = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_13%==0x6 (
	echo Win32PrioritySeparation = Correct registry key>>err.log
) else (
	echo Win32PrioritySeparation = Custom registry key>>err.log
)

IF %chk_1_14%==0 (
	echo MinAnimate = Correct registry key>>err.log
) else (
	echo MinAnimate = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_15%==0x0 (
	echo HeapDeCommitFreeBlockThreshold = Correct registry key>>err.log
) else (
	echo HeapDeCommitFreeBlockThreshold = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_16%==0x1 (
	echo GlobalUserDisabled = Correct registry key>>err.log
) else (
	echo GlobalUserDisabled = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_17%==0x1 (
	echo HttpAcceptLanguageOptOut = Correct registry key>>err.log
) else (
	echo HttpAcceptLanguageOptOut = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_18%==0x0 (
	echo AppCaptureEnabled = Correct registry key>>err.log
) else (
	echo AppCaptureEnabled = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_19%==0x0 (
	echo HistoricalCaptureEnabled = Correct registry key>>err.log
) else (
	echo HistoricalCaptureEnabled = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_20%==222222222222222222222222222222222222222222222222 (
	echo MitigationOptions = Correct registry key>>err.log
) else (
	echo MitigationOptions = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_21%==222222222222222222222222222222222222222222222222 (
	echo MitigationOptions = Correct registry key>>err.log
) else (
	echo MitigationOptions = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_22%==222222222222222222222222222222222222222222222222 (
	echo MitigationOptions = Correct registry key>>err.log
) else (
	echo MitigationOptions = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_23%==222222222222222222222222222222222222222222222222 (
	echo MitigationAuditOptions = Correct registry key>>err.log
) else (
	echo MitigationAuditOptions = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_24%==222222222222222222222222222222222222222222222222 (
	echo MitigationOptions = Correct registry key>>err.log
) else (
	echo MitigationOptions = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_25%==0x0 (
	echo EnableVirtualizationBasedSecurity = Correct registry key>>err.log
) else (
	echo EnableVirtualizationBasedSecurity = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_26%==0x1 (
	echo DEPOff = Correct registry key>>err.log
) else (
	echo DEPOff = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_27%==0x1 (
	echo NoDataExecutionPrevention = Correct registry key>>err.log
) else (
	echo NoDataExecutionPrevention = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_28%==0x1 (
	echo DisableHHDEP = Correct registry key>>err.log
) else (
	echo DisableHHDEP = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_29%==0x2 (
	echo value = Correct registry key>>err.log
) else (
	echo value = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_30%==0x0 (
	echo DisableExternalDMAUnderLock = Correct registry key>>err.log
) else (
	echo DisableExternalDMAUnderLock = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_31%==0x0 (
	echo HVCIMATRequired = Correct registry key>>err.log
) else (
	echo HVCIMATRequired = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_32%==0x2 (
	echo LetAppsRunInBackground = Correct registry key>>err.log
) else (
	echo LetAppsRunInBackground = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_33%==0x0 (
	echo BackgroundAppGlobalToggle = Correct registry key>>err.log
) else (
	echo BackgroundAppGlobalToggle = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_34%==0x0 (
	echo Enabled = Correct registry key>>err.log
) else (
	echo Enabled = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_35%==0x1 (
	echo DisableInventory = Correct registry key>>err.log
) else (
	echo DisableInventory = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_36%==0x1 (
	echo Disabled = Correct registry key>>err.log
) else (
	echo Disabled = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_37%==0x0 (
	echo AITEnable = Correct registry key>>err.log
) else (
	echo AITEnable = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_38%==0x0 (
	echo DisableCustomerImprovementProgram = Correct registry key>>err.log
) else (
	echo DisableCustomerImprovementProgram = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_39%==0x0 (
	echo CEIPEnable = Correct registry key>>err.log
) else (
	echo CEIPEnable = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_40%==0x0 (
	echo CEIPEnable = Correct registry key>>err.log
) else (
	echo CEIPEnable = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)
call :bar 9
IF %chk_1_41%==0x2 (
	echo CEIP = Correct registry key>>err.log
) else (
	echo CEIP = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_42%==0x1 (
	echo EnableTelemetry = Correct registry key>>err.log
) else (
	echo EnableTelemetry = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_43%==0x0 (
	echo Enabled = Correct registry key>>err.log
) else (
	echo Enabled = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_44%==0x1 (
	echo RestrictImplicitTextCollection = Correct registry key>>err.log
) else (
	echo RestrictImplicitTextCollection = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_45%==0x1 (
	echo RestrictImplicitInkCollection = Correct registry key>>err.log
) else (
	echo RestrictImplicitInkCollection = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_46%==0x1 (
	echo PreventHandwritingDataSharing = Correct registry key>>err.log
) else (
	echo PreventHandwritingDataSharing = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)


IF %chk_1_47%==0x1 (
	echo PreventHandwritingErrorReports = Correct registry key>>err.log
) else (
	echo PreventHandwritingErrorReports = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_48%==0x0 (
	echo AcceptedPrivacyPolicy = Correct registry key>>err.log
) else (
	echo AcceptedPrivacyPolicy = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_49%==0x1 (
	echo DisabledByGroupPolicy = Correct registry key>>err.log
) else (
	echo DisabledByGroupPolicy = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_50%==0x0 (
	echo Enabled = Correct registry key>>err.log
) else (
	echo Enabled = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_51%==0x1 (
	echo ListviewAlphaSelect = Correct registry key>>err.log
) else (
	echo ListviewAlphaSelect = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_52%==1 (
	echo DragFullWindows = Correct registry key>>err.log
) else (
	echo DragFullWindows = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_53%==0x0 (
	echo GamepadDoublePressIntervalMs = Correct registry key>>err.log
) else (
	echo GamepadDoublePressIntervalMs = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_54%==0x0 (
	echo UseNexusForGameBarEnabled = Correct registry key>>err.log
) else (
	echo UseNexusForGameBarEnabled = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_55%==0x0 (
	echo EnabledExecution = Correct registry key>>err.log
) else (
	echo EnabledExecution = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_56%==Anywhere (
	echo ConfigureAppInstallControl = Correct registry key>>err.log
) else (
	echo ConfigureAppInstallControl = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_57%==0x1 (
	echo DontReportInfectionInformation = Correct registry key>>err.log
) else (
	echo DontReportInfectionInformation = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_58%==0x0 (
	echo HarvestContacts = Correct registry key>>err.log
) else (
	echo HarvestContacts = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_59%==0x0 (
	echo SubmitSamplesConsent = Correct registry key>>err.log
) else (
	echo SubmitSamplesConsent = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_60%==0x0 (
	echo ConfigureAppInstallControlEnabled = Correct registry key>>err.log
) else (
	echo ConfigureAppInstallControlEnabled = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_61%==0x1 (
	echo DefaultConsent = Correct registry key>>err.log
) else (
	echo DefaultConsent = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_62%==0x2 (
	echo AUOptions = Correct registry key>>err.log
) else (
	echo AUOptions = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_63%==0x0 (
	echo AUPowerManagement = Correct registry key>>err.log
) else (
	echo AUPowerManagement = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_64%==0x0 (
	echo IncludeRecommendedUpdates = Correct registry key>>err.log
) else (
	echo IncludeRecommendedUpdates = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_65%==0x1 (
	echo NoAutoUpdate = Correct registry key>>err.log
) else (
	echo NoAutoUpdate = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)

IF %chk_1_66%==0x1 (
	echo GlobalTimerResolutionRequests = Correct registry key>>err.log
) else (
	echo GlobalTimerResolutionRequests = Incorrect registry key>>err.log
	SET /a ERROR=%ERROR%+1
)
call :bar 10
IF %chk_1_1%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_2%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_3%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_4%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_5%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_6%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_7%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_8%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_9%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_10%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_11%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_12%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_13%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_14%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_15%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_16%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_17%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_18%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_19%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_20%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_21%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_22%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_23%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_24%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_25%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_26%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_27%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_28%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_29%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_30%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_31%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_32%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_33%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_34%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_35%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_36%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_37%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_38%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_39%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_40%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_41%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_42%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_43%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_44%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_45%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_46%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_47%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_48%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_49%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_50%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_51%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_52%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_53%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_54%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_55%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_56%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_57%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_58%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_59%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_60%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_61%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_62%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_63%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_64%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_65%==ERR SET /a ERROR=%ERROR%-1
IF %chk_1_66%==ERR SET /a ERROR=%ERROR%-1
call :bar 11
goto :PGG2

:bar
set "progress=%1"
set "bar="
for /L %%A in (1, 1, 40) do (
    if %%A leq %progress% (
        set "bar=!bar!#"
    ) else (
        set "bar=!bar! "
    )
)
cls
echo [!bar!]
exit /b

:PGG2
SET ERROR2=0
SET CULTD=2
color 7
SET chk_2_1=ERR
SET chk_2_2=ERR
SET chk_2_3=ERR
SET chk_2_4=ERR
SET chk_2_5=ERR
SET chk_2_6=ERR
SET chk_2_7=ERR
SET chk_2_8=ERR
SET chk_2_9=ERR
SET chk_2_10=ERR
SET chk_2_11=ERR
SET chk_2_12=ERR
SET chk_2_13=ERR
SET chk_2_14=ERR
SET chk_2_15=ERR
SET chk_2_16=ERR
SET chk_2_17=ERR
SET chk_2_18=ERR
SET chk_2_19=ERR
SET chk_2_20=ERR
SET chk_2_21=ERR
SET chk_2_22=ERR
SET chk_2_23=ERR
SET chk_2_24=ERR
SET chk_2_25=ERR
SET chk_2_26=ERR
SET chk_2_27=ERR
SET chk_2_28=ERR
SET chk_2_29=ERR
SET chk_2_30=ERR
SET chk_2_31=ERR
SET chk_2_32=ERR
SET chk_2_33=ERR
SET chk_2_34=ERR
SET chk_2_35=ERR
SET chk_2_36=ERR
SET chk_2_37=ERR
SET chk_2_38=ERR
SET chk_2_39=ERR
SET chk_2_40=ERR
SET chk_2_41=ERR
SET chk_2_42=ERR

REM ###---------FILES_2-----------------------------------------------------------------------------------###

for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization"') DO set chk_2_1=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection"') DO set chk_2_2=%%a >NUL 2>nul
call :bar 12
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop"') DO set chk_2_3=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA"') DO set chk_2_4=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths"') DO set chk_2_5=%%a >NUL 2>nul
call :bar 13
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin"') DO set chk_2_6=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ValidateAdminCodeSignatures"') DO set chk_2_7=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle"') DO set chk_2_8=%%a >NUL 2>nul
call :bar 14
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser"') DO set chk_2_9=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken"') DO set chk_2_10=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride"') DO set chk_2_11=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask"') DO set chk_2_12=%%a >NUL 2>nul
call :bar 15
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Control Panel\Desktop" /v "MenuShowDelay"') DO set chk_2_13=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Control Panel\Desktop" /v "CursorBlinkRate"') DO set chk_2_14=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher"') DO set chk_2_15=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher"') DO set chk_2_16=%%a >NUL 2>nul
call :bar 16
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/Main" /v "Enabled"') DO set chk_2_17=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/PfApLog" /v "Enabled"') DO set chk_2_18=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/StoreLog" /v "Enabled"') DO set chk_2_19=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Ndu" /v "Start"') DO set chk_2_20=%%a >NUL 2>nul
call :bar 17
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown"') DO set chk_2_21=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana"') DO set chk_2_22=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch"') DO set chk_2_23=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb"') DO set chk_2_24=%%a >NUL 2>nul
call :bar 18
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections"') DO set chk_2_25=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch"') DO set chk_2_26=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation"') DO set chk_2_27=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock"') DO set chk_2_28=%%a >NUL 2>nul
call :bar 19
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed"') DO set chk_2_29=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork"') DO set chk_2_30=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate"') DO set chk_2_31=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig"') DO set chk_2_32=%%a >NUL 2>nul
call :bar 20
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption"') DO set chk_2_33=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts"') DO set chk_2_34=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled"') DO set chk_2_35=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\System\GameConfigStore" /v "AllowGameDVR"') DO set chk_2_36=%%a >NUL 2>nul
call :bar 21
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\System\GameConfigStore" /v "GameDVR_Enabled"') DO set chk_2_37=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode"') DO set chk_2_38=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior"') DO set chk_2_39=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode"') DO set chk_2_40=%%a >NUL 2>nul
call :bar 22
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags"') DO set chk_2_41=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible"') DO set chk_2_42=%%a >NUL 2>nul
cls
IF EXIST $null DEL $null >NUL 2>nul

REM ###---------FILES_2-----------------------------------------------------------------------------------###
call :bar 23
IF %chk_2_1%==0x0 (
	echo EnableVirtualization = Correct registry key>>err.log
) else (
	echo EnableVirtualization = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_2%==0x0 (
	echo EnableInstallerDetection = Correct registry key>>err.log
) else (
	echo EnableInstallerDetection = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_3%==0x0 (
	echo PromptOnSecureDesktop = Correct registry key>>err.log
) else (
	echo PromptOnSecureDesktop = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_4%==0x0 (
	echo EnableLUA = Correct registry key>>err.log
) else (
	echo EnableLUA = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_5%==0x0 (
	echo EnableSecureUIAPaths = Correct registry key>>err.log
) else (
	echo EnableSecureUIAPaths = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_6%==0x0 (
	echo ConsentPromptBehaviorAdmin = Correct registry key>>err.log
) else (
	echo ConsentPromptBehaviorAdmin = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_7%==0x0 (
	echo ValidateAdminCodeSignatures = Correct registry key>>err.log
) else (
	echo ValidateAdminCodeSignatures = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_8%==0x0 (
	echo EnableUIADesktopToggle = Correct registry key>>err.log
) else (
	echo EnableUIADesktopToggle = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_9%==0x0 (
	echo ConsentPromptBehaviorUser = Correct registry key>>err.log
) else (
	echo ConsentPromptBehaviorUser = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_10%==0x0 (
	echo FilterAdministratorToken = Correct registry key>>err.log
) else (
	echo FilterAdministratorToken = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_11%==0x3 (
	echo FeatureSettingsOverride = Correct registry key>>err.log
) else (
	echo FeatureSettingsOverride = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_12%==0x3 (
	echo FeatureSettingsOverrideMask = Correct registry key>>err.log
) else (
	echo FeatureSettingsOverrideMask = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_13%==0 (
	echo MenuShowDelay = Correct registry key>>err.log
) else (
	echo MenuShowDelay = Custom registry key>>err.log
)

IF %chk_2_14%==-1 (
	echo CursorBlinkRate = Correct registry key>>err.log
) else (
	echo CursorBlinkRate = Custom registry key>>err.log
)
IF %chk_2_15%==0x0 (
	echo EnablePrefetcher = Correct registry key>>err.log
) else (
	echo EnablePrefetcher = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_16%==0x0 (
	echo EnablePrefetcher = Correct registry key>>err.log
) else (
	echo EnablePrefetcher = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_17%==0x0 (
	echo Enabled = Correct registry key>>err.log
) else (
	echo Enabled = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_18%==0x0 (
	echo Enabled = Correct registry key>>err.log
) else (
	echo Enabled = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_19%==0x0 (
	echo Enabled = Correct registry key>>err.log
) else (
	echo Enabled = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_20%==0x4 (
	echo Start = Correct registry key>>err.log
) else (
	echo Start = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_21%==0x0 (
	echo ClearPageFileAtShutdown = Correct registry key>>err.log
) else (
	echo ClearPageFileAtShutdown = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_22%==0x0 (
	echo AllowCortana = Correct registry key>>err.log
) else (
	echo AllowCortana = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_23%==0x0 (
	echo AllowCloudSearch = Correct registry key>>err.log
) else (
	echo AllowCloudSearch = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_24%==0x0 (
	echo ConnectedSearchUseWeb = Correct registry key>>err.log
) else (
	echo ConnectedSearchUseWeb = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_25%==0x0 (
	echo ConnectedSearchUseWebOverMeteredConnections = Correct registry key>>err.log
) else (
	echo ConnectedSearchUseWebOverMeteredConnections = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_26%==0x1 (
	echo DisableWebSearch = Correct registry key>>err.log
) else (
	echo DisableWebSearch = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_27%==0x0 (
	echo AllowSearchToUseLocation = Correct registry key>>err.log
) else (
	echo AllowSearchToUseLocation = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
call :bar 24

IF %chk_2_28%==0x0 (
	echo AllowCortanaAboveLock = Correct registry key>>err.log
) else (
	echo AllowCortanaAboveLock = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_29%==0x0 (
	echo ModelDownloadAllowed = Correct registry key>>err.log
) else (
	echo ModelDownloadAllowed = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_30%==0x1 (
	echo PreventDeviceMetadataFromNetwork = Correct registry key>>err.log
) else (
	echo PreventDeviceMetadataFromNetwork = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_31%==0x1 (
	echo ExcludeWUDriversInQualityUpdate = Correct registry key>>err.log
) else (
	echo ExcludeWUDriversInQualityUpdate = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_32%==0x0 (
	echo SearchOrderConfig = Correct registry key>>err.log
) else (
	echo SearchOrderConfig = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_33%==0x0 (
	echo EnablePreemption = Correct registry key>>err.log
) else (
	echo EnablePreemption = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_34%==0x0 (
	echo HarvestContacts = Correct registry key>>err.log
) else (
	echo HarvestContacts = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_35%==0x1 (
	echo Enabled = Correct registry key>>err.log
) else (
	echo Enabled = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_36%==0x0 (
	echo AllowGameDVR = Correct registry key>>err.log
) else (
	echo AllowGameDVR = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_37%==0x0 (
	echo GameDVR_Enabled = Correct registry key>>err.log
) else (
	echo GameDVR_Enabled = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_38%==0x0 (
	echo GameDVR_FSEBehaviorMode = Correct registry key>>err.log
) else (
	echo GameDVR_FSEBehaviorMode = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_39%==ERR (
	echo GameDVR_FSEBehavior = Correct registry key>>err.log
) else (
	echo GameDVR_FSEBehavior = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_40%==ERR (
	echo GameDVR_HonorUserFSEBehaviorMode = Correct registry key>>err.log
) else (
	echo GameDVR_HonorUserFSEBehaviorMode = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
IF %chk_2_41%==ERR (
	echo GameDVR_EFSEFeatureFlags = Correct registry key>>err.log
) else (
	echo GameDVR_EFSEFeatureFlags = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)

IF %chk_2_42%==ERR (
	echo GameDVR_DXGIHonorFSEWindowsCompatible = Correct registry key>>err.log
) else (
	echo GameDVR_DXGIHonorFSEWindowsCompatible = Incorrect registry key>>err.log
	SET /a ERROR2=%ERROR2%+1
)
call :bar 25
IF %chk_2_1%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_2%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_3%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_4%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_5%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_6%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_7%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_8%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_9%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_10%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_11%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_12%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_13%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_14%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_15%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_16%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_17%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_18%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_19%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_20%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_21%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_22%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_23%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_24%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_25%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_26%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_27%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_28%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_29%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_30%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_31%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_32%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_33%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_34%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_35%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_36%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_37%==ERR SET /a ERROR2=%ERROR2%-1
IF %chk_2_38%==ERR SET /a ERROR2=%ERROR2%-1
call :bar 26

cls
SET ERROR3=0
SET CULTD=3
color 7
SET chk_3_1=ERR
SET chk_3_2=ERR
SET chk_3_3=ERR
SET chk_3_4=ERR
SET chk_3_5=ERR
SET chk_3_6=ERR
SET chk_3_7=ERR
SET chk_3_8=ERR
SET chk_3_9=ERR
SET chk_3_10=ERR
SET chk_3_11=ERR
SET chk_3_12=ERR
SET chk_3_13=ERR
SET chk_3_14=ERR
SET chk_3_15=ERR
SET chk_3_16=ERR
SET chk_3_17=ERR
SET chk_3_18=ERR
SET chk_3_19=ERR
SET chk_3_20=ERR
SET chk_3_21=ERR
SET chk_3_22=ERR
SET chk_3_23=ERR
SET chk_3_24=ERR
SET chk_3_25=ERR
SET chk_3_26=ERR
SET chk_3_27=ERR
SET chk_3_28=ERR
SET chk_3_29=ERR
SET chk_3_30=ERR
SET chk_3_31=ERR
SET chk_3_32=ERR
SET chk_3_33=ERR
SET chk_3_34=ERR
SET chk_3_35=ERR
SET chk_3_36=ERR
SET chk_3_37=ERR
SET chk_3_38=ERR
SET chk_3_39=ERR
SET chk_3_40=ERR
SET chk_3_41=ERR
SET chk_3_42=ERR
SET chk_3_43=ERR
SET chk_3_44=ERR
SET chk_3_45=ERR
SET chk_3_46=ERR
SET chk_3_47=ERR
SET chk_3_48=ERR
SET chk_3_49=ERR
SET chk_3_50=ERR
SET chk_3_51=ERR
SET chk_3_52=ERR
SET chk_3_53=ERR
cls

REM ###---------FILES_3-----------------------------------------------------------------------------------###

call :bar 27
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR"') DO set chk_3_1=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NoNetCrawling"') DO set chk_3_2=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay"') DO set chk_3_3=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect"') DO set chk_3_4=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery"') DO set chk_3_5=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts"') DO set chk_3_6=%%a >NUL 2>nul
call :bar 28
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks"') DO set chk_3_7=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay"') DO set chk_3_8=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize"') DO set chk_3_9=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize"') DO set chk_3_10=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload"') DO set chk_3_11=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer"') DO set chk_3_12=%%a >NUL 2>nul
call :bar 29
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort"') DO set chk_3_13=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts"') DO set chk_3_14=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DeadGWDetectDefault"') DO set chk_3_15=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL"') DO set chk_3_16=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "EnableICMPRedirect"') DO set chk_3_17=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery"') DO set chk_3_18=%%a >NUL 2>nul
call :bar 30
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "Tcp1323Opts"') DO set chk_3_19=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "TcpMaxDupAcks"') DO set chk_3_20=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay"') DO set chk_3_21=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize"') DO set chk_3_22=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "TcpWindowSize"') DO set chk_3_23=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "DisableTaskOffload"') DO set chk_3_24=%%a >NUL 2>nul
call :bar 31
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer"') DO set chk_3_25=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "MaxUserPort"') DO set chk_3_26=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "SackOpts"') DO set chk_3_27=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "DeadGWDetectDefault"') DO set chk_3_28=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "DefaultTTL"') DO set chk_3_29=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled"') DO set chk_3_30=%%a >NUL 2>nul
call :bar 32
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\ControlSet001\Services\NetBT\Parameters" /v "NameSrvQueryTimeout"') DO set chk_3_31=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "UseDelayedAcceptance"') DO set chk_3_32=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MaxSockAddrLength"') DO set chk_3_33=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MinSockAddrLength"') DO set chk_3_34=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "ServiceDllUnloadOnStop"') DO set chk_3_35=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxcachettl"') DO set chk_3_36=%%a >NUL 2>nul
call :bar 33
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxnegativecachettl"') DO set chk_3_37=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NetFailureCacheTime"') DO set chk_3_38=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeSOACacheTime"') DO set chk_3_39=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeCacheTime"') DO set chk_3_40=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "CacheHashTableBucketSize"') DO set chk_3_41=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxCacheEntryTtlLimit"') DO set chk_3_42=%%a >NUL 2>nul
call :bar 34
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxSOACacheEntryTtlLimit"') DO set chk_3_43=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "CacheHashTableSize"') DO set chk_3_44=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "Class"') DO set chk_3_45=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority"') DO set chk_3_46=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority"') DO set chk_3_47=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority"') DO set chk_3_48=%%a >NUL 2>nul
call :bar 35
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority"') DO set chk_3_49=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit"') DO set chk_3_50=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry"') DO set chk_3_51=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications"') DO set chk_3_52=%%a >NUL 2>nul
for /f "skip=2 tokens=3" %%a in ('reg query "HKLM\System\CurrentControlSet\Services\NetBT\Parameters" /v "EnableLMHOSTS"') DO set chk_3_53=%%a >NUL 2>nul
IF EXIST $null DEL $null >NUL 2>nul
cls
call :bar 36
REM ###---------FILES_3-----------------------------------------------------------------------------------###

IF %chk_3_1%==0x0 (
	echo AllowGameDVR = Correct registry key>>err.log
) else (
	echo AllowGameDVR = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
IF %chk_3_2%==0x1 (
	echo NoNetCrawling = Correct registry key>>err.log
) else (
	echo NoNetCrawling = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_3%==0x1 (
	echo TCPNoDelay = Correct registry key>>err.log
) else (
	echo TCPNoDelay = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
IF %chk_3_4%==0x1 (
	echo EnableICMPRedirect = Correct registry key>>err.log
) else (
	echo EnableICMPRedirect = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_5%==0x1 (
	echo EnablePMTUDiscovery = Correct registry key>>err.log
) else (
	echo EnablePMTUDiscovery = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
IF %chk_3_6%==0x0 (
	echo Tcp1323Opts = Correct registry key>>err.log
) else (
	echo Tcp1323Opts = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_7%==0x2 (
	echo TcpMaxDupAcks = Correct registry key>>err.log
) else (
	echo TcpMaxDupAcks = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
IF %chk_3_8%==0x20 (
	echo TcpTimedWaitDelay = Correct registry key>>err.log
) else (
	echo TcpTimedWaitDelay = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_9%==0x2238 (
	echo GlobalMaxTcpWindowSize = Correct registry key>>err.log
) else (
	echo GlobalMaxTcpWindowSize = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
IF %chk_3_10%==0x2238 (
	echo TcpWindowSize = Correct registry key>>err.log
) else (
	echo TcpWindowSize = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 24
IF %chk_3_11%==0x0 (
	echo DisableTaskOffload = Correct registry key>>err.log
) else (
	echo DisableTaskOffload = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_12%==0x0 (
	echo MaxConnectionsPerServer = Correct registry key>>err.log
) else (
	echo MaxConnectionsPerServer = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 25
IF %chk_3_13%==0xfffe (
	echo MaxUserPort = Correct registry key>>err.log
) else (
	echo MaxUserPort = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_14%==0x0 (
	echo SackOpts = Correct registry key>>err.log
) else (
	echo SackOpts = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 26
IF %chk_3_15%==0x1 (
	echo DeadGWDetectDefault = Correct registry key>>err.log
) else (
	echo DeadGWDetectDefault = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_16%==0x40 (
	echo DefaultTTL = Correct registry key>>err.log
) else (
	echo DefaultTTL = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 27
IF %chk_3_17%==0x1 (
	echo EnableICMPRedirect = Correct registry key>>err.log
) else (
	echo EnableICMPRedirect = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_18%==0x1 (
	echo EnablePMTUDiscovery = Correct registry key>>err.log
) else (
	echo EnablePMTUDiscovery = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 28
IF %chk_3_19%==0x0 (
	echo Tcp1323Opts = Correct registry key>>err.log
) else (
	echo Tcp1323Opts = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_20%==0x2 (
	echo TcpMaxDupAcks = Correct registry key>>err.log
) else (
	echo TcpMaxDupAcks = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 29
IF %chk_3_21%==0x20 (
	echo TcpTimedWaitDelay = Correct registry key>>err.log
) else (
	echo TcpTimedWaitDelay = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_22%==0x2238 (
	echo GlobalMaxTcpWindowSize = Correct registry key>>err.log
) else (
	echo GlobalMaxTcpWindowSize = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 30
IF %chk_3_23%==0x2238 (
	echo TcpWindowSize = Correct registry key>>err.log
) else (
	echo TcpWindowSize = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_24%==0x0 (
	echo DisableTaskOffload = Correct registry key>>err.log
) else (
	echo DisableTaskOffload = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 31
IF %chk_3_25%==0x0 (
	echo MaxConnectionsPerServer = Correct registry key>>err.log
) else (
	echo MaxConnectionsPerServer = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 37
IF %chk_3_26%==0xfffe (
	echo MaxUserPort = Correct registry key>>err.log
) else (
	echo MaxUserPort = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 32
IF %chk_3_27%==0x0 (
	echo SackOpts = Correct registry key>>err.log
) else (
	echo SackOpts = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_28%==0x1 (
	echo DeadGWDetectDefault = Correct registry key>>err.log
) else (
	echo DeadGWDetectDefault = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 33
IF %chk_3_29%==0x40 (
	echo DefaultTTL = Correct registry key>>err.log
) else (
	echo DefaultTTL = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_30%==0x0 (
	echo Enabled = Correct registry key>>err.log
) else (
	echo Enabled = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 34
IF %chk_3_31%==0xbb8 (
	echo NameSrvQueryTimeout = Correct registry key>>err.log
) else (
	echo NameSrvQueryTimeout = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_32%==0x0 (
	echo UseDelayedAcceptance = Correct registry key>>err.log
) else (
	echo UseDelayedAcceptance = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 35
IF %chk_3_33%==0x10 (
	echo MaxSockAddrLength = Correct registry key>>err.log
) else (
	echo MaxSockAddrLength = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_34%==0x10 (
	echo MinSockAddrLength = Correct registry key>>err.log
) else (
	echo MinSockAddrLength = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 36
IF %chk_3_35%==0x1 (
	echo ServiceDllUnloadOnStop = Correct registry key>>err.log
) else (
	echo ServiceDllUnloadOnStop = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_36%==0x3600 (
	echo maxcachettl = Correct registry key>>err.log
) else (
	echo maxcachettl = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 37
IF %chk_3_37%==0x0 (
	echo maxnegativecachettl = Correct registry key>>err.log
) else (
	echo maxnegativecachettl = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_38%==0x0 (
	echo NetFailureCacheTime = Correct registry key>>err.log
) else (
	echo NetFailureCacheTime = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 38
IF %chk_3_39%==0x0 (
	echo NegativeSOACacheTime = Correct registry key>>err.log
) else (
	echo NegativeSOACacheTime = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_40%==0x0 (
	echo NegativeCacheTime = Correct registry key>>err.log
) else (
	echo NegativeCacheTime = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 39
IF %chk_3_41%==0x1 (
	echo CacheHashTableBucketSize = Correct registry key>>err.log
) else (
	echo CacheHashTableBucketSize = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_42%==0x15180 (
	echo MaxCacheEntryTtlLimit = Correct registry key>>err.log
) else (
	echo MaxCacheEntryTtlLimit = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 40
IF %chk_3_43%==0x12c (
	echo MaxSOACacheEntryTtlLimit = Correct registry key>>err.log
) else (
	echo MaxSOACacheEntryTtlLimit = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_44%==0x180 (
	echo CacheHashTableSize = Correct registry key>>err.log
) else (
	echo CacheHashTableSize = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 41
IF %chk_3_45%==0x8 (
	echo Class = Correct registry key>>err.log
) else (
	echo Class = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_46%==0x6 (
	echo DnsPriority = Correct registry key>>err.log
) else (
	echo DnsPriority = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 42
IF %chk_3_47%==0x5 (
	echo HostsPriority = Correct registry key>>err.log
) else (
	echo HostsPriority = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_48%==0x4 (
	echo LocalPriority = Correct registry key>>err.log
) else (
	echo LocalPriority = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 43
IF %chk_3_49%==0x7 (
	echo NetbtPriority = Correct registry key>>err.log
) else (
	echo NetbtPriority = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_50%==0x0 (
	echo NonBestEffortLimit = Correct registry key>>err.log
) else (
	echo NonBestEffortLimit = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 44
IF %chk_3_51%==0x0 (
	echo AllowTelemetry = Correct registry key>>err.log
) else (
	echo AllowTelemetry = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)

IF %chk_3_52%==0x1 (
	echo DoNotShowFeedbackNotifications = Correct registry key>>err.log
) else (
	echo DoNotShowFeedbackNotifications = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 45
IF %chk_3_53%==0x0 (
	echo EnableLMHOSTS = Correct registry key>>err.log
) else (
	echo EnableLMHOSTS = Incorrect registry key>>err.log
	SET /a ERROR3=%ERROR3%+1
)
call :bar 38
IF %chk_3_1%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_2%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_3%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_4%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_5%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_6%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_7%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_8%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_9%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_10%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_11%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_12%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_13%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_14%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_15%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_16%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_17%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_18%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_19%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_20%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_21%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_22%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_23%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_24%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_25%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_26%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_27%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_28%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_29%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_30%==ERR SET /a ERROR3=%ERROR3%-1
call :bar 39
IF %chk_3_31%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_32%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_33%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_34%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_35%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_36%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_37%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_38%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_39%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_40%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_41%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_42%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_43%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_44%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_45%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_46%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_47%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_48%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_49%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_50%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_51%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_52%==ERR SET /a ERROR3=%ERROR3%-1
IF %chk_3_53%==ERR SET /a ERROR3=%ERROR3%-1
call :bar 40
Reg.exe add "HKLM\SOFTWARE\RECS" /v "ERRCHK1" /t REG_SZ /d "%ERROR%" /f >nul
Reg.exe add "HKLM\SOFTWARE\RECS" /v "ERRCHK2" /t REG_SZ /d "%ERROR2%" /f >nul
Reg.exe add "HKLM\SOFTWARE\RECS" /v "ERRCHK3" /t REG_SZ /d "%ERROR3%" /f >nul
Exit /b
