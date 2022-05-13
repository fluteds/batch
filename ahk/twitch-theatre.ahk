#SingleInstance, Force ; Forces ONE instance please I cannot handle 200 of these running
SetWorkingDir, %A_ScriptDir%

SetTitleMatchMode, 2 ; Matches if 'Twitch' is in the window title https://www.autohotkey.com/docs/commands/SetTitleMatchMode.htm
#IfWinActive Twitch ; Variable to match
\:: Send {F11} ; Literally just "\" to send Fn+F11
^:: Send !t ; ` to send Alt+T
return