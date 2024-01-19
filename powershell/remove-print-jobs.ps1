<# 
.SYNOPSIS
    Removes all print jobs from the installed printers on the system.

.DESCRIPTION
    This PowerShell script removes all print jobs from the installed printers on the system. It first retrieves a list of printers using the Get-Printer cmdlet. If no printers are found, it throws an error. Otherwise, it iterates through each printer and retrieves its associated print jobs using the Get-PrintJob cmdlet. For each print job, it removes the job using the Remove-PrintJob cmdlet. After removing all print jobs, the script displays a message indicating the successful completion of the operation.

.REQUIREMENTS
    PowerShell version 4 or higher is required.

.EXAMPLE
    Remove all print jobs:
    PS C:\> .\remove-print-jobs.ps1
#>


#Requires -Version 4

try {
	$printers = Get-Printer
	if ($printers.Count -eq 0) { throw "No printer found" }
		
	foreach ($printer in $printers) {
		$printjobs = Get-PrintJob -PrinterObject $printer
		foreach ($printjob in $printjobs) {
			Remove-PrintJob -InputObject $printjob
		}
	}

	"All print jobs removed"
	cmd /c pause | out-null
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
