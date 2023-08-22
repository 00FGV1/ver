@echo off
cd /d %~dp0
cls
setlocal enabledelayedexpansion

set "exeFiles[0]=es.exe"
set "exeFiles[1]=Everything.exe"

set "expectedMD5s[0]=2782c4a86c13941fc1a9a0232684ccfb"
set "expectedMD5s[1]=0170601e27117e9639851a969240b959"

set "verificationStatus=Correct"

for /l %%i in (0,1) do (
    set "exeFile=!exeFiles[%%i]!"
    set "expectedMD5=!expectedMD5s[%%i]!"
    
    for %%F in ("!exeFile!") do (
        for /f "tokens=*" %%I in ('certutil -hashfile "%%~fF" MD5 ^| find /v ":"') do (
            set "computedMD5=%%I"
        )
    )

    if "!computedMD5!"=="!expectedMD5!" (
	set "vghhtv=1"
    ) else (
        set "verificationStatus=Erreur"
    )
)

if "!verificationStatus!"=="Correct" (
    Exit /b
) else (
    Exit /b 1
)
