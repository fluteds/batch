#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

; Double press Q for ø
; Double press W for å
; Double press E for æ
; Double press Shift + Corresponding key twice for capital ø, å, æ

~$q::
KeyWait, q, U
KeyWait, q, D, T0.1
If (ErrorLevel = 0)
send, {BS 2}ø
return

~$+Q:: ; Capital 
KeyWait, Q, U
KeyWait, Q, D, T0.1
If (ErrorLevel = 0)
send, {BS 2}Ø
return

~$w::
KeyWait, w, U
KeyWait, w, D, T0.1
If (ErrorLevel = 0)
send, {BS 2}å
return

~$+W:: ; Capital
KeyWait, W, U
KeyWait, W, D, T0.1
If (ErrorLevel = 0)
send, {BS 2}Å
return

~$e::
KeyWait, e, U
KeyWait, e, D, T0.1
If (ErrorLevel = 0)
send, {BS 2}æ
return

~$+E:: ; Capital
KeyWait, E, U
KeyWait, E, D, T0.1
If (ErrorLevel = 0)
send, {BS 2}Æ
return