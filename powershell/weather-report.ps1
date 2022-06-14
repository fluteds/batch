<#
.SYNOPSIS
	Lists the current weather forecast
.DESCRIPTION
	Lists the current weather forecast using wttr.in.
.PARAMETER GeoLocation
	Specifies the geographic location to use e.g. "London, UK"

#>

param([string]$GeoLocation = "") # empty means determine automatically

try {
	(Invoke-WebRequest http://wttr.in/$GeoLocation -userAgent "curl" -useBasicParsing).Content
	cmd /c pause | out-null
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
