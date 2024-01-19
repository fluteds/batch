<# 
.SYNOPSIS
    Retrieves and displays weather information based on the specified or automatically determined geographical location.

.DESCRIPTION
    This PowerShell script retrieves weather information from the wttr.in service based on the specified or automatically determined geographical location. It accepts an optional parameter, $GeoLocation, which allows the user to specify the location. If no location is provided, the script automatically determines the location. It uses Invoke-WebRequest cmdlet to fetch weather information from the wttr.in service and displays it to the user. After displaying the weather information, the script pauses to keep the console window open.

.PARAMETER GeoLocation
    Specifies the geographical location for which weather information should be retrieved. If not provided, the location is determined automatically.

.EXAMPLE
    Retrieve weather information for a specific location:
    PS C:\> .\weather-report.ps1 -GeoLocation "London"

.EXAMPLE
    Retrieve weather information with automatic location detection:
    PS C:\> .\weather-report.ps1
#>

param([string]$GeoLocation = "") # Empty means determine automatically

try {
	(Invoke-WebRequest http://wttr.in/$GeoLocation -userAgent "curl" -useBasicParsing).Content
	cmd /c pause | out-null
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
