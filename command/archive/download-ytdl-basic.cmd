@echo off
                                                                             
:::                             88 88 88                               88             
:::               ,d            88 88 88                               ""             
:::               88            88 88 88                                              
::: 8b       d8 MM88MMM ,adPPYb,88 88 88,dPPYba,  ,adPPYYba, ,adPPYba, 88  ,adPPYba,  
::: `8b     d8'   88   a8"    `Y88 88 88P'    "8a ""     `Y8 I8[    "" 88 a8"     ""  
:::  `8b   d8'    88   8b       88 88 88       d8 ,adPPPPP88  `"Y8ba,  88 8b          
:::   `8b,d8'     88,  "8a,   ,d88 88 88b,   ,a8" 88,    ,88 aa    ]8I 88 "8a,   ,aa  
:::     Y88'      "Y888 `"8bbdP"Y8 88 8Y"Ybbd8"'  `"8bbdP"Y8 `"YbbdP"' 88  `"Ybbd8"'  
:::     d8'                                                                           
:::    d8'                                                                            

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

:: Set your download location here:
set directory=E:\Downloads/

echo.
color 0A
echo This is the basic yt-dlp Batchfile. Run ytdl.cmd for more customisation.
echo.
echo This downloads a YouTube video in the highest quality available.
echo.
echo Downloaded videos will be saved to: %directory%
echo.
SET /P URL="Video URL: "
echo.
yt-dlp -o %directory%%%(title)s.%%(ext)s -i --ignore-config --hls-prefer-native %URL%
echo.
echo Download Finished!
echo.
echo Your video(s) are now available at: %directory%
pause
exit