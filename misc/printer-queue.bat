@echo off

::: Kill the CMD window to Minimize it
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit

::: Open Printer Queue
rundll32.exe printui.dll,PrintUIEntry /o /n "PUT PRINTER NAME"
EXIT