@echo off

:netsh
netsh winsock reset
netsh int ip reset

:ipconfig
ipconfig /release
ipconfig /renew
ipconfig /flushdns

echo Process Done!
echo For the best results, please restart your PC
choice /C:YN /M:"Do you want to restart?"
IF ERRORLEVEL ==1 GOTO Restart
IF ERRORLEVEL ==2 GOTO ExitBat

::Restart
shutdown -r
echo PC will restart in ~1 minute
echo Exiting in 5 seconds
timeout /t 5 /nobreak

::ExitBat
exit
