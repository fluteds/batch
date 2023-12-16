@echo off

title Spicetify Update

echo This will update Spicetify to the latest version, restore and backup.
echo.
echo Current Spicetify version:
echo y| call spicetify restore backup apply
echo y| call spicetify upgrade

if not ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)
