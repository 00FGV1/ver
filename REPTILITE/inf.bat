@echo off
cd /d %~dp0
cls
call bin\GPUN.bat
call bin\CPUN.bat
timeout /t 02 /nobreak>nul
call GPUINF.bat
call CPUINF.bat
timeout /t 01 /nobreak>nul
cls
Reg.exe add "HKLM\SOFTWARE\RECS" /v "GPUNAME" /t REG_SZ /d "%GPUNAME%" /f >nul
Reg.exe add "HKLM\SOFTWARE\RECS" /v "GPURES" /t REG_SZ /d "%GPURES%" /f >nul
Reg.exe add "HKLM\SOFTWARE\RECS" /v "GPUHZ" /t REG_SZ /d "%GPUHZ%" /f >nul
Reg.exe add "HKLM\SOFTWARE\RECS" /v "CPUNAME" /t REG_SZ /d "%CPUNAME%" /f >nul
Exit /b