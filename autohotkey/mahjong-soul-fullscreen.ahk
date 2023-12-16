#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

SetTitleMatchMode, 2 ; https://www.autohotkey.com/docs/commands/SetTitleMatchMode.htm
#IfWinActive MahjongSoul ;
\:: Send {F11} ; "\" to send Fn+F11
return
