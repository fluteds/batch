#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

SetTitleMatchMode, 2 ; Matches if 'Twitch' is in the window title https://www.autohotkey.com/docs/commands/SetTitleMatchMode.htm
#IfWinActive Twitch ;
\:: Send {F11} ; "\" to send Fn+F11
return
^:: Send !t ; ` To send Alt+T
return