@echo off
title Streamlink Batch Script 
:start
cls
Set /a num=(%Random% %%9)+1

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

goto choose
:choose
echo.
call :color 6 "Enter Twitch channel name:"
echo.

set /p Stream=
echo.
goto quality

:quality
echo.
call :color 9 "~~~~~~~~~~~~~~~~~~~~~~~~~~" \n
call :color C *
call :color A "Pick your stream quality"
call :color C * \n
call :color C "**************************" \n
echo.
call :color 0 ">"
call :color C "1"
call :color 0 "."
call :color 8 " Source" \n
call :color 0 ">"
call :color C "2"
call :color 0 "."
call :color 8 " 720p60" \n
call :color 0 ">"
call :color C "3"
call :color 0 "."
call :color 8 " 720p" \n
call :color 0 ">"
call :color C "4"
call :color 0 "."
call :color 8 " 480p" \n
call :color 0 ">"
call :color C "5"
call :color 0 "."
call :color 8 " 360p" \n
call :color 0 ">"
call :color C "6"
call :color 0 "."
call :color 8 " 160p" \n
call :color 0 ">"
call :color C "7"
call :color 0 "."
call :color 8 " audio_only" \n
echo.

choice /c 1234567 /m "> Enter stream quality:"
if errorlevel 7 goto audio
if errorlevel 6 goto 160p
if errorlevel 5 goto 360p
if errorlevel 4 goto 480p
if errorlevel 3 goto 720p
if errorlevel 2 goto 720p60
if errorlevel 1 goto source

:source
echo.
call :color 9 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" \n
call :color C "*********************************" \n
echo.
streamlink https://www.twitch.tv/%stream% best
goto start

:720p60
echo.
call :color 9 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" \n
call :color C "*********************************" \n
echo.
streamlink https://www.twitch.tv/%stream% 720p60
goto start

:720p
echo.
call :color 9 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" \n
call :color C "*********************************" \n
echo.
streamlink https://www.twitch.tv/%stream% 720p
goto start

:480p
echo.
call :color 9 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" \n
call :color C "*********************************" \n
echo.
streamlink https://www.twitch.tv/%stream% 480p
goto start

:360p
echo.
call :color 9 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" \n
call :color C "*********************************" \n
echo.
streamlink https://www.twitch.tv/%stream% 360p
goto start

:160p
echo.
call :color 9 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" \n
call :color C "*********************************" \n
echo.
streamlink https://www.twitch.tv/%stream% 160p
goto start

:audio
echo.
call :color 9 "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" \n
call :color C "*********************************" \n
echo.
streamlink https://www.twitch.tv/%stream% audio_only
goto start

:color
setLocal enableextensions enabledelayedexpansion
set "text=%~2"
if not defined text (set text=^")
subst `: "!temp!" >nul &`: &cd \
if not exist `.7 (
echo(|(pause >nul &findstr "^" >`)
set /p "=." >>` <nul
for /f "delims=;" %%# in (
'"prompt $h;&for %%_ in (_) do rem"') do (
set /p "=%%#%%#%%#" <nul >`.3
set /p "=%%#%%#%%#%%#%%#" <nul >`.5
set /p "=%%#%%#%%#%%#%%#%%#%%#" <nul >`.7))
set /p "lf=" <` &set "lf=!lf:~0,1!"
for %%# in ("!lf!") do for %%_ in (
\ / :) do set "text=!text:%%_=%%~#%%_%%~#!"
for /f delims^=^ eol^= %%# in ("!text!") do (
if #==#! setlocal disabledelayedexpansion
if \==%%# (findstr /A:%~1 . \` nul
type `.3) else if /==%%# (findstr /A:%~1 . /.\` nul
type `.5) else (echo %%#\..\`>`.dat
findstr /f:`.dat /a:%~1 .
type `.7))
if "\n"=="%~3" (echo()
goto :eof