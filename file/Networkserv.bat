@echo off
title Network
cls
netsh winsock reset
netsh int tcp set global autotuninglevel=normal
netsh advfirewall set allprofiles state off >nul 2>&1
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound >nul 2>&1
netsh advfirewall set allprofiles state on >nul 2>&1
netsh winsock reset >nul 2>&1
ipconfig /flushdns
ipconfig /registerdns
Exit /b
