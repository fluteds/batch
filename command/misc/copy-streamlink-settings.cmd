@echo off

title Streamlink Config Sync

rem If your paths are different from the default paths, change them below. Make sure to put "" around the path if it contains spaces and finish the path with \ or Windows thinks it's a file name.

set drivePath="G:\My Drive\Streamlink\"
set streamlinkConfig="C:\Users\%username%\AppData\Roaming\streamlink\"

echo.
echo 1. Copy from Google Drive to Local Disk
echo 2. Copy from Local Disk to Google Drive (G:\)
echo 3. List Streamlink Config and Google Drive paths

set choice=
echo.
set /p choice=What would you like to do? (1,2): 

if '%choice%'=='1' goto fromDrive
if '%choice%'=='2' goto fromLocal
if '%choice%'=='3' goto listPaths

echo.
echo "%choice%" is not valid, try again.
echo.
goto end

:fromDrive
echo.
echo Copying Streamlink Config from Google Drive to local disk.
xcopy %drivePath%*.* %streamlinkConfig% /y
goto end

:fromLocal
echo.
echo Copying Streamlink Config from local disk to Google Drive.
xcopy %streamlinkConfig*.* %drivePath% /y
goto end

:listPaths
echo.
echo Streamlink Path: %streamlinkConfig%
echo Google Drive Path: %drivePath%
echo.
goto end

:end
if not ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)