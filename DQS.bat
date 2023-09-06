:MMENU
@echo off
@Title DQS
set black=[30m
set red=[31m
set green=[32m
set yellow=[33m
set blue=[34m
set magenta=[35m
set bmagenta=[45m
set cyan=[36m
set white=[37m
set defcolor=[49m
set grey=[90m
set orange=[38;5;208m
set indigo=[38;5;105m
cd /d %~dp0
mode con:cols=111 lines=21
color 7
cls

SET HTO=102
SET MDQS=ERR
SET KDQS=ERR
SET WPS=ERR


if /i "%~1"=="/4" (
	SET HTO=98
)

IF exist PowerRun_x64.exe (
	IF %HTO%==102 PowerRun_x64.exe "%~0" /4 & exit
	goto :SMENU
) else (
	curl -g -k -L -# -o "PowerRun_x64.exe" "https://github.com/00FGV1/ver/raw/main/PowerRun_x64.exe"
	Ping 10>nul
	goto :MMENU
)

:SMENU
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

SET CURRENTKEY=HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters
FOR /F "TOKENS=2,*" %%A IN ('reg query "%CURRENTKEY%" 2^>NUL^|FIND /I "MouseDataQueueSize"') DO set MDQS=%%B >NUL 2>nul

SET CURRENTKEY=HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters
FOR /F "TOKENS=2,*" %%A IN ('reg query "%CURRENTKEY%" 2^>NUL^|FIND /I "KeyboardDataQueueSize"') DO set KDQS=%%B >NUL 2>nul

SET CURRENTKEY=HKLM\SYSTEM\ControlSet001\Control\PriorityControl
FOR /F "TOKENS=2,*" %%A IN ('reg query "%CURRENTKEY%" 2^>NUL^|FIND /I "Win32PrioritySeparation"') DO set WPS=%%B >NUL 2>nul

SET AF1=%defcolor%
SET AF2=%defcolor%
SET AF3=%defcolor%
SET AF4=%defcolor%
SET AF5=%defcolor%
SET AF6=%defcolor%
SET AF7=%defcolor%
SET AF8=%defcolor%
SET AF9=%defcolor%
SET AF10=%defcolor%
SET AF11=%defcolor%
SET AF12=%defcolor%
SET AF13=%defcolor%
SET AF14=%defcolor%
SET AF15=%defcolor%
SET AF16=%defcolor%
SET AF17=%defcolor%
SET AF18=%defcolor%
SET AF19=%defcolor%
SET AF20=%defcolor%
SET AF21=%defcolor%
SET AF22=%defcolor%
SET AF23=%defcolor%
SET AF24=%defcolor%
SET AF25=%defcolor%
SET AF26=%defcolor%
SET AF27=%defcolor%
SET AF28=%defcolor%
SET AF29=%defcolor%
SET AF30=%defcolor%
IF %MDQS%==0xa SET AF1=%bmagenta%
IF %MDQS%==0xc SET AF2=%bmagenta%
IF %MDQS%==0xe SET AF3=%bmagenta%
IF %MDQS%==0x10 SET AF4=%bmagenta%
IF %MDQS%==0x12 SET AF5=%bmagenta%
IF %MDQS%==0x14 SET AF6=%bmagenta%
IF %MDQS%==0x1e SET AF7=%bmagenta%
IF %MDQS%==0x32 SET AF8=%bmagenta%
IF %MDQS%==0x64 SET AF9=%bmagenta%
IF %KDQS%==0xa SET AF10=%bmagenta%
IF %KDQS%==0xc SET AF11=%bmagenta%
IF %KDQS%==0xe SET AF12=%bmagenta%
IF %KDQS%==0x10 SET AF13=%bmagenta%
IF %KDQS%==0x12 SET AF14=%bmagenta%
IF %KDQS%==0x14 SET AF15=%bmagenta%
IF %KDQS%==0x1e SET AF16=%bmagenta%
IF %KDQS%==0x32 SET AF17=%bmagenta%
IF %KDQS%==0x64 SET AF18=%bmagenta%
IF %WPS%==0x2a SET AF19=%bmagenta%
IF %WPS%==0x29 SET AF20=%bmagenta%
IF %WPS%==0x28 SET AF21=%bmagenta%
IF %WPS%==0x26 SET AF22=%bmagenta%
IF %WPS%==0x25 SET AF23=%bmagenta%
IF %WPS%==0x24 SET AF24=%bmagenta%
IF %WPS%==0x1a SET AF25=%bmagenta%
IF %WPS%==0x19 SET AF26=%bmagenta%
IF %WPS%==0x18 SET AF27=%bmagenta%
IF %WPS%==0x16 SET AF28=%bmagenta%
IF %WPS%==0x15 SET AF29=%bmagenta%
IF %WPS%==0x14 SET AF30=%bmagenta%

cls
echo.
echo   MouseDataQueueSize      KeyboardDataQueueSize      Win32PrioritySeparation ³ MDQS=%bmagenta%%MDQS%%defcolor% KDQS=%bmagenta%%KDQS%%defcolor% WPS=%bmagenta%%WPS%%defcolor%
echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿    ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿    ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo  ³[1] %AF1%10%defcolor%            ³    ³[10] %AF10%10%defcolor%              ³    ³[19] %AF19%2A%defcolor% Hex = Short ³ Fixed    ³ High foreground boost  ³
echo  ³[2] %AF2%12%defcolor%            ³    ³[11] %AF11%12%defcolor%              ³    ³[20] %AF20%29%defcolor% Hex = Short ³ Fixed    ³ Medium foreground boost³
echo  ³[3] %AF3%14%defcolor%            ³    ³[12] %AF12%14%defcolor%              ³    ³[21] %AF21%28%defcolor% Hex = Short ³ Fixed    ³ No foreground boost    ³
echo  ³[4] %AF4%16%defcolor%            ³    ³[13] %AF13%16%defcolor%              ³    ³                                                        ³
echo  ³[5] %AF5%18%defcolor%            ³    ³[14] %AF14%18%defcolor%              ³    ³[22] %AF22%26%defcolor% Hex = Short ³ Variable ³ High foreground boost  ³
echo  ³[6] %AF6%20%defcolor%            ³    ³[15] %AF15%20%defcolor%              ³    ³[23] %AF23%25%defcolor% Hex = Short ³ Variable ³ Medium foreground boost³
echo  ³[7] %AF7%30%defcolor%            ³    ³[16] %AF16%30%defcolor%              ³    ³[24] %AF24%24%defcolor% Hex = Short ³ Variable ³ No foreground boost    ³
echo  ³[8] %AF8%50%defcolor%            ³    ³[17] %AF17%50%defcolor%              ³    ³                                                        ³
echo  ³[9] %AF9%100%defcolor%           ³    ³[18] %AF18%100%defcolor%             ³    ³[25] %AF25%1A%defcolor% Hex = Long  ³ Fixed    ³ High foreground boost  ³
echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ    ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ    ³[26] %AF26%19%defcolor% Hex = Long  ³ Fixed    ³ Medium foreground boost³
echo   %bmagenta%   %defcolor% = La valeur actuelle dans le registre         ³[27] %AF27%18%defcolor% Hex = Long  ³ Fixed    ³ No foreground boost    ³
echo                                                     ³                                                        ³
echo   Valeur par defaut Windows:                        ³[28] %AF28%16%defcolor% Hex = Long  ³ Variable ³ High foreground boost  ³
echo          MouseDataQueueSize      = 100 (0x64)       ³[29] %AF29%15%defcolor% Hex = Long  ³ Variable ³ Medium foreground boost³
echo          KeyboardDataQueueSize   = 100 (0x64)       ³[30] %AF30%14%defcolor% Hex = Long  ³ Variable ³ No foreground boost    ³
echo          Win32PrioritySeparation = 26  (38)         ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
set /p a=Ä:

if %a%==1 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0xa" /f >nul & goto :MMENU
if %a%==2 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0xc" /f >nul & goto :MMENU
if %a%==3 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0xe" /f >nul & goto :MMENU
if %a%==4 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x10" /f >nul & goto :MMENU
if %a%==5 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x12" /f >nul & goto :MMENU
if %a%==6 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x14" /f >nul & goto :MMENU
if %a%==7 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x1e" /f >nul & goto :MMENU
if %a%==8 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x32" /f >nul & goto :MMENU
if %a%==9 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x64" /f >nul & goto :MMENU

if %a%==10 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0xa" /f >nul & goto :MMENU
if %a%==11 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0xc" /f >nul & goto :MMENU
if %a%==12 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0xe" /f >nul & goto :MMENU
if %a%==13 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x10" /f >nul & goto :MMENU
if %a%==14 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x12" /f >nul & goto :MMENU
if %a%==15 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x14" /f >nul & goto :MMENU
if %a%==16 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x1e" /f >nul & goto :MMENU
if %a%==17 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x32" /f >nul & goto :MMENU
if %a%==18 Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x64" /f >nul & goto :MMENU

if %a%==19 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x2A" /f >nul & goto :MMENU
if %a%==20 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x29" /f >nul & goto :MMENU
if %a%==21 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x28" /f >nul & goto :MMENU
if %a%==22 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x26" /f >nul & goto :MMENU
if %a%==23 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x25" /f >nul & goto :MMENU
if %a%==24 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x24" /f >nul & goto :MMENU
if %a%==25 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x1A" /f >nul & goto :MMENU
if %a%==26 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x19" /f >nul & goto :MMENU
if %a%==27 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x18" /f >nul & goto :MMENU
if %a%==28 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x16" /f >nul & goto :MMENU
if %a%==29 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x15" /f >nul & goto :MMENU
if %a%==30 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x14" /f >nul & goto :MMENU

if %a%==X (
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0xe" /f >nul
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0xc" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x16" /f >nul
)

if %a%==x (
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0xe" /f >nul
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0xc" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x16" /f >nul
)
goto :MMENU