#NoEnv 
; #Warn 
SendMode Input 
SetWorkingDir %A_ScriptDir%

;-Caption
LWIN & LButton::
WinSet, Style, -0xC00000, A
return
;

;+Caption
LWIN & RButton::
WinSet, Style, +0xC00000, A
return
;