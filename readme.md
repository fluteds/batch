## Batch Scripts

These are my collection of batch files, Powershell and AutoHotKey scripts, some written by me, some written by others and modified. If any of the scripts don't work, run the script again with Administrator rights. You must have AutoHotKey installed to run the AHK scripts. These are in no particular order in relation to the directory tree, mainly because I keep forgetting to update the readme whenever I move a script or add a new one.

## AutoHotKey Scripts (AHK)

- Volume - AHK script that changes the current volume using `Shift` `+` Numkeys `+` and `-`
- Trash - AHK script that empties the recycle bin using `Win` `+` `Del`
- Suspend - AHK snippet that suspends running AHK scripts using `Win` `+` `Scrolllock` - must have the snippet inserted into any scripts you want to suspend in order to work
- Auto Correct - AHK that auto corrects words - use `Win` `+` `H` to add new words
- Keep on Top - AHK script that keeps the current window on top of the other windows - uses `Ctrl` `+` `Space`

## Terminal Scripts (Batch/Bat/Cmd)

### Archiving

Scripts that archive files and folders and other things.

- Ytdl - Downloads a YouTube video via yt-dlp and has a tonne of customisable options
- Ytdl Basic - Paste a link and download YouTube videos via yt-dlp, no customising options, always downloads in the best quality
- Download MP3 - Converts a YouTube video to mp3

### Function Cmd Scripts

These are functional scripts, like quality of life, used for PC maintenance and fixing errors.

- List - Lists Current Directory Contents  
- Make - Creates a Directory and moves into it  
- Remove - Remove Files or Directories  
- New - Create New Files  
- Sys Info - Lists Specs
- Get Battery  - Lists Battery Information if available
- Flush Wifi - Lists all Wifi Devices and flushes them to fix Wifi errors
- Cmd -  Opens a Command Prompt if you don't have access to the Run Window
- Sync Time - Synchronize Time on Local Computer Using W32tm
- Restart Task - Restarts Windows File Manager
- Search Clipboard - Uses copied text from the clipboard and searches it - uses `Ctrl`, `Shift` `+` `C`
- Check Port - Lists all the currently available ports on the PC
- Check Connection - Pings `google.com` to test connection
- Sleep in 30 Minutes - Puts the PC in Sleep mode 30 minutes after the batch file is ran
- Delete Search - Deletes all File Explorer search history
- Printer Queue - Opens the Printer Queue
- Show Wifi Password - Runs `netsh wlan show profiles` and grabs the password for a previously connected connection
- Wifi Hotspot - Creates and manages Wifi Hotspots from the device

### Misc Cmd Scripts

Scripts that don't fit into the other categories and don't really have a day to day purpose.

- Hug Cynthia - Hug Cynthia using a `GET` request to `cynthia.rest`
- Bad Domain - Submit a `POST` Discord scam request to `bad-domains.walshy.dev/report` or `https://bad-domains.walshy.dev/check`
- Inject Powercord - Updates, unplugs and plugs powercord
- Twitch Theatre - Presses `FN`+`F11` via `\` to make Twitch fullscreen on Laptop, cuts out having to press two keys to make it fullscreen
- Spicetify Update - Updates and backs up Spicetify on the device

## Powershell Scripts (PS1)

- List News - Lists recent news from an RSS feed
- List Weather - Lists the current weather from [wttr.in](https://wttr.in/)
- Open Default Browser - Opens the default browser
- Open Flightradar24 - Opens Flightradar24 in the default browser
- Open Lightning Map - Shows the live Lightning Map in the default browser
- Open Space Weather - Opens the Space Weather website in the default browser
- Open Speedtest - Opens the Cloudflare Speedtest website in the default browser
- Remove Print Jobs - Removes all print jobs from the queue
- Weather Report - Shows a list of the current weather from [wttr.in](https://wttr.in/)
  
## Windows 10

⚠️ Do not run any of the following Windows without checking the code first - if you break something it is not my fault. A lot of these change something about the system and can cause issues.

- Reset Windows Updates - Resets Windows Update Components
- Clear Windows Update Cache - Clears Windows Update Cache
- Advanced Explorer Settings -This changes more than a dozen File Explorer related settings on Windows 10 that turn of animations, enable menus, or turn off things like Toasts
- Disable Automatic App Updates - Turns off automatic updates for Windows Store applications
- Disable Automatic Windows Updates - Turns off automatic updates for the Windows 10 operating system itself
- Disable Cortana Completely - Rename the Cortana process `searchUIexe` to `searchUIbak` This will kill the process permanently and save your resources
- Disable Forced Reboot after Update - Blocks Windows from enforcing a reboot after updates that require one
- Disable Lockscreen - Turns off the Windows 10 lockscreen
- Disable Telemetry - Turns off Windows 10 Telemetry
- Disable Unnecessary Services - This disables the MapsBroker, DoSvc and Wsearch services
- Enable Defender Malware Protection - Enables Windows malware Protection
- Enable Secure Microsoft Edge Settings - Tweaks Microsoft Edge for security Changes include turning of Flash and Cortana, enabling continuous browsing, and more
- Hide Cortana - Disables Cortana, and with it web searches and other search related parameters The Microsoft way of disabling Cortana
- Hide OneDrive - Hides OneDrive and disables several related settings
- Re-enable Cortana Completely - This preferences turns Cortana on again
- Uninstall Unnecessary Apps - Removes ten apps that Windows 10 ships with including 3D Builder, Skype App, Getting Started, or Voice Recorder
- Enable Administrator Account - This preference enables the hidden administrator account in Windows
- Enable Standby instead of Hibernate - Switch powerstate from hibernation (slow) to standby
- Get apps access for Administrator Account - Enable access to applications for the administrator account

## Windows 11

⚠️ Do not run any of the following Windows without checking the code first - if you break something it is not my fault. A lot of these change something about the system and can cause issues.

- Clear Pinned Taskbar - Unpins everything from the taskbar all at once

## Run Batch Files on Startup

- Press the `⊞ Win` `+` `R` keyboard shortcut to launch the `Run` dialogue.

- To open the `Startup` folder for the `Current User`, type:

```cmd
shell:startup
```

- To open the `Startup` folder for `All Users`, type:

```cmd
shell:common startup
```

- Click `OK` and paste your batch file or the shortcut to the `.bat` file that needs to be run on Windows startup.
