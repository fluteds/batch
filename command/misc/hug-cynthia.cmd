@echo off
title "Hug Cynthia! <3"
echo.
       
::             *     ,MMM8&&&.            *
::                  MMMM88&&&&&    .
::                 MMMM88&&&&&&&
::     *           MMM88&&&&&&&&
::                 MMM88&&&&&&&&
::                 'MMM88&&&&&&'
::                   'MMM8&&&'      *
::          |\___/|
::          )     (             .              '
::         =\     /=
::           )===(       *
::          /     \
::          |     |
::         /       \
::         \       /
::  _/\_/\_/\__  _/_/\_/\_/\_/\_/\_/\_/\_/\_/\_
::  |  |  |  |( (  |  |  |  |  |  |  |  |  |  |
::  |  |  |  | ) ) |  |  |  |  |  |  |  |  |  |
::  |  |  |  |(_(  |  |  |  |  |  |  |  |  |  |
::  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
::  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |

for /f "delims=: tokens=*" %%A in ('findstr /b :: "%~f0"') do @echo(%%A
echo.
curl -X POST https://cynthia.rest/action/hug
echo.
echo Come back in an hour for another hug.

pause