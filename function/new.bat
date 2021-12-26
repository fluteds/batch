@echo off

:next
if "%1" equ "" goto:eof
if exist "%1" (
  echo "File %1 exists"
) else (
  type nul > %1
)
shift
goto:next
pause