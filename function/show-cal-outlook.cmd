@echo off
echo Running this script WILL delete your Outlook calendars.
echo Are you sure you want to continue?
pause 
cd "%LOCALAPPDATA%\Microsoft\Outlook\"
del subscriptions.pst
pause