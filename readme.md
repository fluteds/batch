## Batch Scripts

These are my collection of batch files and AutoHotKey scripts, some written by me, some written by others and modified. If any of the scripts don't work, run the script with Administrator rights. You must have AutoHotKey installed to run the AHK scripts.

````cmd
       -      _______                               '  *      '
      {}``; |==|_______D                                * * -+-  
      / ('        /|\                                 *     '  *
  (  /  |        / | \                                *   '    
akg\(_)_]]      /  |  \                            *   *     
                                                     '   *
````

PC Info

- Sys Info - Lists Specs
- Get Battery  - Lists Battery Information if available

Clean Cache/Space

- Outlook - Opens Outlooks `localdata` then deletes the Internet Calendars
- Delete Search - Deletes All File Explorer Search History

Function

- List - Lists Current Directory Contents  
- Make - Creates a Directory and Moves Into It  
- Remove - Remove Files or Directories  
- New - Create New Files  
- Flush Wifi - Lists All Wifi Devices and Flushes Them to Fix Wifi Errors
- Cmd -  Opens a Command Prompt if You Don't Have Access to the Run Window
- Sync Time - Synchronize Time on Local Computer Using W32tm
- Volume - AHK script that changes the current volume using `Shift` `+` Numkeys `+` and `-`
- Trash - AHK script that empties the recycle bin using `Win` `+` `Del`
- Suspend - AHK snippet that suspends running AHK scripts using `Win` `+` `Scrolllock` - must have the snippet inserted into any scripts you want to suspend in order to work
- Auto Correct - AHK that auto corrects words - use `Win` `+` `H` to add new words
- Restart Task - Restarts Windows File Manager
- Search Clipboard - Uses copied text from the clipboard and searches it - uses `Ctrl`, `Shift` `+` `C`
- Check Port - Lists all the currently available ports on the PC
- Check Connection - Pings `google.com` to test connection

Misc

- Ytdl - Downloads a YouTube video via YouTube-dl and has a tonne of customizable options
- Ytdl-basic - Paste a link and download of YouTube videos via YouTube-dl
- Download mp3 - Converts a YouTube video to mp3
- Keep on Top - Keeps the current window on top of the other windows - uses `Ctrl` `+` `Space`
- Hug Cynthia - Hug Cynthia using a `GET` request to `cynthia.rest`
- Bad Domain - Submit a `POST` Discord scam domain request to `bad-domains.walshy.dev/report`
- Printer Queue - Opens the Printer Queue
- Show Wifi Password - Runs `netsh wlan show profiles` and grabs the password for a previously connected connection

Terminal Art

- Earth Animation - A spinning animation of the earth
- Light Effect - Flashes from green to black ⚠️ Flashing Strobe
- Matrix - Creates a matrix of characters
- No Signal Color Bars - Creates a no TV signal color bar
  
Windows 10

⚠️ Do not run any of the following Windows without checking the code first - if you break something it is not my fault. A lot of these change something about the system and can cause issues.

- Reset Windows Updates - Resets Windows Update Components
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

Run Batch Files on Startup

- Press the `⊞ Win` `+` `R` keyboard shortcut to launch the `Run` dialogue.

- To open the `Startup` folder for the `Current User`, type:

```cmd
shell:startup
```

- To open the `Startup` folder for the `All Users`, type:

```cmd
shell:common startup
```

- Click `OK` and paste your batch file or the shortcut to the `.bat` file that needs to be run on Windows startup.
