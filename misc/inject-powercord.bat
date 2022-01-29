@echo off

set "discordPath=%userprofile%\AppData\Local\DiscordCanary\app-1.0.43"

cd %userprofile%\powercord

echo.
echo You will have to restart the batch file to do more things after it closes.
echo This is because the NPM scripts force the cmd window to pause and not take more commands.
echo.
echo 1. Unplug powercord (Remove)
echo 2. Plug powercord (Install)
echo 3. Kill Discord
echo 4. Reload Discord
echo.

set /p input=What do you want to do? (1, 2, 3 or 4):

if %input% == 1 goto Unplug
if %input% == 2 goto Plug
if %input% == 3 goto Discord
if %input% == 4 goto Reload

:Unplug
npm run unplug

:Plug
npm run plug

:: I literally have no idea why this also restarts Discord, but it does.

:Discord
echo "Attempting to kill Discord..."
taskkill /f /im "DiscordCanary.exe"

:Reload
start %discordPath%\DiscordCanary.exe
exit