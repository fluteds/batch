:: @echo off
:: Change echo if errors

title Copy Files

for /R c:\batch %%f in (*.bat, *cmd, *ahk, *ps1, *csv ) do copy %%f c:\batch-new

if not ["%errorlevel%"]==["0"] (
    timeout /t 15
    exit /b %errorlevel%
)