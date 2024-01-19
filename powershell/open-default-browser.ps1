<# 
.SYNOPSIS
    Opens the specified URL in the default web browser.

.DESCRIPTION
    This PowerShell script opens the specified URL in the default web browser. It accepts an optional parameter, $URL, which specifies the URL to open. If no URL is provided, the script defaults to opening "https://www.duckduckgo.com". The script uses the Start-Process cmdlet to launch the default web browser with the specified URL.

.PARAMETER URL
    Specifies the URL to open in the default web browser. If not provided, the script defaults to "https://www.duckduckgo.com".

.EXAMPLE
    Open a specific URL:
    PS C:\> .\open-default-browser.ps1 -URL "https://www.example.com"
    This command executes the script and opens "https://www.example.com" in the default web browser.

.EXAMPLE
    Open the default URL (DuckDuckGo):
    PS C:\> .\open-default-browser.ps1
    This command executes the script and opens "https://www.duckduckgo.com" in the default web browser.
#>


param([string]$URL = "https://www.duckduckgo.com")

try {
	Start-Process $URL
	exit 0
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
