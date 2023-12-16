@echo off
title Delete JavaCheck.jar files

rem Run if you keep getting Java Error 1 on launching an older Minecraft Version.
rem This is a known issue with JavaCheck.jar.

echo.

rem New Minecraft Launcher
cd C:\Users\%username%\AppData\Local\Packages\Microsoft.4297127D64EC6_8wekyb3d8bbwe\LocalCache\Local\game
del javacheck.jar

rem Curse Forge 
cd C:\Users\%username%\Documents\Curse\Minecraft\Install\game
del javacheck.jar

rem Old Minecraft Launcher
cd C:\Program Files (x86)\Minecraft Launcher\game
del javacheck.jar

echo.
echo If path cannot find the file, it usually means it has been deleted before.
echo Please ensure your paths are correct.

if not ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)