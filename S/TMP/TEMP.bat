@echo off
title TEMP
color 9
cd /d %~dp0
mode con:cols=90 lines=40
cls
echo.
echo ---------------------------------------------------------------------------
echo                          %USERNAME% // %USERDOMAIN%                        
echo ---------------------------------------------------------------------------
echo.

del /F /Q "C:\Ect\StartUP\binVS130620230ESF\GameMode\GameMode.bat" 2>NUL
del /F /Q "C:\Ect\StartUP\binVS130620230ESF\service\Services.bat" 2>NUL
del /F /Q "C:\Ect\StartUP\binVS130620230ESF\script\FReg.bat" 2>NUL
del /F /Q "C:\Ect\StartUP\binVS130620230ESF\script\GPrio.bat" 2>NUL
del /F /Q "C:\Ect\StartUP\binVS130620230ESF\final\Final.bat" 2>NUL

bcdedit /set disabledynamictick yes
bcdedit /set bootmenupolicy Legacy
bcdedit /set lastknowngood yes

fsutil behavior set DisableDeleteNotify 0
fsutil behavior set disableLastAccess 1
fsutil behavior set disable8dot3 1

netsh interface Teredo set state servername=default
netsh interface Teredo set state type=default

powercfg -setacvalueindex scheme_current sub_processor PERFINCPOL 2
powercfg -setacvalueindex scheme_current sub_processor PERFDECPOL 1
powercfg -setacvalueindex scheme_current sub_processor PERFINCTHRESHOLD 10
powercfg -setacvalueindex scheme_current sub_processor PERFDECTHRESHOLD 8
powercfg /setactive scheme_current

powershell.exe -encodedCommand JABkAGUAdgBpAGMAZQBzAFUAUwBCACAAPQAgAEcAZQB0AC0AUABuAHAARABlAHYAaQBjAGUAIAB8ACAAdwBoAGUAcgBlACAAewAkAF8ALgBJAG4AcwB0AGEAbgBjAGUASQBkACAALQBsAGkAawBlACAAIgAqAFUAUwBCAFwAUgBPAE8AVAAqACIAfQAgACAAfAAgAA0ACgBGAG8AcgBFAGEAYwBoAC0ATwBiAGoAZQBjAHQAIAAtAFAAcgBvAGMAZQBzAHMAIAB7AA0ACgBHAGUAdAAtAEMAaQBtAEkAbgBzAHQAYQBuAGMAZQAgAC0AQwBsAGEAcwBzAE4AYQBtAGUAIABNAFMAUABvAHcAZQByAF8ARABlAHYAaQBjAGUARQBuAGEAYgBsAGUAIAAtAE4AYQBtAGUAcwBwAGEAYwBlACAAcgBvAG8AdABcAHcAbQBpACAADQAKAH0ADQAKAA0ACgBmAG8AcgBlAGEAYwBoACAAKAAgACQAZABlAHYAaQBjAGUAIABpAG4AIAAkAGQAZQB2AGkAYwBlAHMAVQBTAEIAIAApAA0ACgB7AA0ACgAgACAAIAAgAFMAZQB0AC0AQwBpAG0ASQBuAHMAdABhAG4AYwBlACAALQBOAGEAbQBlAHMAcABhAGMAZQAgAHIAbwBvAHQAXAB3AG0AaQAgAC0AUQB1AGUAcgB5ACAAIgBTAEUATABFAEMAVAAgACoAIABGAFIATwBNACAATQBTAFAAbwB3AGUAcgBfAEQAZQB2AGkAYwBlAEUAbgBhAGIAbABlACAAVwBIAEUAUgBFACAASQBuAHMAdABhAG4AYwBlAE4AYQBtAGUAIABMAEkASwBFACAAJwAlACQAKAAkAGQAZQB2AGkAYwBlAC4AUABOAFAARABlAHYAaQBjAGUASQBEACkAJQAnACIAIAAtAFAAcgBvAHAAZQByAHQAeQAgAEAAewBFAG4AYQBiAGwAZQA9ACQARgBhAGwAcwBlAH0AIAAtAFAAYQBzAHMAVABoAHIAdQANAAoAfQANAAoADQAKACQAYQBkAGEAcAB0AGUAcgBzACAAPQAgAEcAZQB0AC0ATgBlAHQAQQBkAGEAcAB0AGUAcgAgAC0AUABoAHkAcwBpAGMAYQBsACAAfAAgAEcAZQB0AC0ATgBlAHQAQQBkAGEAcAB0AGUAcgBQAG8AdwBlAHIATQBhAG4AYQBnAGUAbQBlAG4AdAANAAoAIAAgACAAIABmAG8AcgBlAGEAYwBoACAAKAAkAGEAZABhAHAAdABlAHIAIABpAG4AIAAkAGEAZABhAHAAdABlAHIAcwApAA0ACgAgACAAIAAgACAAIAAgACAAewANAAoAIAAgACAAIAAgACAAIAAgACQAYQBkAGEAcAB0AGUAcgAuAEEAbABsAG8AdwBDAG8AbQBwAHUAdABlAHIAVABvAFQAdQByAG4ATwBmAGYARABlAHYAaQBjAGUAIAA9ACAAJwBEAGkAcwBhAGIAbABlAGQAJwANAAoAIAAgACAAIAAgACAAIAAgACQAYQBkAGEAcAB0AGUAcgAgAHwAIABTAGUAdAAtAE4AZQB0AEEAZABhAHAAdABlAHIAUABvAHcAZQByAE0AYQBuAGEAZwBlAG0AZQBuAHQADQAKACAAIAAgACAAIAAgACAAIAB9AA==

sc config "Schedule" start=disabled
sc config "WSearch" start=disabled
sc config "SysMain" start=disabled
sc config "AMD Crash Defender Service" start=disabled
sc config "AMD External Events Utility" start=disabled

@timeout /t 04>nul

sc delete "Schedule"
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettings /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d "3" /f
del /f /q "%WinDir%\System32\mcupdate_GenuineIntel.dll"
del /f /q "%WinDir%\System32\mcupdate_AuthenticAMD.dll"

del /q/f/s %TEMP%\*
del /s /f /q c:\windows\temp\*.*
del /s /f /q c:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q c:\windows\tempor~1
rd /s /q c:\windows\temp
rd /s /q c:\windows\tmp
rd /s /q c:\windows\ff*.tmp
rd /s /q c:\windows\history
rd /s /q c:\windows\cookies
rd /s /q c:\windows\recent
rd /s /q c:\windows\spool\printers
del /F /Q "%USERPROFILE%\Documents\*.tmp" 2>NUL
del /F /Q "%USERPROFILE%\My Documents\*.tmp" 2>NUL
del /F /S /Q "%USERPROFILE%\*.blf" 2>NUL
del /F /Q "%SYSTEMDRIVE%\Ect\Optimizer\*.tmp" 2>NUL
del /F /S /Q "%USERPROFILE%\*.regtrans-ms" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\LocalLow\Sun\Java\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\JumpListIconsOld\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\JumpListIcons\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Local Storage\http*.*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Media Cache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Internet Explorer\Recovery\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Terminal Server Client\Cache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Caches\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\History\low\*" /AH 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\WER\ReportArchive\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\WER\ReportQueue\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\WebCache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Temp\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Roaming\Adobe\Flash Player\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Roaming\Microsoft\Teams\Service Worker\CacheStorage\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Roaming\Macromedia\Flash Player\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Application Data\Adobe\Flash Player\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Application Data\Macromedia\Flash Player\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Application Data\Microsoft\Dr Watson\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Application Data\Microsoft\Windows\WER\ReportArchive\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Application Data\Microsoft\Windows\WER\ReportQueue\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Application Data\Sun\Java\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Local Settings\Application Data\ApplicationHistory\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Local Settings\Application Data\Google\Chrome\User Data\Default\Cache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Local Settings\Application Data\Google\Chrome\User Data\Default\JumpListIconsOld\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Local Settings\Application Data\Google\Chrome\User Data\Default\JumpListIcons\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Local Settings\Application Data\Google\Chrome\User Data\Default\Local Storage\http*.*" 2>NUL
del /F /S /Q "%USERPROFILE%\Local Settings\Application Data\Google\Chrome\User Data\Default\Media Cache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Local Settings\Application Data\Microsoft\Dr Watson\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Local Settings\Application Data\Microsoft\Internet Explorer\Recovery\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Local Settings\Application Data\Microsoft\Terminal Server Client\Cache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Local Settings\Temp\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Local Settings\Temporary Internet Files\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Recent\*" 2>NUL
if exist %SystemDrive%\Windows.old\ (
	 takeown /F %SystemDrive%\Windows.old\* /R /A /D Y
	 echo y| cacls %SystemDrive%\Windows.old\*.* /C /T /grant administrators:F
	 rmdir /S /Q %SystemDrive%\Windows.old\
	 )

if exist %SystemDrive%\$Windows.~BT\ (
	 takeown /F %SystemDrive%\$Windows.~BT\* /R /A
	 icacls %SystemDrive%\$Windows.~BT\*.* /T /grant administrators:F
	 rmdir /S /Q %SystemDrive%\$Windows.~BT\
	 )

if exist %SystemDrive%\$Windows.~WS (
	 takeown /F %SystemDrive%\$Windows.~WS\* /R /A
	 icacls %SystemDrive%\$Windows.~WS\*.* /T /grant administrators:F
	 rmdir /S /Q %SystemDrive%\$Windows.~WS\
	 )

cls
echo --- Clear regedit last key
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit" /va /f
cls
echo --- Clear regedit favorites
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites" /va /f
cls
echo --- Clear list of recent programs opened
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRULegacy" /va /f
cls
echo --- Clear Adobe Media Browser MRU
reg delete "HKCU\Software\Adobe\MediaBrowser\MRU" /va /f
cls
echo --- Clear MSPaint MRU
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List" /va /f
cls
echo --- Clear Wordpad MRU
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List" /va /f
cls
echo --- Clear Map Network Drive MRU MRU
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU" /va /f
cls
echo --- Clear Windows Search Assistant history
reg delete "HKCU\Software\Microsoft\Search Assistant\ACMru" /va /f
cls
echo --- Clear list of Recent Files Opened, by Filetype
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU" /va /f
cls
echo --- Clear windows media player recent files and URLs
reg delete "HKCU\Software\Microsoft\MediaPlayer\Player\RecentFileList" /va /f
reg delete "HKCU\Software\Microsoft\MediaPlayer\Player\RecentURLList" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\MediaPlayer\Player\RecentFileList" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\MediaPlayer\Player\RecentURLList" /va /f
cls
echo --- Clear Most Recent Application's Use of DirectX
reg delete "HKCU\Software\Microsoft\Direct3D\MostRecentApplication" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\MostRecentApplication" /va /f
cls
echo --- Clear Windows Run MRU ^& typedpaths
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /va /f
cls
echo --- Empty trash bin
PowerShell -ExecutionPolicy Unrestricted -Command "$bin = (New-Object -ComObject Shell.Application).NameSpace(10); $bin.items() | ForEach {; Write-Host "^""Deleting $($_.Name) from Recycle Bin"^""; Remove-Item $_.Path -Recurse -Force; }"
cls
endlocal

powershell.exe -encodedCommand JABkAGUAdgBpAGMAZQBzAFUAUwBCACAAPQAgAEcAZQB0AC0AUABuAHAARABlAHYAaQBjAGUAIAB8ACAAdwBoAGUAcgBlACAAewAkAF8ALgBJAG4AcwB0AGEAbgBjAGUASQBkACAALQBsAGkAawBlACAAIgAqAFUAUwBCAFwAUgBPAE8AVAAqACIAfQAgACAAfAAgAA0ACgBGAG8AcgBFAGEAYwBoAC0ATwBiAGoAZQBjAHQAIAAtAFAAcgBvAGMAZQBzAHMAIAB7AA0ACgBHAGUAdAAtAEMAaQBtAEkAbgBzAHQAYQBuAGMAZQAgAC0AQwBsAGEAcwBzAE4AYQBtAGUAIABNAFMAUABvAHcAZQByAF8ARABlAHYAaQBjAGUARQBuAGEAYgBsAGUAIAAtAE4AYQBtAGUAcwBwAGEAYwBlACAAcgBvAG8AdABcAHcAbQBpACAADQAKAH0ADQAKAA0ACgBmAG8AcgBlAGEAYwBoACAAKAAgACQAZABlAHYAaQBjAGUAIABpAG4AIAAkAGQAZQB2AGkAYwBlAHMAVQBTAEIAIAApAA0ACgB7AA0ACgAgACAAIAAgAFMAZQB0AC0AQwBpAG0ASQBuAHMAdABhAG4AYwBlACAALQBOAGEAbQBlAHMAcABhAGMAZQAgAHIAbwBvAHQAXAB3AG0AaQAgAC0AUQB1AGUAcgB5ACAAIgBTAEUATABFAEMAVAAgACoAIABGAFIATwBNACAATQBTAFAAbwB3AGUAcgBfAEQAZQB2AGkAYwBlAEUAbgBhAGIAbABlACAAVwBIAEUAUgBFACAASQBuAHMAdABhAG4AYwBlAE4AYQBtAGUAIABMAEkASwBFACAAJwAlACQAKAAkAGQAZQB2AGkAYwBlAC4AUABOAFAARABlAHYAaQBjAGUASQBEACkAJQAnACIAIAAtAFAAcgBvAHAAZQByAHQAeQAgAEAAewBFAG4AYQBiAGwAZQA9ACQARgBhAGwAcwBlAH0AIAAtAFAAYQBzAHMAVABoAHIAdQANAAoAfQANAAoADQAKACQAYQBkAGEAcAB0AGUAcgBzACAAPQAgAEcAZQB0AC0ATgBlAHQAQQBkAGEAcAB0AGUAcgAgAC0AUABoAHkAcwBpAGMAYQBsACAAfAAgAEcAZQB0AC0ATgBlAHQAQQBkAGEAcAB0AGUAcgBQAG8AdwBlAHIATQBhAG4AYQBnAGUAbQBlAG4AdAANAAoAIAAgACAAIABmAG8AcgBlAGEAYwBoACAAKAAkAGEAZABhAHAAdABlAHIAIABpAG4AIAAkAGEAZABhAHAAdABlAHIAcwApAA0ACgAgACAAIAAgACAAIAAgACAAewANAAoAIAAgACAAIAAgACAAIAAgACQAYQBkAGEAcAB0AGUAcgAuAEEAbABsAG8AdwBDAG8AbQBwAHUAdABlAHIAVABvAFQAdQByAG4ATwBmAGYARABlAHYAaQBjAGUAIAA9ACAAJwBEAGkAcwBhAGIAbABlAGQAJwANAAoAIAAgACAAIAAgACAAIAAgACQAYQBkAGEAcAB0AGUAcgAgAHwAIABTAGUAdAAtAE4AZQB0AEEAZABhAHAAdABlAHIAUABvAHcAZQByAE0AYQBuAGEAZwBlAG0AZQBuAHQADQAKACAAIAAgACAAIAAgACAAIAB9AA==
bcdedit /deletevalue useplatformclock
bcdedit /deletevalue useplatformtick 
bcdedit /set disabledynamictick yes

cls
echo --- Clear thumbnail cache
del /f /s /q /a %LocalAppData%\Microsoft\Windows\Explorer\*.db
cls
echo --- Clear Windows temp files
del /f /q %localappdata%\Temp\*
rd /s /q "%WINDIR%\Temp"
rd /s /q "%TEMP%"
cls
echo --- Clear main telemetry file
if exist "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl" (
    takeown /f "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl" /r /d y
    icacls "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl" /grant administrators:F /t
    echo "" > "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl"
    echo Clear successful: "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl"
) else (
    echo "Main telemetry file does not exist. Good!"
)
cls
echo --- Clear Event Logs in Event Viewer
wevtutil sl Microsoft-Windows-LiveId/Operational /ca:O:BAG:SYD:(A;;0x1;;;SY)(A;;0x5;;;BA)(A;;0x1;;;LA)
for /f "tokens=*" %%i in ('wevtutil.exe el') DO (
    echo Deleting event log: "%%i"
    wevtutil.exe cl %1 "%%i"
)
cls
echo --- Clean Windows Defender scan history
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\" /s /f /q
cls
echo --- Clear Optional Component Manager and COM+ components logs
del /f /q %SystemRoot%\comsetup.log
cls
echo --- Clear Distributed Transaction Coordinator logs
del /f /q %SystemRoot%\DtcInstall.log
cls
echo --- Clear Pending File Rename Operations logs
del /f /q %SystemRoot%\PFRO.log
cls
echo --- Clear Windows Deployment Upgrade Process Logs
del /f /q %SystemRoot%\setupact.log
del /f /q %SystemRoot%\setuperr.log
cls
echo --- Clear Windows Setup Logs
del /f /q %SystemRoot%\setupapi.log
del /f /q %SystemRoot%\Panther\*
del /f /q %SystemRoot%\inf\setupapi.app.log
del /f /q %SystemRoot%\inf\setupapi.dev.log
del /f /q %SystemRoot%\inf\setupapi.offline.log
cls
echo --- Clear Windows System Assessment Tool logs
del /f /q %SystemRoot%\Performance\WinSAT\winsat.log
cls
echo --- Clear Password change events
del /f /q %SystemRoot%\debug\PASSWD.LOG
cls
echo --- Clear user web cache database
del /f /q %localappdata%\Microsoft\Windows\WebCache\*.*
cls
echo --- Clear system temp folder when no one is logged in
del /f /q %SystemRoot%\ServiceProfiles\LocalService\AppData\Local\Temp\*.*
cls
echo --- Clear DISM (Deployment Image Servicing and Management) Logs
del /f /q  %SystemRoot%\Logs\CBS\CBS.log
del /f /q  %SystemRoot%\Logs\DISM\DISM.log
cls
echo --- Clear WUAgent (Windows Update History) logs
setlocal EnableDelayedExpansion 
    SET /A wuau_service_running=0
    SC queryex "wuauserv"|Find "STATE"|Find /v "RUNNING">Nul||(
        SET /A wuau_service_running=1
        net stop wuauserv
    )
    del /q /s /f "%SystemRoot%\SoftwareDistribution"
endlocal
cls
echo --- Clear Server-initiated Healing Events Logs
del /f /q "%SystemRoot%\Logs\SIH\*"
cls
echo --- Common Language Runtime Logs
del /f /q "%LocalAppData%\Microsoft\CLR_v4.0\UsageTraces\*"
del /f /q "%LocalAppData%\Microsoft\CLR_v4.0_32\UsageTraces\*"
cls
echo --- Network Setup Service Events Logs
del /f /q "%SystemRoot%\Logs\NetSetup\*"
cls
echo --- Disk Cleanup tool (Cleanmgr.exe) Logs
del /f /q "%SystemRoot%\System32\LogFiles\setupcln\*"
cls
echo --- Clear Windows update and SFC scan logs
del /f /q %SystemRoot%\Temp\CBS\*
cls
echo --- Clear Windows Update Medic Service logs
takeown /f %SystemRoot%\Logs\waasmedic /r /d y
icacls %SystemRoot%\Logs\waasmedic /grant administrators:F /t
rd /s /q %SystemRoot%\Logs\waasmedic
cls
echo --- Clear Cryptographic Services Traces
del /f /q %SystemRoot%\System32\catroot2\dberr.txt
del /f /q %SystemRoot%\System32\catroot2.log
del /f /q %SystemRoot%\System32\catroot2.jrs
del /f /q %SystemRoot%\System32\catroot2.edb
del /f /q %SystemRoot%\System32\catroot2.chk
cls
echo --- Windows Update Events Logs
del /f /q "%SystemRoot%\Logs\SIH\*"
cls
echo --- Windows Update Logs
del /f /q "%SystemRoot%\Traces\WindowsUpdate\*"

exit /b 0