@echo off
Taskkill /f /im Spotify.exe >nul 2>&1
IF EXIST "C:\Users\%USERNAME%\AppData\Roaming\Spotify\config.ini" DEL "C:\Users\%USERNAME%\AppData\Roaming\Spotify\config.ini" >nul 2>&1
IF EXIST "C:\Users\%USERNAME%\AppData\Roaming\Spotify\dpapi.dll" DEL "C:\Users\%USERNAME%\AppData\Roaming\Spotify\dpapi.dll" >nul 2>&1
IF EXIST "%TEMP%\chrome_elf.zip" DEL "%TEMP%\chrome_elf.zip" >nul 2>&1
IF EXIST "%TEMP%\SpotifySetup.exe" DEL "%TEMP%\SpotifySetup.exe" >nul 2>&1
@timeout /t 01 >nul
IF NOT EXIST "C:\Users\%USERNAME%\AppData\Roaming\Spotify\Spotify.exe" (
    curl -g -k -L -# -o "%TEMP%\SpotifySetup.exe" "https://download.scdn.co/SpotifySetup.exe" >nul 2>&1
    @timeout /t 02 >nul
    START /wait "" "%TEMP%\SpotifySetup.exe" /silent
    @timeout /t 05 >nul
    DEL "%TEMP%\SpotifySetup.exe" >nul 2>&1
    Taskkill /f /im Spotify.exe >nul 2>&1
)
set SCRIPT_PATH=%TEMP%\DownloadBlockTheSpot.ps1
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_PATH%"
START "" "C:\Users\%USERNAME%\AppData\Roaming\Spotify\Spotify.exe"
IF EXIST C:\Users\%USERNAME%\Desktop\Spotify.lnk DEL C:\Users\%USERNAME%\Desktop\Spotify.lnk >nul 2>&1
IF EXIST W:\Windows\Desktop\Spotify.lnk DEL W:\Windows\Desktop\Spotify.lnk >nul 2>&1
DEL %TEMP%\7za.exe >nul 2>&1
DEL %TEMP%\BlockTheSpot.zip >nul 2>&1
DEL %TEMP%\chrome_elf.zip >nul 2>&1
Exit /b
