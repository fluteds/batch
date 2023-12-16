try {
	$StopWatch = [system.diagnostics.stopwatch]::startNew()

	write-progress "Reading Powershell/domain-names.csv..."
	$Table = Import-CSV "$PSScriptRoot/domain-names.csv"

	if ($IsLinux) {
		foreach($Row in $Table) {
			write-progress "Resolving $($Row.Domain)..."
			$null = dig $Row.Domain +short
		}
	} else {
		foreach($Row in $Table) {
			write-progress "Resolving $($Row.Domain)..."
			$null = Resolve-dnsName $Row.Domain
		}
	}
	$Count = $Table.Length

	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	$Average = [math]::round($Count / $Elapsed, 1)
	"$Average domains per second DNS resolution"
	exit 0
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
