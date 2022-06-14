<#
.SYNOPSIS
	Shows a live flight feed of planes around the world.
.DESCRIPTION
	Launches default browser and opens Fightradar24.
#>

& "$PSScriptRoot/open-default-browser.ps1" "https://www.flightradar24.com/"
exit 0
