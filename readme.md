## Scripts

Collection of Batch/CMD, Bash, Powershell and AutoHotKey scripts, some written by me, some written by others and modified for my own usage. Kept in a repo for archive purposes.

> [!TIP]
> If any of the scripts don't work, run again with Administrator/Sudo privlleges.

## AutoHotKey Scripts

Can be used on any device as long as AutoHotKey is installed.

- Control Volume - Changes the current volume using `Shift`+`Numkeys` `+` and `-`
- Send To Trash - Empties the recycle bin using `Win`+`Del`
- Suspend - Suspends the current running AHK scripts using `Win`+`Scrolllock` - must have the snippet inserted into any scripts you want to suspend in order to work
- Search Clipboard - Uses copied text from the clipboard and searches it via DuckDuckGo - uses `Ctrl`+`Shift`+`C`
- Auto Correct - Auto corrects commonly mispelt words - use `Win`+`H` to add new words [(source)](http://www.biancolo.com)
- Keep on Top - Keeps the current window on top of the other windows - uses `Ctrl`+`Space`
- Norwegian Keybinds - Binds `Q/W/R` keys on a QWERTY keyboard to use Norwegian letters `Ø/Å/Æ` when pressed twice
- Twitch Theatre - Presses `FN`+`F11` via `\` to make Twitch fullscreen on a laptop
- Mahjong Soul Fullscreen - Presses `FN`+`F11` via `\` to make the Majsoul webpage fullscreen on a laptop
- YouTube Fullscreen - Presses `FN`+`F11` via `\` to make Youtube fullscreen on a laptop
- Layout Windows Manager - Edited version of [this script](https://github.com/KraXen72/ahk-scripts) (used before bug.n.) Pressing `Ctrl`+`Win`+`F1` will bring up a shortcut guide
- Numpad - Binds numpad keys on the keyboard. Toggable with `Prt Sc`
- Hide Window Titles - Hides the window titles. Toggable with `LWin`+`L/R Btn`

## Windows Terminal Scripts

### Archiving

Scripts that archive files and folders and other things.

- YTDL - Downloads a video via yt-dlp with lots of customisable options
- YTDL Basic - Paste a link and download videos via yt-dlp, no customising options, always downloads in the best quality
- Download MP3 - Converts a video link to an mp3 file
- Download Spotdl - Downloads a Spotify playlist and saves it to a defined folder

### Function Scripts

These are functional scripts used for PC maintenance and fixing errors.

- List Dir Contents - Lists Current Directory Contents  
- Sys Info - Lists Specs
- Get Battery  - Lists Battery Information if available
- Flush Wifi DNS - Flushes DNS/IP cache to fix Wifi errors
- Sync Time - Synchronize Time on Local Computer Using W32tm
- Restart Task - Restarts Windows File Manager
- Check Ports - Lists all the currently available ports on the PC
- Check Connection - Pings `duckduckgo.com` to test connection
- Sleep in 30 Minutes - Puts the PC in Sleep mode 30 minutes after the file is ran
- Printer Queue - Opens the Printer Queue
- Show Wifi Password - Runs `netsh wlan show profiles` and grabs the password for a previously connected connection
- Wifi Hotspot - Creates and manages hotspots from the device
- Flush Memory - Use as an Admin - Flushes and releases some memory from the PC [(source)](https://www.nexusmods.com/hogwartslegacy/mods/660?tab=files)

### Misc Scripts

Scripts that don't fit into the other categories and don't really have a day to day purpose. These are usually just little things I use to backup certain files, send API requests or connect devices.

> [!NOTE]
> Bluetooth scripts require [Bluetooth Command Line Tools.](https://bluetoothinstaller.com/bluetooth-command-line-tools)

- Hug Cynthia - Hug Cynthia using a `GET` request to `cynthia.rest`
- Bad Domain - Submit a `POST` Discord scam request to `bad-domains.walshy.dev/report` or check a domain via `bad-domains.walshy.dev/check`
- Spicetify Update - Updates and backs up Spicetify on the device
- Git Pull Subfolders - CDs into `%BATCH%` and `%SAP` environment variables and `git pull` into each folder
- Copy Chatterino Settings - Backup and sync settings for Chatterino using Google Drive
- Copy Streamlink Settings - Backup and sync settings for Streamlink using Google Drive
- Connect Buds - Connects to Redmi AirDots 3 Pro x Genshin Impact
- Connect Poco Buds - Connects to Poco Buds Pro x Genshin Impact
- Connect AirPods - Connects to AirPod Pros
- Connect Sony - Connects to Sony WH-1000XM4
- Copy - Copies all batch, AHK and PS1 files to `C:/Batch-New` to simply `cd` and run the script like a "bin" folder

## Powershell Scripts

- List News - Lists recent news headlines from an RSS feed
- Open Default Browser - Opens the default browser [(source)](https://github.com/fleschutz/PowerShell)
- Open Flightradar24 - Opens Flightradar24 in the default browser
- Open Lightning Map - Shows the live Lightning Map in the default browser
- Open Space Weather - Opens the Space Weather website in the default browser
- Open Speedtest - Opens the Cloudflare Speedtest website in the default browser
- Remove Print Jobs - Removes all print jobs from the queue
- Weather Report - Shows a list of the current weather from [wttr.in](https://wttr.in/) [(source)](https://github.com/fleschutz/PowerShell)
- DNS Resolution - Checks the DNS resolution with frequently used domain names
- Restart Network Adapters - Restarts all network adapters known on the PC [(source)](https://github.com/fleschutz/PowerShell)
- Remove Empty Directories - Removes all empty folders from a given location
- Update Spicetify Marketplace - Updates Spicetify's marketplace
- Delete Kindle Ads - Deletes ads on plugged in Kindle devices (Use in offline mode to keep the ads clear)
- Get Largest Files - Gets the largest files on your device and puts them all in a txt file
- Stop/Start SSH Tunnel - Starts/Stops a SSH tunnel for tilde.town using port 6667 for external IRC client usage
- Setup WSL and SSH - Sets up WSL and SSH for Windows

## Bash Shell Scripts

For Linux or MacOS. Dotfiles are stored in another repo.

- Finger SDF - Fetches user info and checks online status of all users
- Start SSH Tunnel - Bash version of the Powershell - Starts/Stops a SSH tunnel for tilde.town using port 6667 for IRC
- Kill Process - Lists and kills all `code-insiders-b` processes, then verifies if none remain
- Radio - Select and play a defined radio station via MPV
- Mute When Busy - Mutes the system when an event starts
- Stop/Start SSH Tunnel - Starts/Stops a SSH tunnel for tilde.town using port 6667 for external IRC client usage
- Up - Sends a specified file to [temp.sh](https://temp.sh) which are retained for 3 days
- Airport - Assigns a new MAC address to the current wifi connection, useful for limited minutes allocation of Airport wifi etc
- Script Setup - Makes a script executable and adds to path

### Adding to PATH

Or run `./script_setup` after making `./script_setup` executable.

#### Manual adding to PATH

```bash
chmod +x script_name
```

- Export scripts to `$PATH`.

```bash
export PATH="$HOME/scripts:$PATH"
```

- Reload shell.

```bash
source ~/.zshrc # Or whatever shell you use
```

Or

```bash
exec zsh
```
  
## Windows

> [!CAUTION]
> Do not run any of the following without checking the files first - if you break something it is only your fault. A lot of these change something about the system and can cause issues. Also check if the file has `win10` or `win11` at the start of each file name as the OS type does usually matter.

- Reset Windows Updates - Resets Windows Update Components
- Clear Windows Update Cache - Clears Windows Update Cache
- Advanced Explorer Settings -This changes more than a dozen File Explorer related settings on Windows 10 that turn of animations, enable menus, or turn off things like toasts
- Disable Automatic App Updates - Turns off automatic updates for Windows Store applications
- Disable Automatic Windows Updates - Turns off automatic updates for the Windows 10 operating system itself
- Disable Cortana - Rename the Cortana process `searchUIexe` to `searchUIbak` This will kill the process permanently and save your resources
- Re-enable Cortana - Turns Cortana on again
- Disable Forced Reboot after Update - Blocks Windows from enforcing a reboot after updates that require one
- Disable Lockscreen - Turns off the Windows 10 lockscreen
- Disable Telemetry - Turns off Windows 10 Telemetry
- Disable Unnecessary Services - This disables the MapsBroker, DoSvc and Wsearch services
- Enable Defender Malware Protection - Enables Windows malware Protection
- Enable Secure Microsoft Edge Settings - Tweaks Microsoft Edge for security Changes including turning off Flash and Cortana, enabling continuous browsing, and more
- Hide Cortana - Disables Cortana, and with it web searches and other search related parameters
- Hide OneDrive - Hides OneDrive and disables several related settings
- Uninstall Unnecessary Apps - Removes ten apps that Windows 10 ships with including 3D Builder, Skype App, Getting Started, or Voice Recorder
- Enable Administrator Account - This preference enables the hidden administrator account
- Enable Standby instead of Hibernate - Switch powerstate from hibernation (slow) to standby
- Get apps access for Administrator Account - Enable access to applications for the administrator account
- Clear Pinned Taskbar - Unpins everything from the taskbar
- Delete Search - Deletes all File Explorer search history. This also removes pinned items from the file explorer

### Run on Startup

- Press the `⊞ Win`+`R` keyboard shortcut to launch the `Run` dialogue.

- To open the `Startup` folder for the `Current User`, type:

```cmd
shell:startup
```

- To open the `Startup` folder for `All Users`, type:

```cmd
shell:common startup
```

- Click `OK` and paste your file or a shortcut to the file.
