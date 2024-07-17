@echo off
sc config "Schedule" start=auto
@timeout /t 01>nul
sc start Schedule
Exit