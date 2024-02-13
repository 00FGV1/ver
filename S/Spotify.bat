@echo off
IF EXIST "%TEMP%\chrome_elf.zip" DEL "%TEMP%\chrome_elf.zip"
IF EXIST "%TEMP%\SpotifySetup.exe" DEL "%TEMP%\SpotifySetup.exe"
@timeout /t 01 >nul
cls

IF NOT EXIST "%TEMP%\7za.exe" curl -g -k -L -# -o "%TEMP%\7za.exe" "https://github.com/00FGV1/ver/raw/main/file/7za.exe"

IF NOT EXIST "C:\Users\%USERNAME%\AppData\Roaming\Spotify\Spotify.exe" (
	curl -g -k -L -# -o "%TEMP%\SpotifySetup.exe" "https://download.scdn.co/SpotifySetup.exe"
	@timeout /t 02 >nul
	START /wait "" "%TEMP%\SpotifySetup.exe" /silent
	@timeout /t 05 >nul
	DEL "%TEMP%\SpotifySetup.exe"
	Taskkill /f /im Spotify.exe
)

IF NOT EXIST "%TEMP%\chrome_elf.zip" (
	curl -g -k -L -# -o "%TEMP%\chrome_elf.zip" "https://github.com/mrpond/BlockTheSpot/releases/download/2023.11.29.98/chrome_elf.zip"
	@timeout /t 02 >nul
)

%TEMP%\7za.exe -y x %TEMP%\chrome_elf.zip -oC:\Users\%USERNAME%\AppData\Roaming\Spotify >nul
@timeout /t 02 >nul
START "" "C:\Users\%USERNAME%\AppData\Roaming\Spotify\Spotify.exe"
Exit /b