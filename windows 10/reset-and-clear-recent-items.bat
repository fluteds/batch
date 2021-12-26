del /F /Q %APPDATA%\Microsoft\Windows\Recent\*

:: del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*

:: del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*

taskkill /f /im explorer.exe

start explorer.exe

