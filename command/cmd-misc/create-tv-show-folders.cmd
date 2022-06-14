@echo off

:top
color 0a
echo TV Show Folder Creator
goto :start

:clearscreen
cls
goto :start

:start
echo Press Corresponding Number and Press Enter
echo.
echo 1. Quick mode (7 Seasons, and Specials)
echo 2. Manual mode
echo 3. .bat info
echo 4. Exit
set /P q=
if /I "%q%" EQU "1" goto :quickmode
if /I "%q%" EQU "2" goto :manualmode
if /I "%q%" EQU "3" goto :info
if /I "%q%" EQU "4" exit

:quickmode
cls
cd %homepath%
cd desktop
chdir
echo What is the show's title?
set /P t=
md "%t%"
cd "%t%"
chdir
md "Specials" "Season 7" "Season 6" "Season 5" "Season 4" "Season 3" "Season 2" "Season 1"
cls
echo Quickmode Complete
echo.
goto :start

:manualmode
cls
cd %homepath%
cd desktop
chdir
echo What is the show's title?
set /P c=
md "%c%"
echo Folder is There
echo.
cd "%c%"
chdir
goto :displayoptions

:displayoptions
cls
echo Press Corresponding Number and Press Enter
echo 1. Create Regular Season Folders
echo 2. Create Specials Folder
echo 3. Create Season 0 Folder
echo 4. Create Individual season
echo 5. Create Another Series
echo 6. Exit
goto :options

:options
set /P e=
if /I "%e%" EQU "1" goto :RegularSeasonNumbers
if /I "%e%" EQU "2" goto :specials
if /I "%e%" EQU "3" goto :pilot
if /I "%e%" EQU "4" goto :individual
if /I "%e%" EQU "5" goto :start
if /I "%e%" EQU "6" exit
if /I "%e%" EQU "y" goto :displayoptions

:specials
md "Specials"
goto :success

:pilot
md "Season 0"
goto :success


:individual
echo What Season?
set /P i=
md "Season %i%"
pause
goto :success

:success
echo Task Complete
echo.
goto :didyouforget

:zero
echo No Folder created
echo.
goto :didyouforget

:didyouforget
echo Press [y], then enter to display the Options again
echo.
goto :options

:RegularSeasonNumbers
echo How many seasons are there?
set /P d=
FOR /L %%A IN (1,1,%d%) DO md "Season %%A"
pause
goto :success


:info
cls
echo                      Info: Creates Empty Folders on your Desktop
echo                      Created for the purpose of never having to 
echo                      manually create Season folders after
echo                      downloading an entire TV Series.
echo                      This will work for infinite season folder
echo                      creation per TV show (Which I doubt you will
echo                      ever need) including "Season 0" and "Specials"
echo                      Quickmode will create 7 Seasons and a Specials
echo                      folder, because that is a typical run for a show
echo                      Feel Free to edit this, and make personal changes.
echo                      I Created this to save myself time,
echo                      This is actually Version 5; and took a lot longer to put together.
echo.
echo                      Release Notes:
echo                    * Version 1 Private, and was basic quickmode.
echo                    * Version 2 Private, and included manual Creation
echo                      up to Season 30.
echo                    * Version 3 Private, manual creation up to 100, and
echo                      easier on the eyes.
echo                    * Version 4 Public, added individual season creation.
echo                    * Version 5 Public, reduced 100 lines to 1, thanks Reddit!
echo                      also, it supports infinate creation of season folders
echo
echo.
echo                      Enjoy, and share with others
echo                      Compiled 12/18/2012 by deathbybandaid
pause
goto :clearscreen
