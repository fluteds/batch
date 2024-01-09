#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force

~LWin::
    Send {Blind}{vkE8}
return

CenterWindow(WinTitle)
{
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
}

+!f::
WinGet, WinState, MinMax, A
if (WinState = 1) {
    WinRestore, A
}
else {
    WinMaximize, A
}

return

#+r::
    WinGetActiveTitle, Title
    WinMove, %Title%, , , ,1600,900
    CenterWindow(Title)
return
#+!r::
    WinGetActiveTitle, Title
    CenterWindow(Title)
return

#+LButton::
    WinGetActiveTitle, Title
    WinSet, Style, -0xC00000, %Title%
return
#+RButton::
    WinGetActiveTitle, Title
    WinSet, Style, +0xC00000, %Title%
return

#+MButton::
    WinSet, Transparent, 255, A
return
#+WheelUp::
    WinGet, Alpha, Transparent, A
    if (!Alpha)
        Alpha = 255

    Alpha += 4
    if (Alpha > 255)
        Alpha = 255

    WinSet, Transparent, %Alpha%, A
return
#+WheelDown::
    WinGet, Alpha, Transparent, A
    if (!Alpha)
        Alpha = 255

    Alpha -= 4
    if (Alpha < 56)
        Alpha = 56

    WinSet, Transparent, %Alpha%, A
return

holdm1 := 0
holdm2 := 0
#F12::
    holdm1 := !holdm1

    if (holdm1 = 0) {
        Click up
    } else {
        Click down
    }
return
#+F12::
    holdm2 := !holdm2

    if (holdm2 = 0) {
        Click up Right
    } else {
        Click down Right
    }
return

; alt +
!l::
    Send {Right}
return
!k::
    Send {Up}
return
!j::
    Send {Down}
return
!h::
    Send {Left}
return

#IfWinActive

ShellRun(prms*) {
    shell := ComObjCreate("Shell.Application")
    shell.ShellExecute("powershell.exe", "-NoExit ssh fluted@tty.sdf.org")
}

#Enter::
    ShellRun()
return