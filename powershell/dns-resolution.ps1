<# 
.SYNOPSIS
    Measures the performance of DNS resolution for a list of domain names stored in a CSV file.

.DESCRIPTION
    This PowerShell script reads domain names from a CSV file and performs DNS resolution for each domain. It utilizes either the `dig` command or the `Resolve-DnsName` cmdlet based on the operating system to resolve domain names. After resolving all domains, it calculates the average number of domains resolved per second and displays the result.

.PARAMETER PSScriptRoot
    The root directory of the PowerShell script. This parameter is used to locate the CSV file containing domain names.

.EXAMPLE
    Measure DNS resolution performance:
    PS C:\> .\dns-resolution.ps1
#>

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
