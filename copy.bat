:: @echo off

title Copy Files

for /R C:\batch %%f in (*.bat, *cmd, *ahk, *ps1, *csv, *sh ) do copy %%f C:\batch-new

if not ["%errorlevel%"]==["0"] (
    timeout /t 15
    exit /b %errorlevel%
)