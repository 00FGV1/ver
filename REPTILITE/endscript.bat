@echo off
SET HWID=ERR

rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
if %errorlevel% neq 0 (
	powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0'" >nul 2>&1 & exit /b
)

setlocal enabledelayedexpansion
for /f "skip=1 tokens=*" %%a in ('wmic baseboard get serialnumber') do (
	set "HWID=%%a"
	goto :53745
)

:53745
IF %HWID%==191262638503131 goto :Ex2
IF %HWID%==PF0TRR6A goto :Ex2
IF %HWID%==219925897859274 goto :Ex2
IF %HWID%==J216401760 goto :Ex2
endlocal

IF EXIST "C:\Ect" (
	rmdir /s /q "C:\Ect"
	@timeout /t 10>nul
	attrib +h +s "C:\Ect"
)
DEL "%~f0"
Exit

:Ex2
endlocal
DEL "%~f0"
Exit