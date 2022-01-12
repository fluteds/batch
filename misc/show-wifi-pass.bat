@echo off

setlocal enabledelayedexpansion

echo Please run with administrator privileges to see the Wifi password.
echo.
echo Devices without being connected to Wifi networks will not work.

:main
 title Show Wifi Password

 :: Get all the profiles
 call :get-profiles r

 :: For each profile, try to get the password
 :main-next-profile
 for /f "tokens=1* delims=," %%a in ("%r%") do (
 call :get-profile-key "%%a" key
 if "!key!" NEQ "" (
 echo Wifi: [%%a] Password: [!key!]
 )
 set r=%%b
 )
 if "%r%" NEQ "" goto main-next-profile

 echo.
 pause

 goto :eof

:: Get the Wifi key of a chosen profile
:get-profile-key <1=profile-name> <2=out-profile-key>
 setlocal
 set result=
 FOR /F "usebackq tokens=2 delims=:" %%a in (
 `netsh wlan show profile name^="%~1" key^=clear ^| findstr /C:"Key Content"`) DO (
 set result=%%a
 set result=!result:~1!
 )
 (
 endlocal
 set %2=%result%
 )

 goto :eof

:: Get all network profiles (comma separated) into a result-variable
:get-profiles <1=result-variable>
 setlocal
 set result=
 FOR /F "usebackq tokens=2 delims=:" %%a in (
 `netsh wlan show profiles ^| findstr /C:"All User Profile"`) DO (
 set val=%%a
 set val=!val:~1!

 set result=%!val!,!result!
 )
 (
 endlocal
 set %1=%result:~0,-1%
 )

 goto :eof