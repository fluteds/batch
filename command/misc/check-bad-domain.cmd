@echo off

title Report/Check a URL

:select
echo.
echo.
echo 1. Report a URL
echo 2. Check a URL against the Database
echo 3. Exit
echo.

set /p input=What do you want to do? (1, 2, 3):

if %input% == 1 goto report
if %input% == 2 goto check
if %input% == 3 goto exit

:report
echo.
set /P url=Enter URL to Report: 
curl -X POST https://bad-domains.walshy.dev/report -H "Accept: application/json" -H "Content-Type: application/json" -d "{\"domain\": \"%url%\"}"
goto :report-more
pause

:check
echo.
set /P url=Enter URL to Check: 
curl -X POST https://bad-domains.walshy.dev/check -H "Accept: application/json" -H "Content-Type: application/json" -d "{\"domain\": \"%url%\"}"
goto :check-again
pause

:report-more 
echo.
set /P retry=Do you want to report another URL? (y/n):
if %retry% == y goto report-more
if %retry% == n goto exit

:check-again
echo.
set /P retry=Do you want to check another URL? (y/n):
if %retry% == y goto check
if %retry% == n goto exit

:exit
exit