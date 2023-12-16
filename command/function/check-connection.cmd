::Check connection
@echo off
title Check online connection
cls
echo Pings a chosen site
echo Returns the connection status
echo.
echo Attempting to ping 
echo.
echo duckduckgo.com
echo.
echo STATUS
echo ------

ping -n 1 www.duckduckgo.com >nul
if not errorlevel 1 goto :noerror
if errorlevel 1 goto :error

:noerror
color 0A
echo Connection successful!
pause >nul

:error
color 0C
echo No internet connection. 
echo Try flushing the DNS
echo.
pause >nul
