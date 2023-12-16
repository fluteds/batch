@echo off

color 0A
echo 
                                   
:::                                            
:::                                 ad888888b,  
:::                                d8"     "88  
:::                                        a8P  
::: 88,dPYba,,adPYba,  8b,dPPYba,       aad8"   
::: 88P'   "88"    "8a 88P'    "8a      ""Y8,   
::: 88      88      88 88       d8         "8b  
::: 88      88      88 88b,   ,a8" Y8,     a88  
::: 88      88      88 88`YbbdP"'   "Y888888P'  
:::                    88                       
:::                    88                                           

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

Title YT to MP3 Downloader

:start

echo.
echo Welcome to the YT to MP3 Downloader.
echo Please select an option and press enter to begin.

:select
echo.
echo. 
echo 1. Download video and convert to mp3.
echo 2. Download video only.
echo 3. Close.

echo.

set /p input=What do you want to do? (1, 2, 3 or 4): 

IF %input% EQU 1 goto option_1

IF %input% EQU 2 goto option_2

IF %input% EQU 3 exit

goto start

:option_1
set /p link=Link: 
yt-dlp -i -x --audio-format mp3 --audio-quality 0 "%link%" -o "audio/%%(title)s.%%(ext)s"
echo.
echo Paste or enter a link: 
goto option_1

:option_2
set /p link=Link: 
yt-dlp -i --recode-video mp4 "%link%" -o "video/%%(title)s.%%(ext)s"
echo.
echo Paste or enter a link: 
goto option_2

:: set /p input=Do you want to go back to the start? (1 or 2):

IF %input% EQU 1 goto beginning
IF %input% EQU 2 exit

pause > nul