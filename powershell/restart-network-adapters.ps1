<# 
.SYNOPSIS
    Restarts all local network adapters on the system.

.DESCRIPTION
    This PowerShell script restarts all local network adapters on the system. It requires elevated privileges and hence should be run with administrator rights. The script utilizes the Get-NetAdapter cmdlet to retrieve a list of network adapters and then restarts each adapter using the Restart-NetAdapter cmdlet. After restarting all adapters, the script displays the total time taken for the operation to complete.

.REQUIREMENTS
    This script requires elevated privileges and must be run as an administrator.

.EXAMPLE
    Restart all local network adapters:
    PS C:\> .\restart-network-adapters.ps1
#>

#Requires -RunAsAdministrator

try {
	$StopWatch = [system.diagnostics.stopwatch]::startNew()

	Get-NetAdapter | Restart-NetAdapter 

	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	"Restarted all local network adapters in $Elapsed sec"
	exit 0
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
