:: Updates, unplugs and plugs powercord because I'm too lazy to do it manually

@echo off

set "pcPath=C:\Users\%username%\powercord\"
set "discordPath=C:\Users\%username%\AppData\Local\DiscordCanary\app-0.0.264\DiscordCanary.exe"

echo "Changing directory to powercord..."
cd powercord
echo.

echo "Checking for updates upstream..."
git pull 
echo.

echo "Unplugging powercord..."
npm run unplug
echo.

echo "Killing Discord to finish updating..."
taskkill /f /im "DiscordCanary.exe"
echo "Waiting for Discord to close..."
echo "Discord Closed." 
echo.

echo "Plugging powercord..."
npm run plug
echo "Powercord plugged."
echo.

echo "Restarting Discord..."
start %discordPath%
echo "Discord started."
echo.
echo.
echo Update Done!
pause