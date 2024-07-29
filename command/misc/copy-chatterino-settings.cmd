@echo off
title Chatterino Config Sync

rem If your paths are different from the default paths, change them below.
rem Make sure to put "" around the path if it contains spaces and finish the path with \ or Windows thinks it's a file name.

set drivePath="G:\My Drive\Chatterino\"
set driveThemePath="G:\My Drive\Chatterino\Themes\"
set chatterinoPath="C:\Users\%username%\AppData\Roaming\Chatterino2\Settings\"
set chatterinoThemesPath="C:\Users\%username%\AppData\Roaming\Chatterino2\Themes\"

:start
echo.
echo 1. Copy from Google Drive to Local Disk
echo 2. Copy from Local Disk to Google Drive (G:)
echo 3. Copy Themes from Google Drive to Local Disk
echo 4. Copy Themes from Local Disk to Google Drive
echo 5. List Chatterino Config and Google Drive paths
echo 6. Delete '.bkp-*' files. Advanced. Deletes all local backup files

set choice=
echo.
set /p choice=What would you like to do? (1, 2, 3, 4, 5, 6):

if '%choice%'=='1' goto fromDrive
if '%choice%'=='2' goto fromLocal
if '%choice%'=='3' goto fromDriveThemes
if '%choice%'=='4' goto fromLocalThemes
if '%choice%'=='5' goto listPaths
if '%choice%'=='6' goto delBackup

echo.
echo "%choice%" is not valid. Please try again.
echo.
goto start

:fromDrive
echo.
echo Copying Chatterino Config from Google Drive to local disk.
xcopy %drivePath% %chatterinoPath% /y /e
xcopy %driveThemePath% %chatterinoThemesPath% /y /e
goto end

:fromLocal
echo.
echo Copying Chatterino Config from local disk to Google Drive.
xcopy %chatterinoPath% %drivePath% /y /exclude:*.json.bkp-? /e
xcopy %chatterinoThemesPath% %driveThemePath% /y /e
goto end

:fromDriveThemes
echo.
echo Copying Chatterino Themes from Google Drive to local disk.
xcopy %driveThemePath% %chatterinoThemesPath% /y /e
goto end

:fromLocalThemes
echo.
echo Copying Chatterino Themes from local disk to Google Drive.
xcopy %chatterinoThemesPath% %driveThemePath% /y /e
goto end

:listPaths
echo.
echo Chatterino Path: %chatterinoPath%
echo Themes Path: %chatterinoThemesPath%
echo Google Drive Path: %drivePath%
echo Google Drive Themes Path: %driveThemePath%
echo.
timeout 5
goto start

:delBackup
echo.
echo Deleting .bkp-* (backup) AppData files.
echo.
echo This action cannot be undone.
echo To terminate, close the terminal window now.
timeout /t 30
cd %chatterinoPath%
echo Current directory: %cd%
echo Backup files to be deleted:
dir *.json.bkp-?
del *.json.bkp-?
goto end

:end
exit
