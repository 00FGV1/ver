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
set gold=[38;5;220m
set grey=[90m
set orange=[38;5;208m
set indigo=[38;5;105m
cd /d %~dp0
mode con:cols=138 lines=23
color 7
cls

SET HTO=102
SET MDQS=ERR
SET KDQS=ERR
SET WPS=ERR
SET ENDF=0
SET CRAM=0
SET BBCLS=0

if /i "%~1"=="/4" (
	SET HTO=98
)

if /i "%~1"=="/B" (
	rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
	mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
	if %errorlevel% neq 0 (
		powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0' /B" >nul 2>&1 & exit /b
	)
	goto :BENCH
)

if /i "%~1"=="/A" (
	rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
	mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
	if %errorlevel% neq 0 (
		powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0' /A" >nul 2>&1 & exit /b
	)
	goto :AUT1
)

if /i "%~1"=="/RAM" (
	rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
	mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
	if %errorlevel% neq 0 (
		powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0' /A" >nul 2>&1 & exit /b
	)
	IF NOT EXIST MinimizeConsole.ps1 (
	    echo # MinimizeConsole.ps1>MinimizeConsole.ps1
	    echo Start-Process -FilePath "cmd.exe" -ArgumentList "/C start /min DQS.bat /RA2" -WindowStyle Hidden>>MinimizeConsole.ps1
	    ping -n 2 -w 1000 127.0.0.1 >nul
	)
	powershell.exe -ExecutionPolicy Bypass -File "MinimizeConsole.ps1"
	Exit
)

if /i "%~1"=="/RA2" (
	rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
	mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
	if %errorlevel% neq 0 (
		powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0' /A" >nul 2>&1 & exit /b
	)
	SET CRAM=1
	goto :AUT1
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
SET AF31=%defcolor%
SET AF32=%defcolor%
SET AF33=%defcolor%
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
IF %WPS%==0x21 SET AF31=%bmagenta%
IF %WPS%==0x38 SET AF32=%bmagenta%
IF %WPS%==0x36 SET AF33=%bmagenta%

cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ %gold%MouseDataQueueSize%white%   %gold%KeyboardDataQueueSize%white%                                    %gold%Win32PrioritySeparation%white%                                  ³
echo ³ÚÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿³
echo ³³ %indigo%[1]%white% ³ %AF1%10%defcolor%         ³ ³ %indigo%[10]%white% ³ %AF10%10%defcolor%           ³ ³ %indigo%[19]%white% ³ %AF19%%grey%{42}%white% 2A%defcolor% Hex = Short ³ Fixed    ³ High foreground boost   ³ %gold%R%white% = osu - Fortnite %magenta%1/2%white%³³
echo ³³ %indigo%[2]%white% ³ %AF2%12%defcolor%         ³ ³ %indigo%[11]%white% ³ %AF11%12%defcolor%           ³ ³ %indigo%[20]%white% ³ %AF20%%grey%{41}%white% 29%defcolor% Hex = Short ³ Fixed    ³ Medium foreground boost ³ %gold%R%white% = Apex Legends      ³³
echo ³³ %indigo%[3]%white% ³ %AF3%14%defcolor%         ³ ³ %indigo%[12]%white% ³ %AF12%14%defcolor%           ³ ³ %indigo%[21]%white% ³ %AF21%%grey%{40}%white% 28%defcolor% Hex = Short ³ Fixed    ³ No foreground boost     ³ %gold%R%white% = Rocket League     ³³
echo ³³ %indigo%[4]%white% ³ %AF4%16%defcolor%         ³ ³ %indigo%[13]%white% ³ %AF13%16%defcolor%           ³ ³ %indigo%[22]%white% ³ %AF22%%grey%{38}%white% 26%defcolor% Hex = Short ³ Variable ³ High foreground boost   ³ %gold%R%white% = CS2 - Fortnite %magenta%2/2%white%³³
echo ³³ %indigo%[5]%white% ³ %AF5%18%defcolor%         ³ ³ %indigo%[14]%white% ³ %AF14%18%defcolor%           ³ ³ %indigo%[23]%white% ³ %AF23%%grey%{37}%white% 25%defcolor% Hex = Short ³ Variable ³ Medium foreground boost ³ %gold%R%white% = %grey%N/a%white%               ³³
echo ³³ %indigo%[6]%white% ³ %AF6%20%defcolor%         ³ ³ %indigo%[15]%white% ³ %AF15%20%defcolor%           ³ ³ %indigo%[24]%white% ³ %AF24%%grey%{36}%white% 24%defcolor% Hex = Short ³ Variable ³ No foreground boost     ³ %gold%R%white% = %grey%N/a%white%               ³³
echo ³³ %indigo%[7]%white% ³ %AF7%30%defcolor%         ³ ³ %indigo%[16]%white% ³ %AF16%30%defcolor%           ³ ³ %indigo%[25]%white% ³ %AF25%%grey%{26}%white% 1A%defcolor% Hex = Long  ³ Fixed    ³ High foreground boost   ³ %gold%R%white% = %grey%N/a%white%               ³³
echo ³³ %indigo%[8]%white% ³ %AF8%50%defcolor%         ³ ³ %indigo%[17]%white% ³ %AF17%50%defcolor%           ³ ³ %indigo%[26]%white% ³ %AF26%%grey%{25}%white% 19%defcolor% Hex = Long  ³ Fixed    ³ Medium foreground boost ³ %gold%R%white% = %grey%N/a%white%               ³³
echo ³³ %indigo%[9]%white% ³ %AF9%100%defcolor%        ³ ³ %indigo%[18]%white% ³ %AF18%100%defcolor%          ³ ³ %indigo%[27]%white% ³ %AF27%%grey%{24}%white% 18%defcolor% Hex = Long  ³ Fixed    ³ No foreground boost     ³ %gold%R%white% = No Man's Sky %magenta%[FIX]%white%³³
echo ³ÀÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ³ %indigo%[28]%white% ³ %AF28%%grey%{22}%white% 16%defcolor% Hex = Long  ³ Variable ³ High foreground boost   ³ %gold%R%white% = %grey%N/a%white%               ³³
echo ³ %bmagenta%    %defcolor% = La valeur actuelle dans le registre  ³ %indigo%[29]%white% ³ %AF29%%grey%{21}%white% 15%defcolor% Hex = Long  ³ Variable ³ Medium foreground boost ³ %gold%R%white% = %grey%N/a%white%               ³³
echo ³  %gold%R%white%   = Recommande pour le jeu suivant       ³ %indigo%[30]%white% ³ %AF30%%grey%{20}%white% 14%defcolor% Hex = Long  ³ Variable ³ No foreground boost     ³ %gold%R%white% = %grey%N/a%white%               ³³
echo ³ %grey%{**}%white% = La valeur en decimale                ³ %indigo%[31]%white% ³ %AF31%%grey%{33}%white% 21%defcolor% Hex = %grey%N/a%white%   ³ %grey%N/a%white%      ³ %grey%N/a%white%                     ³ %gold%R%white% = Valorant       %magenta%1/2%white%³³
echo ³                                             ³ %indigo%[32]%white% ³ %AF32%%grey%{56}%white% 38%defcolor% Hex = %grey%N/a%white%   ³ %grey%N/a%white%      ³ %grey%N/a%white%                     ³ %gold%R%white% = Valorant       %magenta%2/2%white%³³
echo ³ %grey%Valeur par defaut Windows:%white%                  ³ %indigo%[33]%white% ³ %AF33%%grey%{54}%white% 36%defcolor% Hex = %grey%N/a%white%   ³ %grey%N/a%white%      ³ %grey%N/a%white%                     ³ %gold%R%white% = R6    %magenta%[API Vulkan]%white%³³
echo ³        %grey%MouseDataQueueSize      = 100 (0x64)%white% ÀÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ³
echo ³        %grey%KeyboardDataQueueSize   = 100 (0x64)%white%   %grey%[* Aucun redemarrage necessaire pour les valeurs de "Win32PrioritySeparation".        ]%white%  ³
echo ³        %grey%Win32PrioritySeparation = 26  (38)%white%     %grey%[* Vous pouvez tester differentes valeurs instantanement en jeu.                      ]%white%  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
if %a%==31 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x21" /f >nul & goto :MMENU
if %a%==32 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x38" /f >nul & goto :MMENU
if %a%==33 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x36" /f >nul & goto :MMENU

if %a%==X (
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x10" /f >nul
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x10" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x26" /f >nul
)

if %a%==x (
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x10" /f >nul
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x10" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x26" /f >nul
)
goto :MMENU

:BENCH
cd /d %~dp0
mode con:cols=138 lines=23
cls

SET CURRENTKEY=HKLM\SYSTEM\ControlSet001\Control\PriorityControl
FOR /F "TOKENS=2,*" %%A IN ('reg query "%CURRENTKEY%" 2^>NUL^|FIND /I "Win32PrioritySeparation"') DO set WPS=%%B >NUL 2>nul

SET VL1=%white%& SET ENDF=1
SET VL2=%white%& SET ENDF=1
SET VL3=%white%& SET ENDF=1
SET VL4=%white%& SET ENDF=1
SET VL5=%white%& SET ENDF=1
SET VL6=%white%& SET ENDF=1
SET VL7=%white%& SET ENDF=1
SET VL8=%white%& SET ENDF=1
SET VL9=%white%& SET ENDF=1
SET VL10=%white%& SET ENDF=1
SET VL11=%white%& SET ENDF=1
SET VL12=%white%& SET ENDF=1
SET VL13=%white%& SET ENDF=1
SET VL14=%white%& SET ENDF=1
SET VL15=%white%& SET ENDF=1

IF %WPS%==0x2a SET VL1=%magenta%& SET ENDF=1
IF %WPS%==0x29 SET VL2=%magenta%& SET ENDF=2
IF %WPS%==0x28 SET VL3=%magenta%& SET ENDF=3
IF %WPS%==0x26 SET VL4=%magenta%& SET ENDF=4
IF %WPS%==0x25 SET VL5=%magenta%& SET ENDF=5
IF %WPS%==0x24 SET VL6=%magenta%& SET ENDF=6
IF %WPS%==0x1a SET VL7=%magenta%& SET ENDF=7
IF %WPS%==0x19 SET VL8=%magenta%& SET ENDF=8
IF %WPS%==0x18 SET VL9=%magenta%& SET ENDF=9
IF %WPS%==0x16 SET VL10=%magenta%& SET ENDF=10
IF %WPS%==0x15 SET VL11=%magenta%& SET ENDF=11
IF %WPS%==0x14 SET VL12=%magenta%& SET ENDF=12
IF %WPS%==0x21 SET VL13=%magenta%& SET ENDF=13
IF %WPS%==0x38 SET VL14=%magenta%& SET ENDF=14
IF %WPS%==0x36 SET VL15=%magenta%& SET ENDF=15

IF %ENDF%==1 (SET AFFEN=%grey%®ÄÄ®[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==2 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==3 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==4 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==5 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==6 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==7 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==8 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==9 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==10 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==11 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==12 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==13 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==14 (SET AFFEN=%white%®ÄÄ®%gold%[1]%white%    %gold%[2]%white%¯ÄÄ¯)
IF %ENDF%==15 (SET AFFEN=%white%®ÄÄ®%gold%[1]%grey%    [2]¯ÄÄ¯%white%)
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³                                                                                                                                        ³
echo ³     %grey%[* Vous pouvez tester differentes valeurs instantanement en jeu.                      ]%white%                                            ³
echo ³     %grey%[* Win32PrioritySeparation = %WPS%                                                    ]%white%                                            ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                %VL1%2A%white% - %VL2%29%white% - %VL3%28%white% - %VL4%26%white% - %VL5%25%white% - %VL6%24%white% - %VL7%1A%white% - %VL8%19%white% - %VL9%18%white% - %VL10%16%white% - %VL11%15%white% - %VL12%14%white% - %VL13%21%white% - %VL14%38%white% - %VL15%36%white%                                ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ³                                                                                                                                        ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ%white%[ %AFFEN% ]%white%ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
choice /C:12 /N /M "-
If "%ERRORLEVEL%"=="1" (
	IF %ENDF%==1 goto :BENCH
	SET /a ENDF=%ENDF%-1
	IF %WPS%==0x2a goto :BENCH
	IF %WPS%==0x29 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x2A" /f >nul& goto :BENCH
	IF %WPS%==0x28 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x29" /f >nul& goto :BENCH
	IF %WPS%==0x26 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x28" /f >nul& goto :BENCH
	IF %WPS%==0x25 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x26" /f >nul& goto :BENCH
	IF %WPS%==0x24 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x25" /f >nul& goto :BENCH
	IF %WPS%==0x1a Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x24" /f >nul& goto :BENCH
	IF %WPS%==0x19 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x1A" /f >nul& goto :BENCH
	IF %WPS%==0x18 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x19" /f >nul& goto :BENCH
	IF %WPS%==0x16 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x18" /f >nul& goto :BENCH
	IF %WPS%==0x15 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x16" /f >nul& goto :BENCH
	IF %WPS%==0x14 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x15" /f >nul& goto :BENCH
	IF %WPS%==0x21 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x14" /f >nul& goto :BENCH
	IF %WPS%==0x38 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x21" /f >nul& goto :BENCH
	IF %WPS%==0x36 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x38" /f >nul& goto :BENCH
	goto :BENCH
)
If "%ERRORLEVEL%"=="2" (
	IF %ENDF%==15 goto :BENCH
	SET /a ENDF=%ENDF%+1
	IF %WPS%==0x2a Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x29" /f >nul& goto :BENCH
	IF %WPS%==0x29 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x28" /f >nul& goto :BENCH
	IF %WPS%==0x28 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x26" /f >nul& goto :BENCH
	IF %WPS%==0x26 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x25" /f >nul& goto :BENCH
	IF %WPS%==0x25 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x24" /f >nul& goto :BENCH
	IF %WPS%==0x24 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x1A" /f >nul& goto :BENCH
	IF %WPS%==0x1a Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x19" /f >nul& goto :BENCH
	IF %WPS%==0x19 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x18" /f >nul& goto :BENCH
	IF %WPS%==0x18 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x16" /f >nul& goto :BENCH
	IF %WPS%==0x16 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x15" /f >nul& goto :BENCH
	IF %WPS%==0x15 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x14" /f >nul& goto :BENCH
	IF %WPS%==0x14 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x21" /f >nul& goto :BENCH
	IF %WPS%==0x21 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x38" /f >nul& goto :BENCH
	IF %WPS%==0x38 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x36" /f >nul& goto :BENCH
	IF %WPS%==0x36 goto :BENCH
	goto :BENCH
)

:AUT1
IF EXIST "C:\Ect\Alimentation\RECS-H-PowerPlan.pow" Powercfg /import %systemdrive%\Ect\Alimentation\RECS-H-PowerPlan.pow 11111111-1111-1111-1111-111111134587
IF EXIST "C:\Ect\Alimentation\Normale.pow" Powercfg /import %systemdrive%\Ect\Alimentation\Normale.pow 11111111-1111-1111-1111-888111134588
:AUTT
SET "GD="
SET "STTME="
SET "BBCLS=0"
SET "PRIORITY=8"
SET "errorlevel="
SET "processPath="
SET "processToMonitor="
cd /d %~dp0
mode con:cols=138 lines=23
color 7
cls

IF NOT EXIST exe_gamename.txt curl -g -k -L -# -o "exe_gamename.txt" "https://raw.githubusercontent.com/00FGV1/ver/main/exe_gamename.txt"

:checkProcess
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x26" /f >nul
Powercfg /SETACTIVE "11111111-1111-1111-1111-888111134588"
bcdedit /set useplatformtick false
bcdedit /set useplatformclock false
bcdedit /set disabledynamictick yes
sc start STR

setlocal enabledelayedexpansion
set "inputFile=exe_gamename.txt"
cls

IF NOT EXIST exe_gamename.txt echo %red%ERROR "exe_gamename.txt" MISSING%white%&pause&Exit

echo En attente d'un jeu ...
for /f %%i in (%inputFile%) do (
    set "processToMonitor=%%i"
    for /f "tokens=2 delims=," %%a in ('wmic process where "name='!processToMonitor!'" get executablepath /format:csv ^| find /i "!processToMonitor!"') do (
        set "processPath=%%~a" 
		if defined processPath (
			goto :FPR
		) > NUL 2>&1
    ) > NUL 2>&1
) > NUL 2>&1

endlocal
timeout /nobreak /t 90 > nul
goto :checkProcess

:FPR
cls

Powercfg /SETACTIVE "11111111-1111-1111-1111-111111134587"
IF !processToMonitor!==RainbowSix.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x36" /f >nul
IF !processToMonitor!==VALORANT.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x38" /f >nul
IF !processToMonitor!==r5apex.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x29" /f >nul
IF !processToMonitor!==FortniteClient-Win64-Shipping.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x2A" /f >nul
IF !processToMonitor!==RainbowSix.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x36" /f >nul
IF !processToMonitor!==NMS.exe (
	Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x18" /f >nul
	bcdedit /deletevalue useplatformclock
	bcdedit /deletevalue tscsyncpolicy
	bcdedit /deletevalue disabledynamictick
	sc stop STR
)

SET STTME=%time%
Reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f >NUL
Reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "1" /f >NUL

Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\!processToMonitor!" /v "Version" /t REG_SZ /d "1.0" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\!processToMonitor!" /v "Application Name" /t REG_SZ /d "!processPath!" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\!processToMonitor!" /v "Protocol" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\!processToMonitor!" /v "Local Port" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\!processToMonitor!" /v "Local IP" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\!processToMonitor!" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\!processToMonitor!" /v "Remote Port" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\!processToMonitor!" /v "Remote IP" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\!processToMonitor!" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\!processToMonitor!" /v "DSCP Value" /t REG_SZ /d "46" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\!processToMonitor!" /v "Throttle Rate" /t REG_SZ /d "-1" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "!processPath!" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE RUNASADMIN HIGHDPIAWARE" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "!processPath!" /t REG_SZ /d "GpuPreference=2;" /f > NUL 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\!processToMonitor!\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
wmic process where name="!processToMonitor!" CALL setpriority 128 >NUL

wmic process where name="waterfox.exe" CALL setpriority 64 >NUL
wmic process where name="firefox.exe" CALL setpriority 64 >NUL
wmic process where name="chrome.exe" CALL setpriority 64 >NUL
wmic process where name="opera.exe" CALL setpriority 64 >NUL
wmic process where name="steam.exe" CALL setpriority 64 >NUL
wmic process where name="steamwebhelper.exe" CALL setpriority 64 >NUL
wmic process where name="rare.exe" CALL setpriority 64 >NUL
wmic process where name="MicrosoftEdgeUpdate.exe" CALL setpriority 64 >NUL
wmic process where name="Edge.exe" CALL setpriority 64 >NUL
wmic process where name="EmptyStandbyList.exe" CALL setpriority 64 >NUL
wmic process where name="ESL.exe" CALL setpriority 64 >NUL
wmic process where name="EpicGamesLauncher.exe" CALL setpriority 64 >NUL
wmic process where name="Spotify.exe" CALL setpriority 64 >NUL
wmic process where name="BakkesMod.exe" CALL setpriority 64 >NUL
wmic process where name="EpicOnlineServices.exe" CALL setpriority 64 >NUL
wmic process where name="EpicOnlineServicesHost.exe" CALL setpriority 64 >NUL
wmic process where name="EpicWebHelper.exe" CALL setpriority 64 >NUL
wmic process where name="Vlc.exe" CALL setpriority 64 >NUL
wmic process where name="Update.exe" CALL setpriority 64 >NUL
wmic process where name="Discord.exe" CALL setpriority 64 >NUL
wmic process where name="simplewall.exe" CALL setpriority 64 >NUL
wmic process where name="wallpaper32.exe" CALL setpriority 64 >NUL
wmic process where name="updater.exe" CALL setpriority 64 >NUL
wmic process where name="7zFM.exe" CALL setpriority 64 >NUL
wmic process where name="7z.exe" CALL setpriority 64 >NUL
wmic process where name="Authy Desktop.exe" CALL setpriority 64 >NUL
wmic process where name="Optimizer.exe" CALL setpriority 64 >NUL
wmic process where name="Services.exe" CALL setpriority 64 >NUL
wmic process where name="RLBotGUIX.exe" CALL setpriority 64 >NUL
wmic process where name="StartAllBackCfg.exe" CALL setpriority 64 >NUL
wmic process where name="UpdateCheck.exe" CALL setpriority 64 >NUL
wmic process where name="streamlink.exe" CALL setpriority 64 >NUL
wmic process where name="streamlinkw.exe" CALL setpriority 64 >NUL
wmic process where name="streamlink-twitch-gui.exe" CALL setpriority 64 >NUL
wmic process where name="Cheat Engine.exe" CALL setpriority 64 >NUL
wmic process where name="cheatengine-i386.exe" CALL setpriority 64 >NUL
wmic process where name="cheatengine-x86_64.exe" CALL setpriority 64 >NUL
wmic process where name="cheatengine-x86_64-SSE4-AVX2.exe" CALL setpriority 64 >NUL
wmic process where name="TEST.exe" CALL setpriority 64 >NUL
wmic process where name="StartUP.exe" CALL setpriority 64 >NUL
wmic process where name="WinMemoryCleaner.exe" CALL setpriority 64 >NUL
wmic process where name="AdguardPortable.tmp" CALL setpriority 64 >NUL
wmic process where name="AdguardPortable.exe" CALL setpriority 64 >NUL
wmic process where name="AdguardSvc.exe" CALL setpriority 64 >NUL
wmic process where name="AdguardPortable.exe" CALL setpriority 64 >NUL
wmic process where name="Adguard.BrowserExtensionHost.exe" CALL setpriority 64 >NUL
wmic process where name="Adguard.exe" CALL setpriority 64 >NUL
wmic process where name="Adguard.Tools.exe" CALL setpriority 64 >NUL
wmic process where name="certutil.exe" CALL setpriority 64 >NUL
wmic process where name="maintenancetool.exe" CALL setpriority 64 >NUL
wmic process where name="SteelSeriesGG.exe" CALL setpriority 64 >NUL
wmic process where name="SteelSeriesUpdateService.exe" CALL setpriority 64 >NUL
wmic process where name="SteelSeriesGGClient.exe" CALL setpriority 64 >NUL
wmic process where name="SSHZExecutor.exe" CALL setpriority 64 >NUL
wmic process where name="SSOverlay.exe" CALL setpriority 64 >NUL
wmic process where name="SteelSeriesEngine.exe" CALL setpriority 64 >NUL
wmic process where name="win_driver_installer.exe" CALL setpriority 64 >NUL
wmic process where name="computerhardwareids.exe" CALL setpriority 64 >NUL
wmic process where name="explorer.exe" CALL setpriority 64 >NUL
wmic process where name="spoolsv.exe" CALL setpriority 64 >NUL
wmic process where name="spaceman.exe" CALL setpriority 64 >NUL
wmic process where name="spaceutil.exe" CALL setpriority 64 >NUL
wmic process where name="Spectrum.exe" CALL setpriority 64 >NUL
wmic process where name="sort.exe" CALL setpriority 64 >NUL
wmic process where name="SpaceAgent.exe" CALL setpriority 64 >NUL
wmic process where name="slui.exe" CALL setpriority 64 >NUL
wmic process where name="dwm.exe" CALL setpriority 64 >NUL
wmic process where name="audiodg.exe" CALL setpriority 64 >NUL
wmic process where name="Taskmgr.exe" CALL setpriority 64 >NUL
wmic process where name="ntprint.exe" CALL setpriority 64 >NUL
wmic process where name="csrss.exe" CALL setpriority 64 >NUL
wmic process where name="ctfmon.exe" CALL setpriority 64 >NUL
wmic process where name="svchost.exe" CALL setpriority 64 >NUL
wmic process where name="WmiPrvSE.exe" CALL setpriority 64 >NUL
wmic process where name="notepad.exe" CALL setpriority 64 >NUL
wmic process where name="RuntimeBroker.exe" CALL setpriority 64 >NUL
wmic process where name="dllhost.exe" CALL setpriority 64 >NUL
wmic process where name="sppsvc.exe" CALL setpriority 64 >NUL
wmic process where name="wallpaperservice32_c.exe" CALL setpriority 64 >NUL
wmic process where name="ui32.exe" CALL setpriority 64 >NUL
wmic process where name="SetTimerResolutionService.exe" CALL setpriority 64 >NUL
wmic process where name="vmms.exe" CALL setpriority 64 >NUL
wmic process where name="lsass.exe" CALL setpriority 64 >NUL
wmic process where name="Magnify.exe" CALL setpriority 64 >NUL
wmic process where name="lusrmgr.msc" CALL setpriority 64 >NUL
wmic process where name="manage-bde.exe" CALL setpriority 64 >NUL
wmic process where name="winlogon.exe" CALL setpriority 64 >NUL
wmic process where name="manage-bde.exe" CALL setpriority 64 >NUL
wmic process where name="winload.exe" CALL setpriority 64 >NUL
wmic process where name="wininit.exe" CALL setpriority 64 >NUL
wmic process where name="WindowsUpdateElevatedInstaller.exe" CALL setpriority 64 >NUL
wmic process where name="smss.exe" CALL setpriority 64 >NUL
wmic process where name="sihost.exe" CALL setpriority 64 >NUL
wmic process where name="MicrosoftEdgeUpdate.exe" CALL setpriority 64 >NUL
wmic process where name="ntoskrnl.exe" CALL setpriority 64 >NUL
wmic process where name="manage-bde.exe" CALL setpriority 64 >NUL
wmic process where name="services.exe" CALL setpriority 64 >NUL
wmic process where name="lghub_updater.exe" CALL setpriority 64 >NUL
wmic process where name="lghub_uninstaller.exe" CALL setpriority 64 >NUL
wmic process where name="lghub_agent.exe" CALL setpriority 64 >NUL
wmic process where name="lghub.exe" CALL setpriority 64 >NUL
wmic process where name="logi_crashpad_handler.exe" CALL setpriority 64 >NUL
wmic process where name="lghub_system_tray.exe" CALL setpriority 64 >NUL
wmic process where name="librewolf.exe" CALL setpriority 64 >NUL

SET CURRENTKEY=HKLM\SYSTEM\ControlSet001\Control\PriorityControl
FOR /F "TOKENS=2,*" %%A IN ('reg query "%CURRENTKEY%" 2^>NUL^|FIND /I "Win32PrioritySeparation"') DO set WPS=%%B >NUL 2>nul

IF EXIST "C:\Ect\Outils\Gms\WinMemoryCleaner.exe" START "" "C:\Ect\Outils\Gms\WinMemoryCleaner.exe" /StandbyList
IF EXIST "C:\Ect\Outils\Gms\WinMemoryCleaner.exe" START "" "C:\Ect\Outils\Gms\WinMemoryCleaner.exe" /CombinedPageList
IF EXIST "C:\Ect\Outils\Gms\WinMemoryCleaner.exe" START "" "C:\Ect\Outils\Gms\WinMemoryCleaner.exe" /ProcessesWorkingSet

:CRAMS
cd /d %~dp0
mode con:cols=138 lines=23
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo.
echo.
echo    Jeu en cours d'execution      = %gold%!processToMonitor!%white%
echo    Win32PrioritySeparation       = %gold%%WPS%%white%
echo    Emplacement du jeu            = %gold%!processPath!%white%
IF %CRAM%==1 (
	echo    Heures de la derniere boucle  = %gold%%time%%white%
	echo    Boucle                        = %gold%%BBCLS%%white%
) else (
	echo.
	echo.
)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
IF %CRAM%==1 (
	echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
) else (
	echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄAppuyez sur une touche lorsque le jeu est ferme.ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
)

echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

IF %CRAM%==0 (
	Pause>nul
	endlocal
	goto :AUTT
)

tasklist /fi "imagename eq !processToMonitor!" | findstr /i "!processToMonitor!" > nul

if %errorlevel% equ 0 (
	goto :GDD
) else (
	echo GAME : !processToMonitor! // START : %STTME% // END : %time%>>C:\Ect\RWC\DQS\DQS.log
	endlocal
	goto :AUTT
)

:GDD
@timeout /nobreak /t 900 > nul
SET /a BBCLS=%BBCLS%+1
IF EXIST "C:\Ect\Outils\Gms\WinMemoryCleaner.exe" START "" "C:\Ect\Outils\Gms\WinMemoryCleaner.exe" /StandbyListLowPriority
SET "errorlevel="
goto :CRAMS
