@echo off

title Check port

color 0A
cls

::Check port
echo Please wait ...
netstat -ano
tasklist|findstr "9999"
pause >nul