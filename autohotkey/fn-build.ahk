; turbo edit for FN Nova
; old FN builds do not support turbo mode

IfWinActive("Fortnite")

Pause, Off

$f:: ; triggered when F is pressed
Send, {WheelDown}
Sleep, 8
Send, {p down}
While GetKeyState("f", "P")
    Continue
Send, {p up}
Send, {f}
Return

; reset build
$ff:: ; F is pressed twice quickly
Send, {r}
Return

Else
Pause, On