@echo off
title SpotDL Playlist Downloader
setlocal

:: Enable color support
color 0A

:: Function to print a colored message
:: Usage: call :print_color "text" color_code
:print_color
echo.
echo [%~2m%~1[0m
echo.
exit /b

:: Check if spotdl is installed
where spotdl >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    call :print_color "Error: SpotDL is not installed! Install it using: pip install spotdl" 91
    pause
    exit /b 1
)

:: Display banner
cls
echo ======================================================
call :print_color "         SPOTIFY PLAYLIST DOWNLOADER 🎵" 96
echo ======================================================
echo.

:: Prompt user for playlist URL
call :print_color "Enter Spotify Playlist URL:" 93
set /p PLAYLIST_URL=>> 

:: Check if input is empty
if "%PLAYLIST_URL%"=="" (
    call :print_color "Error: No playlist URL provided!" 91
    pause
    exit /b 1
)

:: Prompt user for output folder
call :print_color "Enter Output Folder Path (e.g., C:\Music):" 93
set /p OUTPUT_FOLDER=>> 

:: Check if input is empty
if "%OUTPUT_FOLDER%"=="" (
    call :print_color "Error: No output folder provided!" 91
    pause
    exit /b 1
)

:: Create output folder if it doesn't exist
if not exist "%OUTPUT_FOLDER%" mkdir "%OUTPUT_FOLDER%"

:: Start downloading
call :print_color "Downloading playlist... Please wait! 🎶" 92
spotdl "%PLAYLIST_URL%" --output "%OUTPUT_FOLDER%\{artist} - {title}.mp3"

:: Completion message
call :print_color "Download completed successfully! ✅" 92
pause
exit /b 0
