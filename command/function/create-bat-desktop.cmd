@echo off

goto :title

:title
cd %homepath%
cd desktop
echo Title For Batch file?
set /P b=
echo @echo off > %b%.bat
::edit %b%.bat
exit