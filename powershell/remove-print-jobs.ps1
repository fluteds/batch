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
