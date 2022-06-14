@echo off
SETLOCAL EnableExtensions DisableDelayedExpansion

:: Name:        SyncTime
:: Author:      Jane Rivas
:: Description: Synchronize time on local computer using w32tm
:: Version:     0.1

SET service=w32time

SC QUERYEX %service% | FIND "STATE" | FIND /v "RUNNING" > NUL && (
  echo %service% is not running
  echo Start %service%

  NET START %service% > NUL || (
    echo %service% won't start
    pause
    EXIT /B 1
  )

  echo %service% is started
  GOTO sync
  EXIT /B 0
) || (
  echo %service% is running
  GOTO sync
  EXIT /B 0
)

:sync
w32tm /resync /rediscover
IF ERRORLEVEL 1 (
  pause
) || (
  EXIT /B 0
)
pause
