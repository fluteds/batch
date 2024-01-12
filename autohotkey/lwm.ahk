#Warn
#SingleInstance, force
SendMode, event
CoordMode, Mouse, Screen
;#NoTrayIcon
#WinActivateForce

; NOTES
; How to calculate the secondary monitor width, height and offet
; ONLY if the monitor is not directly next to, or above, the primary screen

; Q | Why not just use the same values?
; A | Using the same values as the primary will make your windows disappear off the screen

; E.G This is my screen setup

;				-------------------
;				|                 |
;				|   2nd monitor   | < Where everything on this script is displayed
;				|                 |
;				-------------------
;         -------------------
;         |                 |
;         |     Primary     |
;         |                 |
;         -------------------

; 1. NIVIDA Control Panel > Monitors
; 2. Slightly move the 2nd monitor screen until you see a box in the bottom right with two values. These are the values you want to use in the monitor_width and monitor_height

; TODO

; MAIN PC
;monitor_width := 650
;monitor_height := -1251
;top_offset := -1080

; LAPTOP
;monitor_width := 1920 ; 2560 if you have a 1440p main monitor, 1920 if you have a 1080p monitor
;monitor_height := -1440 ; 1440p if you have a 1440p monitor
;top_offset := 0 ; if the monitor is above the primary, use minus, else use 0

htk := 0 ; prevent running multiple hotkeys at once - 1 hotkey is running - 0 you can run hotkey
monitor_width := 650
monitor_height := -1251
top_offset := -1080
teams_main_side := "right" ; left or right
teams_gaps := 5 ; margin around main teams windows

; == in an if is case sensitive
; = in an if is case insensitive
; := is assignment operator

F13::
^#Numpad0:: ; minimize all
	if (htk == 0) {
		htk := 1
		WinMinimize, ahk_exe Discord.exe
		WinMinimize, ahk_exe MusicBee.exe
		WinGet, teamswins, List, ahk_exe Teams.exe
		Loop, % teamswins {
			PostMessage, 0x0112, 0xF020,,, % "ahk_id " teamswins%A_Index%
			Sleep, 50
		}
		htk := 0
	}
return

F14::
^#Numpad1:: ; discord fullscreen
	if (htk == 0) {
		htk := 1
		WinMinimize, ahk_exe MusicBee.exe
		WinGet, teamswins, List, ahk_exe Teams.exe
		Loop, % teamswins {
			PostMessage, 0x0112, 0xF020,,, % "ahk_id " teamswins%A_Index%
			Sleep, 50
		}
		SysGet, MonNum, MonitorCount
		if (MonNum = 1) {
			WinMove, ahk_exe Discord.exe,, 0, % top_offset
		} else {
			EnsureWindowIsOnSecondaryMonitor(monitor_width, "Discord.exe")
			WinMove, ahk_exe Discord.exe,,% monitor_width, % top_offset
		}
		WinMaximize, ahk_exe Discord.exe
		WinActivate, ahk_exe Discord.exe
		htk := 0
	}
return

MoveDiscordMusicBee() { ; declare function to move discord+musicbee before it is called
	global monitor_width
	global top_offset
	SysGet, _MonNum, MonitorCount

	if (_MonNum = 1) {
		WinMove, ahk_exe Discord.exe,, 0, % top_offset, 1318, 1040
		WinMove, ahk_exe MusicBee.exe,, 1318, % top_offset, A_ScreenWidth - 1318, 1040
	} else {
		EnsureWindowIsOnSecondaryMonitor(monitor_width, "Discord.exe,MusicBee.exe")
		WinMove, ahk_exe Discord.exe,, % monitor_width, % top_offset, 1400, 1040
		WinMove, ahk_exe MusicBee.exe,, % monitor_width + 1400, % top_offset, A_ScreenWidth - (monitor_width + 1400), 1040 ; move and resize musicbee to fit the gap left by discord
	}
}

F15::
^#Numpad2:: ; discord + musicbee
	if (htk == 0) {
		htk := 1
		WinGet, teamswins, List, ahk_exe Teams.exe
		Loop, % teamswins {
			PostMessage, 0x0112, 0xF020,,, % "ahk_id " teamswins%A_Index%
			Sleep, 50
		}
		WinRestore, ahk_exe Discord.exe
		
		MoveDiscordMusicBee()
		if !WinExist("ahk_exe MusicBee.exe") {
			RunMusicBee()
		}
		if !WinExist("ahk_exe Discord.exe") {
			RunDiscord()
		}
		WinRestore, ahk_exe Discord.exe
		WinRestore, ahk_exe MusicBee.exe
		MoveDiscordMusicBee()
		WinActivate, ahk_exe MusicBee.exe
		WinActivate, ahk_exe Discord.exe
		htk := 0
	}
return

F16::
^#Numpad3:: ; fullscreen teams
	if (htk == 0) {
	htk := 1
		WinMinimize, ahk_exe Discord.exe
		WinMinimize, ahk_exe MusicBee.exe
		SetTitleMatchMode, 2
		WinGet, teamswins, List, Microsoft Teams
		; sanity check restore all windows
		Loop, % teamswins {
			WinGet, Minmaxed, MinMax, % "ahk_id " teamswins%A_Index%
			if (Minmaxed == -1)
				WinRestore, % "ahk_id " teamswins%A_Index%
			WinGet, Minmaxed, MinMax, % "ahk_id " teamswins%A_Index%
			if (Minmaxed == 1)
				WinRestore, % "ahk_id " teamswins%A_Index%

		}
		if (teamswins == 1) { ; only one main window open
			hasmax := 0
			Loop, % teamswins { ; loops to see if the window is maximised
				WinGet, Minmaxed, MinMax, % "ahk_id " teamswins%A_Index%
				if (Minmaxed == 1)
					hasmax := 1
			}
			if (hasmax == 0) { ; if it's not maximised, maximise it.
				WinRestore, % "ahk_id " teamswins1
				WinMove, % "ahk_id " teamswins1,, % monitor_width, % top_offset, 1920, 1040
				WinMaximize, % "ahk_id " teamswins1
			}
		} else if (teamswins > 1) {
			hasmax := 0
			Loop, % teamswins { ; restore maximised windows
				WinGet, Minmaxed, MinMax, % "ahk_id " teamswins%A_Index%
				if (Minmaxed == 1)
					WinRestore, % "ahk_id " teamswins%A_Index%
			}
			tallest := 0
			tallestwin := 0
			secondtallest := 0
			secondtallestwin := 0
			shortest := 100000000000000000 ; a smaller value will replace this
			shortestwin := 0

			Loop, % teamswins { ; loops to get all heights, max and second largest height
				WinGetPos,,,,height,% "ahk_id " teamswins%A_Index%

				if (height >= tallest){
					secondtallest := tallest
					secondtallestwin := tallestwin
					tallest := height
					tallestwin := A_Index
				} else if (height < tallest && secondtallest == 0) {
					secondtallest := height
					secondtallestwin := A_Index
				}
				if (height < shortest) {
					shortest := height
					shortestwin := A_Index
				}
			}
			; this should probably maybe ensure calendar is always tallest window
			WinGetTitle, SecondTallestCheckTitle , % "ahk_id " teamswins%secondtallestwin%
			FoundPos := InStr(SecondTallestCheckTitle, "Calendar | Microsoft Teams" , CaseSensitive := true, StartingPos := 1, Occurrence := 1)

			if (FoundPos) { ; if the secondtallest window is calendar, then switch the tallest and secondtallest windows
				transferheight := tallest
				transferwindow := tallestwin
				tallestwin := secondtallestwin
				tallest := secondtallest
				secondtallest := transferheight
				secondtallestwin := transferwindow
			}

			WinGetTitle, tallesttitle, % "ahk_id " teamswins%tallestwin%
			WinGetTitle, secondtitle, % "ahk_id " teamswins%secondtallestwin%

			if (teams_main_side == "left") {
				WinMove, % "ahk_id " teamswins%tallestwin%,, % monitor_width + (1920 - 720), % top_offset, 720, 1040
				WinMove, % "ahk_id " teamswins%secondtallestwin%,, % monitor_width + teams_gaps, % top_offset + 5, 1190, 1030
			} else {
				WinMove, % "ahk_id " teamswins%tallestwin%,, % monitor_width, % top_offset, 720, 1040
				WinMove, % "ahk_id " teamswins%secondtallestwin%,, % monitor_width + teams_gaps + 720, % top_offset + teams_gaps, 1190, 1030
			}

			;MsgBox, main_side: %teams_main_side% `ntallest: %tallesttitle% - secondtallest: %secondtitle%
		}
		htk := 0
	}
return

F17::
^#Numpad4:: ; discord to primary monitor and fullscreen
	if (htk == 0) {
		htk := 1
		WinMinimize, ahk_exe MusicBee.exe
		WinGet, teamswins, List, ahk_exe Teams.exe
		Loop, % teamswins {
			PostMessage, 0x0112, 0xF020,,, % "ahk_id " teamswins%A_Index%
			Sleep, 50
		}
		WinRestore, ahk_exe Discord.exe
		WinMove, ahk_exe Discord.exe,, 0, 0  ; position discord on primary
		WinMaximize, ahk_exe Discord.exe
		WinActivate, ahk_exe Discord.exe
		htk := 0
	}
return

F18::
^#Numpad5:: ; musicbee to primary monitor and fullscreen
	if (htk == 0) {
		htk := 1
		WinMinimize, ahk_exe Discord.exe
		WinGet, teamswins, List, ahk_exe Teams.exe
		Loop, % teamswins {
			PostMessage, 0x0112, 0xF020,,, % "ahk_id " teamswins%A_Index%
			Sleep, 50
		}
		WinRestore, ahk_exe MusicBee.exe
		WinMove, ahk_exe MusicBee.exe,, 0, 0  ; position on primary
		WinMaximize, ahk_exe MusicBee.exe
		WinActivate, ahk_exe MusicBee.exe
		htk := 0
	}
return

^#F1:: ; help menu
	if !WinExist("lwm_hotkeys") {
		Gui, New, -MinimizeBox, lwm_hotkeys
		Gui, Font, s20,
		Gui, add, Text,, lwm
		Gui, font, s10,
		Gui, add, Text,, layout window manager `n`nby KraXen72 (edited by Fluteds)
		Gui, add, Text,, F13 / ctrl + win + num0 - lwm: hideall`nF14 / ctrl + win + num1 - lwm: discord fullscreen`nF15 / ctrl + win + num2 - lwm: discord + musicbee`nF16 / ctrl + win + num3 - lwm: ms teams`nF17 / ctrl + win + num4 - lwm: fullscreen discord to primary monitor`nF18 / ctrl + win + num5 - lwm: fullscreen musicbee to primary monitor
		Gui, Show
	}
return

; leaving aimp here
; in aimp settings, change the minimize/maximize hotkey to ctrl + shift + F6
AimpMinimize()
{
	WinGetPos, aimpx, aimpy, aimpw, aimph, ahk_class TAIMPMainForm
	if (aimph > 200) {
		Send, ^+{F6}
	}
}
AimpMaximize()
{
	WinGetPos, aimpx, aimpy, aimpw, aimph, ahk_class TAIMPMainForm
	if (aimph < 200) {
		Send, ^+{F6}
	}
}

RunDiscord() {
	Run, "C:\Users\%username%\AppData\Local\Discord\app-1.0.9028\Discord.exe" ; change to the .exe location or a shortcut
	Tooltip, Waiting for Discord..., 1921, 0
	Sleep, 2500
	Tooltip,
}
RunMusicBee() {
	Run, "C:\Program Files (x86)\MusicBee\MusicBee.exe" ; change to the .exe location or a shortcut
	Tooltip, Waiting for MusicBee..., 1921, 0
	Sleep, 2500
	Tooltip,
}

EnsureDiscordIsOnSecondaryMonitor(monitor_width)
{
	WinGetPos, discx, discy, discw, disch, ahk_exe Discord.exe
	;Tooltip, %discx%
	if (discx < (monitor_width - 8)) {
		WinRestore, ahk_exe Discord.exe
	}
}
EnsureWindowIsOnSecondaryMonitor(monitor_width, windows*) {
    Loop, Parse, windows, `,
    {
        window_name := A_LoopField
        WinGetPos, winx, winy, winw, winh, ahk_exe %window_name%.exe
        if (winx < (monitor_width - 8)) {
            WinRestore, ahk_exe %window_name%.exe
            WinMove, ahk_exe %window_name%.exe,, monitor_width, winy
        }
    }
}