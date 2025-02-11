Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File %temp%\log.ps1 ""C:\Program Files\Obyss.log""", 0, False
