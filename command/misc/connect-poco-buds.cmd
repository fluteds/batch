@echo off

rem Bluetooth doesn't like running without Admin

:BatchGotAdmin
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
title Buds: Requesting Administrative Privileges
echo Buds: Requesting Administrative Privileges
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

btcom -r -b 6C:d3:EE:3A:9A:DC -s110b
btcom -c -b 6C:d3:EE:3A:9A:DC -s110b

if NOT ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)