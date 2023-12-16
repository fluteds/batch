param([string]$URL = "http://www.duckduckgo.com")

try {
	Start-Process $URL
	exit 0
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
