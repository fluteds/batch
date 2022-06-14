<#
.SYNOPSIS
	Opens Cloudflare's Speed Test
.DESCRIPTION
	Launches the default browser with Cloudflare's speed test website.
#>

& "$PSScriptRoot/open-default-browser.ps1" "https://speed.cloudflare.com"
exit 0
