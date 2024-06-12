:MMENU
@echo off
@Title DQS
SET NVER=0.4
set black=[30m
set red=[31m
set green=[32m
set yellow=[33m
set yyellow=[43m
set blue=[34m
set magenta=[35m
set bmagenta=[45m
set cyan=[36m
set white=[37m
set defcolor=[49m
set gold=[38;5;220m
set ggold=[48;5;220m
set grey=[90m
set orange=[38;5;208m
set indigo=[38;5;105m
cd /d %~dp0
mode con:cols=141 lines=22
color 7
cls

SET HTO=102
SET MDQS=ERR
SET KDQS=ERR
SET WPS=ERR
SET ENDF=0
SET CRAM=0
SET BBCLS=0
SET SAACT=0

if /i "%~1"=="/4" (
	SET HTO=98
)

if /i "%~1"=="/SCAN" (
	rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
	mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
	if %errorlevel% neq 0 (
		powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0' /SCAN" >nul 2>&1 & exit /b
	)
	SET SAACT=0
	goto :SCAN
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
	goto :AUTT
)

rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
if %errorlevel% neq 0 (
	powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0' /SCAN" >nul 2>&1 & exit /b
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
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ %gold%MouseDataQueueSize%white%   %gold%KeyboardDataQueueSize%white%                                     %gold%Win32PrioritySeparation%white%                                    ³
echo ³ÚÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿³
echo ³³ %indigo%[1]%white% ³ %AF1%10%defcolor%         ³ ³ %indigo%[10]%white% ³ %AF10%10%defcolor%           ³ ³ %indigo%[19]%white% ³ %AF19%%grey%{42}%white% 0x%green%2A%white%%defcolor% Hex = Court ³ Fixe     ³ Priorite elevee  de l'executable au premier plan ³³
echo ³³ %indigo%[2]%white% ³ %AF2%12%defcolor%         ³ ³ %indigo%[11]%white% ³ %AF11%12%defcolor%           ³ ³ %indigo%[20]%white% ³ %AF20%%grey%{41}%white% 0x%green%29%white%%defcolor% Hex = Court ³ Fixe     ³ Priorite moyenne de l'executable au premier plan ³³
echo ³³ %indigo%[3]%white% ³ %AF3%14%defcolor%         ³ ³ %indigo%[12]%white% ³ %AF12%14%defcolor%           ³ ³ %indigo%[21]%white% ³ %AF21%%grey%{40}%white% 0x%green%28%white%%defcolor% Hex = Court ³ Fixe     ³ Aucune priorite  de l'executable au premier plan ³³
echo ³³ %indigo%[4]%white%ÚÁ¿%AF4%16%defcolor%         ³ ³ %indigo%[13]%white%ÚÁ¿%AF13%16%defcolor%           ³ ³ %indigo%[22]%white% ³ %AF22%%grey%{38}%white% 0x%green%26%white%%defcolor% Hex = Court ³ Variable ³ Priorite elevee  de l'executable au premier plan ³³
echo ³³ %indigo%[5]%white%³%ggold% %defcolor%³%AF5%18%defcolor%         ³ ³ %indigo%[14]%white%³%ggold% %defcolor%³%AF14%18%defcolor%           ³ ³ %indigo%[23]%white% ³ %AF23%%grey%{37}%white% 0x%green%25%white%%defcolor% Hex = Short ³ Variable ³ Priorite moyenne de l'executable au premier plan ³³
echo ³³ %indigo%[6]%white%ÀÂÙ%AF6%20%defcolor%         ³ ³ %indigo%[15]%white%ÀÂÙ%AF15%20%defcolor%           ³ ³ %indigo%[24]%white% ³ %AF24%%grey%{36}%white% 0x%green%24%white%%defcolor% Hex = Court ³ Variable ³ Aucune priorite  de l'executable au premier plan ³³
echo ³³ %indigo%[7]%white% ³ %AF7%30%defcolor%         ³ ³ %indigo%[16]%white% ³ %AF16%30%defcolor%           ³ ³ %indigo%[25]%white% ³ %AF25%%grey%{26}%white% 0x%green%1A%white%%defcolor% Hex = Long  ³ Fixe     ³ Priorite elevee  de l'executable au premier plan ³³
echo ³³ %indigo%[8]%white% ³ %AF8%50%defcolor%         ³ ³ %indigo%[17]%white% ³ %AF17%50%defcolor%           ³ ³ %indigo%[26]%white% ³ %AF26%%grey%{25}%white% 0x%green%19%white%%defcolor% Hex = Long  ³ Fixe     ³ Priorite moyenne de l'executable au premier plan ³³
echo ³³ %indigo%[9]%white% ³ %AF9%100%defcolor%        ³ ³ %indigo%[18]%white% ³ %AF18%100%defcolor%          ³ ³ %indigo%[27]%white%ÚÁ¿%AF27%%grey%{24}%white% 0x%green%18%white%%defcolor% Hex = Long  ³ Fixe     ³ Aucune priorite  de l'executable au premier plan ³³
echo ³ÀÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ³ %indigo%[28]%white%³%ggold% %defcolor%³%AF28%%grey%{22}%white% 0x%green%16%white%%defcolor% Hex = Long  ³ Variable ³ Priorite elevee  de l'executable au premier plan ³³
echo ³ %bmagenta%    %defcolor% = La valeur actuelle dans le registre  ³ %indigo%[29]%white%ÀÂÙ%AF29%%grey%{21}%white% 0x%green%15%white%%defcolor% Hex = Long  ³ Variable ³ Priorite moyenne de l'executable au premier plan ³³
echo ³ %ggold%    %defcolor% = Option recommandee en general        ³ %indigo%[30]%white% ³ %AF30%%grey%{20}%white% 0x%green%14%white%%defcolor% Hex = Long  ³ Variable ³ Aucune priorite  de l'executable au premier plan ³³
echo ³ %grey%{**}%white% = La valeur en decimale                ³ %indigo%[31]%white% ³ %AF31%%grey%{33}%white% 0x%green%21%white%%defcolor% Hex = Court ³ Fixe     ³ Priorite moyenne de l'executable au premier plan ³³
echo ³                                             ³ %indigo%[32]%white% ³ %AF32%%grey%{56}%white% 0x%green%38%white%%defcolor% Hex = Long  ³ Fixe     ³ Priorite elevee  de l'executable au premier plan ³³
echo ³ %grey%Valeur par defaut Windows:%white%                  ³ %indigo%[33]%white% ³ %AF33%%grey%{54}%white% 0x%green%36%white%%defcolor% Hex = Long  ³ Variable ³ Priorite elevee  de l'executable au premier plan ³³
echo ³        %grey%MouseDataQueueSize      = 100 (0x64)%white% ÀÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ³
echo ³        %grey%KeyboardDataQueueSize   = 100 (0x64)%white% ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo ³        %grey%Win32PrioritySeparation = 2   (0x2)%white%  ³ %grey%[ MDQS = %MDQS% ³ KDQS = %KDQS% ³ WIN32PS = %WPS% ³ VER = %NVER% ]%white%
set /p a=ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ%green%^>%white%

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
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x12" /f >nul
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x12" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x16" /f >nul
)

if %a%==x (
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "0x12" /f >nul
	Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "0x12" /f >nul
	Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x16" /f >nul
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

:AUTT
SET "GD="
SET "STTME="
SET "ESLB=0"
SET "ESLT=0"
SET "BBCLS=0"
SET "PRIORITY=8"
SET "ERRBCL=0"
SET "errorlevel="
SET "processPath="
SET "processToMonitor="
cd /d %~dp0
mode con:cols=138 lines=23
color 7
cls

IF NOT EXIST exe_gamename_acv.txt (
	SET SAACT=1
	goto :SCAN
)

:checkProcess
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x26" /f >nul

setlocal enabledelayedexpansion
set "inputFile=exe_gamename_acv.txt"
cls

IF NOT EXIST exe_gamename_acv.txt echo %red%ERROR "exe_gamename_acv.txt" MISSING%white%&pause&Exit

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
timeout /nobreak /t 20 > nul
goto :checkProcess

:FPR
cls

(
	echo SET PTMR=!processToMonitor!
	echo SET PPTH=!processPath!
)>PRASTT.bat

IF EXIST EETMP.DQS SET ERRBCL=1
IF NOT EXIST EETMP.DQS echo Y>EETMP.DQS

IF !processToMonitor!==7DaysToDie.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x16" /f >nul
IF !processToMonitor!==RainbowSix.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x36" /f >nul
IF !processToMonitor!==VALORANT.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x38" /f >nul
IF !processToMonitor!==r5apex.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x29" /f >nul
IF !processToMonitor!==FortniteClient-Win64-Shipping.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x2A" /f >nul
IF !processToMonitor!==RainbowSix.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x36" /f >nul
IF !processToMonitor!==NMS.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x18" /f >nul
IF !processToMonitor!==Borderlands3.exe Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x16" /f >nul

SET STTME=%time%
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f >NUL
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "1" /f >NUL

IF EXIST PRASTT.bat call PRASTT.bat

Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%PTMR%" /v "Application Name" /t REG_SZ /d "%PPTH%" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%PTMR%" /v "Protocol" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%PTMR%" /v "Local Port" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%PTMR%" /v "Local IP" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%PTMR%" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%PTMR%" /v "Remote Port" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%PTMR%" /v "Remote IP" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%PTMR%" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%PTMR%" /v "DSCP Value" /t REG_SZ /d "46" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\%PTMR%" /v "Throttle Rate" /t REG_SZ /d "-1" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%PPTH%" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE RUNASADMIN HIGHDPIAWARE" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "%PPTH%" /t REG_SZ /d "GpuPreference=2;" /f > NUL 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%PTMR%\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
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
wmic process where name="gamingservices.exe" CALL setpriority 64 >NUL

taskkill /f /im vmware-authd.exe >NUL 2>nul
taskkill /f /im vmnat.exe >NUL 2>nul
taskkill /f /im vmware.exe >NUL 2>nul
taskkill /f /im vmware-tray.exe >NUL 2>nul
taskkill /f /im vmware-usbarbitrator64.exe >NUL 2>nul
taskkill /f /im vmnetdhcp.exe >NUL 2>nul

sc stop WaaSMedicSvc >NUL 2>nul
sc stop wuauserv >NUL 2>nul
sc stop WSearch >NUL 2>nul
sc stop msiserver >NUL 2>nul
sc stop VMUSBArbService >NUL 2>nul
sc stop VMnetDHCP >NUL 2>nul
sc stop VMware NAT Service >NUL 2>nul
sc stop VMAuthdService >NUL 2>nul
sc stop VmwareAutostartService >NUL 2>nul
sc stop EventSystem >NUL 2>nul
sc stop SysMain >NUL 2>nul
sc stop SENS >NUL 2>nul
sc stop Eventlog >NUL 2>nul
sc stop Eventlog-Forwarding >NUL 2>nul
sc stop eventlog-service >NUL 2>nul
sc stop BITS >NUL 2>nul
sc stop PerfProc >NUL 2>nul
sc stop InstallService >NUL 2>nul
sc stop Wcmsvc >NUL 2>nul
sc stop StiSvc >NUL 2>nul

SET CURRENTKEY=HKLM\SYSTEM\ControlSet001\Control\PriorityControl
FOR /F "TOKENS=2,*" %%A IN ('reg query "%CURRENTKEY%" 2^>NUL^|FIND /I "Win32PrioritySeparation"') DO set WPS=%%B >NUL 2>nul

IF EXIST "C:\Ect\Outils\Gms\EmptyStandbyList.exe" START "" /B /min "C:\Ect\Outils\Gms\EmptyStandbyList.exe"
:CRAMS
cd /d %~dp0
mode con:cols=138 lines=23
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo.
echo    %grey%Info jeu :%white%
echo    Jeu en cours d'execution      = %gold%!processToMonitor!%white%
echo    Win32PrioritySeparation       = %gold%%WPS%%white%
echo    Emplacement du jeu            = %gold%!processPath!%white%
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
echo.
echo.
IF %CRAM%==1 (
	IF %ERRBCL%==1 (
		echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
		echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄAppuyez sur une touche lorsque le jeu est ferme.ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ[%red%ERR BOUCLE%white%]ÄÙ
		goto :ERRS
	)
	echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
) else (
	echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄAppuyez sur une touche lorsque le jeu est ferme.ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
)

:ERRS

Pause>nul
endlocal
goto :AUTT

:SCAN
IF EXIST C:\Ect\RWC\DQS\exe_gamename.txt DEL C:\Ect\RWC\DQS\exe_gamename.txt
IF EXIST C:\Ect\RWC\DQS\exe_gamename_act.txt DEL C:\Ect\RWC\DQS\exe_gamename_act.txt
IF EXIST C:\Ect\RWC\DQS\exe_gamename_acv.txt DEL C:\Ect\RWC\DQS\exe_gamename_acv.txt
:REVERIF
cls
IF EXIST cli.c goto :VERIF1
ECHO Le fichier "cli.c" est manquant. Le script va le reinstaller.
curl -g -k -L -# -o "cli.c" "https://raw.githubusercontent.com/00FGV1/ver/main/file/cli.c" >nul 2>&1
ping -n 2 -w 500 127.0.0.1 >nul

:VERIF1
IF EXIST es.exe goto :VERIF2
ECHO Le fichier "es.exe" est manquant. Le script va le reinstaller.
curl -g -k -L -# -o "es.exe" "https://github.com/00FGV1/ver/raw/main/file/es.exe" >nul 2>&1
ping -n 5 -w 2000 127.0.0.1 >nul

:VERIF2
IF EXIST Everything.exe goto :VERIF4
ECHO Le fichier "Everything.exe" est manquant. Le script va le reinstaller.
curl -g -k -L -# -o "Everything.exe" "https://github.com/00FGV1/ver/raw/main/file/Everything.exe" >nul 2>&1
ping -n 5 -w 2000 127.0.0.1 >nul

:VERIF4
IF EXIST Everything.lng goto :VERIF5
ECHO Le fichier "Everything.lng" est manquant. Le script va le reinstaller.
curl -g -k -L -# -o "Everything.lng" "https://github.com/00FGV1/ver/raw/main/file/Everything.lng" >nul 2>&1
ping -n 2 -w 500 127.0.0.1 >nul

:VERIF5
IF EXIST Everything.ini DEL Everything.ini
Start "" "Everything.exe" -startup
Reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "1" /f
cls

ping -n 1 www.google.com > nul 2>&1
if errorlevel 1 (
	Exit
) else (
	curl -g -k -L -# -o "C:\Ect\RWC\DQS\exe_gamename.txt" "https://raw.githubusercontent.com/00FGV1/ver/main/exe_gamename.txt" >nul 2>&1
)

setlocal enabledelayedexpansion
set "inputFile=C:\Ect\RWC\DQS\exe_gamename.txt"
cls

IF NOT EXIST exe_gamename.txt curl -g -k -L -# -o "C:\Ect\RWC\DQS\exe_gamename.txt" "https://raw.githubusercontent.com/00FGV1/ver/main/exe_gamename.txt" >nul 2>&1
cd /d %~dp0
@timeout /nobreak /t 02 > nul

echo Analyse en cours ...
for /f "tokens=*" %%i in (%inputFile%) do (
    for %%j in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        es.exe "%%i" -path "%%j:\" -export-txt "temp_results.txt"
        for /f "delims=" %%k in ('type "temp_results.txt" ^| findstr /i "\.exe$"') do (
            echo %%i>>C:\Ect\RWC\DQS\exe_gamename_act.txt
        )
        del "temp_results.txt"
    )
)

endlocal
taskkill /IM Everything.exe /F >nul
setlocal EnableDelayedExpansion

set "inputFile=exe_gamename_act.txt"
set "outputFile=exe_gamename_acv.txt"

if exist "!outputFile!" del "!outputFile!"

for /f "delims=" %%a in ('type "!inputFile!" ^| sort') do (
    set "currentLine=%%a"
    if not "!previousLine!"=="!currentLine!" (
        echo !currentLine!>>"!outputFile!"
        set "previousLine=!currentLine!"
    )
)

endlocal
IF EXIST C:\Ect\RWC\DQS\exe_gamename.txt DEL C:\Ect\RWC\DQS\exe_gamename.txt
IF EXIST C:\Ect\RWC\DQS\exe_gamename_act.txt DEL C:\Ect\RWC\DQS\exe_gamename_act.txt
cls
IF %SAACT%==1 goto :AUTT
Exit