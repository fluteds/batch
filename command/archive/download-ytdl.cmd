@echo off
color 0A 
                                   
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

echo.
echo This is the advanced yt-dlp Batchfile. 
echo.
echo Run ytdl-basic for a simple download experience.
echo.
SET /P URL="Video URL: "
echo.
goto formatList

:formatList
echo.
yt-dlp -F %URL%
echo.
goto selection


:selection
echo.
echo 1) Video + Audio
echo 2) Single format (Audio only / Video only)
echo.
SET /P option="Select option: "
if %option% == 1 (goto download)
if %option% == 2 (goto downloadSingle)
echo.
echo Unknown value
echo.
goto selection

:download
echo.
SET /P video="Select video format: "
SET /P audio="Select audio format: "
echo.
echo.
yt-dlp -o D:\Downloads/%%(title)s.%%(ext)s -f %video%+%audio% -i --ignore-config --hls-prefer-native %URL%
echo.
echo.
echo Done!
pause
EXIT

:downloadSingle
echo.
SET /P format="Select format: "
echo.
echo.
yt-dlp -o D:\Downloads/%%(title)s.%%(ext)s -f %format% -i --ignore-config --hls-prefer-native %URL%
echo.
echo.
echo Done!
pause
EXIT
