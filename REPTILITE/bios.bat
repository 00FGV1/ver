@echo off

powershell.exe -Command "$ShortcutFile='%UserProfile%\Desktop\BIOS.lnk'; $Shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut($ShortcutFile); $Shortcut.TargetPath='C:\Windows\System32\shutdown.exe'; $Shortcut.Arguments='/r /fw /t 00'; $Shortcut.IconLocation='%SystemRoot%\System32\SHELL32.dll,12'; $Shortcut.Save()"

del "%~f0"
Exit
