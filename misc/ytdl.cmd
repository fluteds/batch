@ECHO OFF
color 0A
echo 
                                   
:::                             88 88  
:::               ,d            88 88  
:::               88            88 88  
::: 8b       d8 MM88MMM ,adPPYb,88 88  
::: `8b     d8'   88   a8"    `Y88 88  
:::  `8b   d8'    88   8b       88 88  
:::   `8b,d8'     88,  "8a,   ,d88 88  
:::     Y88'      "Y888 `"8bbdP"Y8 88  
:::     d8'                            
:::    d8'                             

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

ECHO.
ECHO This is the advanced YouTube-dl Batchfile. 
ECHO Run ytdl-basic.cmd for a simple download experience.
ECHO.
SET /P URL="[Enter video URL] "
ECHO.
goto formatList

:formatList
ECHO.
YouTube-dl -F %URL%
ECHO.
ECHO ======================================================================================================================
goto selection


:selection
ECHO.
ECHO 1) Video + Audio
ECHO 2) Single format (Audio only / Video only)
ECHO.
SET /P option="Select option: "
if %option% == 1 (goto download)
if %option% == 2 (goto downloadSingle)
ECHO.
ECHO Unknown value
ECHO.
ECHO ======================================================================================================================
goto selection

:download
ECHO.
SET /P video="Select video format: "
SET /P audio="Select audio format: "
ECHO.
ECHO ======================================================================================================================
ECHO.
YouTube-dl -o D:\Downloads/%%(title)s.%%(ext)s -f %video%+%audio% -i --ignore-config --hls-prefer-native %URL%
ECHO.
ECHO ======================================================================================================================
ECHO.
ECHO Done!
PAUSE
EXIT

:downloadSingle
ECHO.
SET /P format="Select format: "
ECHO.
ECHO ======================================================================================================================
ECHO.
YouTube-dl -o D:\Downloads/%%(title)s.%%(ext)s -f %format% -i --ignore-config --hls-prefer-native %URL%
ECHO.
ECHO ======================================================================================================================
ECHO.
ECHO Done!
PAUSE
EXIT
