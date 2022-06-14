@echo off 
:: This batch file details Windows 10, hardware, and networking configuration.
TITLE My System Info
echo Please wait... Checking system information.
:: Section 1: Windows 10 information
echo ==========================
echo WINDOWS INFO
echo ============================
systeminfo | findstr /c:"OS Name"
systeminfo | findstr /c:"OS Version"
systeminfo | findstr /c:"System Type"
:: Section 2: Hardware information.
echo ============================
echo HARDWARE INFO
echo ============================
systeminfo | findstr /c:"Total Physical Memory"
wmic cpu get name
wmic diskdrive get name,model,size
wmic path win32_videocontroller get name
:: Section 3: Networking information.
echo ============================
echo NETWORK INFO
echo ============================
ipconfig | findstr IPv4
ipconfig | findstr IPv6
pause