@echo off

:BatchGotAdmin
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
echo Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params= %*
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:gotAdmin
pushd "%CD%"
CD /D "%~dp0"

:netsh
netsh winsock reset
netsh int ip reset

:ipconfig
ipconfig /release
ipconfig /renew
ipconfig /flushdns

echo Process Done!
echo For the best results, please restart your PC
choice /c:yn /m:"Do you want to restart?"
IF ERRORLEVEL ==1 GOTO :Restart
IF ERRORLEVEL ==2 GOTO :ExitBat

:Restart
shutdown -r
echo PC will restart in ~1 minute
echo Exiting in 10 seconds
timeout /t 10 /nobreak

:ExitBat
exit
