@echo off

rem Bluetooth doesn't like running without Admin
rem Might require paring on the headset? Not too sure yet

:BatchGotAdmin
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
title Sony WH-1000XM4: Requesting Administrative Privileges
echo Sony WH-1000XM4: Requesting Administrative Privileges
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

btcom -r -b 80:99:E7:27:71:97 -s110b
btcom -c -b 80:99:E7:27:71:97 -s110b

if not ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)