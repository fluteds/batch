@echo off

echo                                                                              
:::                            88 88 88                               88             
:::              ,d            88 88 88                               ""             
:::              88            88 88 88                                              
::: 8b       d8 MM88MMM ,adPPYb,88 88 88,dPPYba,  ,adPPYYba, ,adPPYba, 88  ,adPPYba,  
::: `8b     d8'   88   a8"    `Y88 88 88P'    "8a ""     `Y8 I8[    "" 88 a8"     ""  
:::  `8b   d8'    88   8b       88 88 88       d8 ,adPPPPP88  `"Y8ba,  88 8b          
:::   `8b,d8'     88,  "8a,   ,d88 88 88b,   ,a8" 88,    ,88 aa    ]8I 88 "8a,   ,aa  
:::     Y88'      "Y888 `"8bbdP"Y8 88 8Y"Ybbd8"'  `"8bbdP"Y8 `"YbbdP"' 88  `"Ybbd8"'  
:::     d8'                                                                           
:::    d8'                                                                            

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

echo.
color 0A
echo This is the basic YouTube-dl Batchfile. 
echo Run ytdl.cmd for more customisation.
echo.
SET /P URL="[Enter video URL] "
echo.
YouTube-dl -o D:\Downloads/%%(title)s.%%(ext)s -i --ignore-config --hls-prefer-native %URL%
echo.
echo ======================================================================================================================
echo.
echo Done!
pause
EXIT