@echo off

:: Might need some more work on which folder it goes into and list

echo [32mPulling Github Repos...[0m
for /f %%f in ('dir /ad /b %REPOS%') do cd /d %REPOS% %%f & call git pull & cd ..
echo [32mPulling SAP Repos...[0m
for /f %%f in ('dir /ad /b %SAP%') do cd /d %SAP% %%f & call git pull & cd ..

if not ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)