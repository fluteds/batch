@echo off

:: Disable hibernation 
:: Or it will hibernate instead of sleeping
:: powercfg -h off 

title The PC will sleep in 30 minutes

echo.
echo IMPORTANT
echo Make sure to run powercfg -h off 
echo if you haven't already to disable hibernation.

C:\Windows\System32\timeout.exe 1800

rundll32.exe powrprof.dll,SetSuspendState 0,1,0