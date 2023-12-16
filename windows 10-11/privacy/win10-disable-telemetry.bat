:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
echo args = "ELEV " >> "%temp%\OEgetPrivileges.vbs"
echo For Each strArg in WScript.Arguments >> "%temp%\OEgetPrivileges.vbs"
echo args = args ^& strArg ^& " "  >> "%temp%\OEgetPrivileges.vbs"
echo Next >> "%temp%\OEgetPrivileges.vbs"
echo UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%SystemRoot%\System32\WScript.exe" "%temp%\OEgetPrivileges.vbs" %*
exit /B

:gotPrivileges
if '%1'=='ELEV' shift /1
setlocal & pushd .
cd /d %~dp0

:Start
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
reg add HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener\ /v Start /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection\ /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility\ /v DiagnosticErrorText /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings\ /v DiagnosticErrorText /t REG_SZ /d "" /f
reg add HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings\ /v DiagnosticLinkText /t REG_SZ /d "" /f