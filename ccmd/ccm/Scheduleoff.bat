@echo off
sc config "Schedule" start=disabled
@timeout /t 01>nul
sc stop Schedule
Exit