@echo off
title Get Wifi Password
netsh wlan show profiles
echo.
echo Get a password for a connected network below
set /P name=Enter network profile name: 
netsh wlan show profile name="%name%" key=clear
pause