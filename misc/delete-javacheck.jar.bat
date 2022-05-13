@echo off
title Delete JavaCheck.jar files
rem Run if you keep getting Java Error 1 on launching an older Minecraft Version
echo.
echo Checking for both Windows Store versions and Curse
echo.
cd C:\Users\%username%\Documents\Curse\Minecraft\Install\game
del javacheck.jar
cd C:\Users\%username%\AppData\Local\Packages\Microsoft.4297127D64EC6_8wekyb3d8bbwe\LocalCache\Local\game
del javacheck.jar
echo.
echo If path cannot find the file, it usually means it has been deleted before.
echo Done.
pause