<#
.SYNOPSIS
	Lists the hourly weather report
.DESCRIPTION
	This PowerShell script lists the hourly weather report.
.PARAMETER Location
	Specifies the location to use (determined automatically per default) using wttr.in.
#>

param([string]$Location = "")

try {
	$Weather = (invoke-webRequest -uri http://wttr.in/${Location}?format=j1 -userAgent "curl" -useBasicParsing).Content | ConvertFrom-Json

	$Area = $Weather.nearest_area.areaName.value
	$Region = $Weather.nearest_area.region.value
	$Country = $Weather.nearest_area.country.value	

	[int]$Day = 0
	foreach ($Hourly in $Weather.weather.hourly) {
		$Hour = $Hourly.time / 100
		$Temp = $Hourly.tempC
		$Precip = $Hourly.precipMM
		$Humidity = $Hourly.humidity
		#$Pressure = $Hourly.pressure
		$WindSpeed = $Hourly.windspeedKmph
		$WindDir = $Hourly.winddir16Point
		$UV = $Hourly.uvIndex
		$Clouds = $Hourly.cloudcover
		$Desc = $Hourly.weatherDesc.value
		if ($Hour -eq 0) {
			if ($Day -eq 0) {
				write-host FORECAST FOR $Area ($Region, $Country)
				"`n"
				write-host "TODAY"
				write-host -foregroundColor green " 🕗    🌡°C     ☂️   💧     💨 from    ☀️UV   ☁️   DESC"
			} elseif ($Day -eq 1) {
				"`n"
				write-host -foregroundColor green "TOMORROW"
				write-host -foregroundColor green " 🕗    🌡°C     ☂️   💧     💨 from    ☀️UV   ☁️   DESC"
			} else {
				"`n"
				write-host -foregroundColor green "DAY AFTER TOMORROW"
				write-host -foregroundColor green " 🕗    🌡°C     ☂️   💧     💨 from    ☀️UV   ☁️   DESC"
			}
			$Day++
		}
		"$(($Hour.toString()).PadLeft(2))°°   $(($Temp.toString()).PadLeft(2))°   $($Precip)mm $(($Humidity.toString()).PadLeft(3))%   $(($WindSpeed.toString()).PadLeft(2))km/h $WindDir`t$($UV)  $(($Clouds.toString()).PadLeft(3))%   $Desc"
		$Hour++
	}
	cmd /c pause | out-null
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
