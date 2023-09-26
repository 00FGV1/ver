@echo off
setlocal enabledelayedexpansion
cd /d %~dp0
set black=[30m
set red=[31m
set green=[32m
set yellow=[33m
set blue=[34m
set magenta=[35m
set cyan=[36m
set white=[37m
set grey=[90m
set orange=[38;5;208m
set indigo=[38;5;105m
color 7
cls

rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
if %errorlevel% neq 0 (
	powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0'" >nul 2>&1
	if !errorlevel! equ 0 exit /b
	echo Ce script ne s'execute pas en mode administrateur, veuillez le lancer en tant qu'administrateur.
	echo Le script se fermera dans 10 secondes.
	ping -n 10 -w 1000 127.0.0.1 >nul
	Exit /b 1
)
:REVERIF
cls
IF EXIST cli.c goto :VERIF1
curl -g -k -L -# -o "cli.c" "https://raw.githubusercontent.com/00FGV1/ver/main/file/cli.c" >nul 2>&1
ping -n 2 -w 500 127.0.0.1 >nul
goto :REVERIF
:VERIF1
IF EXIST es.exe goto :VERIF2
curl -g -k -L -# -o "es.exe" "https://github.com/00FGV1/ver/raw/main/file/es.exe" >nul 2>&1
ping -n 5 -w 2000 127.0.0.1 >nul
goto :REVERIF
:VERIF2
IF EXIST Everything.exe goto :VERIF4
curl -g -k -L -# -o "Everything.exe" "https://github.com/00FGV1/ver/raw/main/file/Everything.exe" >nul 2>&1
ping -n 5 -w 2000 127.0.0.1 >nul
goto :REVERIF
:VERIF4
IF EXIST Everything.lng goto :VERIF5
curl -g -k -L -# -o "Everything.lng" "https://github.com/00FGV1/ver/raw/main/file/Everything.lng" >nul 2>&1
ping -n 2 -w 500 127.0.0.1 >nul
goto :REVERIF

:VERIF5
set "exeFile1=Everything.exe"
set "expected1MD5=0170601e27117e9639851a969240b959"

for %%F in ("!exeFile1!") do (
    for /f "tokens=*" %%I in ('certutil -hashfile "%%~fF" MD5 ^| find /v ":"') do (
        set "computed1MD5=%%I"
    )
)

if "!computed1MD5!"=="!expected1MD5!" (
    SET NSAR=1
) else (
    DEL Everything.exe>nul
    goto :REVERIF
)

set "exeFile2=es.exe"
set "expected2MD5=2782c4a86c13941fc1a9a0232684ccfb"

for %%F in ("!exeFile2!") do (
    for /f "tokens=*" %%I in ('certutil -hashfile "%%~fF" MD5 ^| find /v ":"') do (
        set "computed2MD5=%%I"
    )
)

if "!computed2MD5!"=="!expected2MD5!" (
    SET NSAR=1
) else (
    DEL es.exe>nul
    goto :REVERIF
)

IF EXIST result.log DEL result.log
IF EXIST exe_gamename.txt DEL exe_gamename.txt
IF EXIST Everything.ini DEL Everything.ini
Start "" "Everything.exe" -startup
cls
IF exist "exe_gamename.txt" del "exe_gamename.txt"
curl -g -k -L -# -o "exe_gamename.txt" "https://raw.githubusercontent.com/00FGV1/ver/main/exe_gamename.txt" >nul 2>&1

Reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "1" /f

set "heure=%TIME:~0,2%"
set "minutes=%TIME:~3,2%"
set "secondes=%TIME:~6,2%"

set "fileList=exe_gamename.txt"

echo  Liste des jeux optimisés>result.log
echo  Start : %heure%:%minutes%:%secondes%>>result.log

set "heure="
set "minutes="
set "secondes="

cls

for /f "tokens=*" %%i in (%fileList%) do (
    for %%j in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        es.exe "%%i" -path "%%j:\" -export-txt "temp_results.txt"
        for /f "delims=" %%k in ('type "temp_results.txt" ^| findstr /i "\.exe$"') do (
	    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%%i" /v "Version" /t REG_SZ /d "1.0" /f > NUL 2>&1
	    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%%i" /v "Application Name" /t REG_SZ /d "%%k" /f > NUL 2>&1
	    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%%i" /v "Protocol" /t REG_SZ /d "*" /f > NUL 2>&1
	    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%%i" /v "Local Port" /t REG_SZ /d "*" /f > NUL 2>&1
	    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%%i" /v "Local IP" /t REG_SZ /d "*" /f > NUL 2>&1
	    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%%i" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f > NUL 2>&1
	    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%%i" /v "Remote Port" /t REG_SZ /d "*" /f > NUL 2>&1
	    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%%i" /v "Remote IP" /t REG_SZ /d "*" /f > NUL 2>&1
	    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%%i" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f > NUL 2>&1
	    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%%i" /v "DSCP Value" /t REG_SZ /d "46" /f > NUL 2>&1
	    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%%i" /v "Throttle Rate" /t REG_SZ /d "-1" /f > NUL 2>&1
	    Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%%k" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE RUNASADMIN HIGHDPIAWARE" /f > NUL 2>&1
	    Reg.exe add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "%%k" /t REG_SZ /d "GpuPreference=2;" /f > NUL 2>&1
	    Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%i\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
            echo.
            echo Game path         : "%%k"
            echo Game registry ID  : "%%i"
            echo.>>result.log
            echo  Game path         : "%%k">>result.log
            echo  Game registry ID  : "%%i">>result.log
        )
        del "temp_results.txt"
    )
)

set "heure=%TIME:~0,2%"
set "minutes=%TIME:~3,2%"
set "secondes=%TIME:~6,2%"

echo.>>QTS-SERVICE.log
echo  End : %heure%:%minutes%:%secondes%>>result.log

taskkill /IM Everything.exe /F >nul
ping -n 02 -w 1000 127.0.0.1 >nul
taskkill /IM Everything.exe /F

Exit
