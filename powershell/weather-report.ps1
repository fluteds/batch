param([string]$GeoLocation = "") # Empty means determine automatically

try {
	(Invoke-WebRequest http://wttr.in/$GeoLocation -userAgent "curl" -useBasicParsing).Content
	cmd /c pause | out-null
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
