@echo off
title Network
cls
netsh winsock reset
netsh int tcp set global autotuninglevel=normal
netsh winsock reset >nul 2>&1
ipconfig /flushdns
ipconfig /registerdns
Exit
