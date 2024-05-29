@echo off
echo Attempting to update Scoop...
scoop update * && (
    echo Scoop update successful.
    echo Cleaning up Scoop...
    scoop cleanup *
    echo Scoop cleanup successful.
) || (
    echo Scoop update failed.
)
pause
