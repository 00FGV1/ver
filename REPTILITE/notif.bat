@echo off
cls
start /b powershell [Reflection.Assembly]::LoadWithPartialName("""System.Windows.Forms""");$obj=New-Object Windows.Forms.NotifyIcon;$obj.Icon = [drawing.icon]::ExtractAssociatedIcon("""6754.ico""");$obj.Visible = $True;$obj.ShowBalloonTip(100000, """Optimisation""","""Fin de l'optimisation""",1)>nul
Exit
