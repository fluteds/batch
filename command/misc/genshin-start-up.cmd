@echo off

:: BatchGotAdmin
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

rem These are all legal to use within the game.
rem However, you should use caution when using them.

rem Start Genshin Fishing
start C:\Users\%username%\Desktop\Genshin\GenshinFishing.exe
rem Start Macro Helper (Quality of Life)
start C:\Users\%username%\Desktop\Genshin\GIS\GIS.exe
rem Start Unlock FPS for Genshin (increases FPS past 60)
start C:\Users\%username%\Desktop\Genshin\unlockfps_clr.exe

if not ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)
