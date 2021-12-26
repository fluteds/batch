@echo off

if exist %1\* (rmdir %1 /S /Q) else del %1