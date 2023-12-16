param([string]$DirTree = "")

try {
	if ($DirTree -eq "" ) { $DirTree = read-host "Enter directory path" }

	$Folders = @()
	foreach ($Folder in (Get-ChildItem -path  "$DirTree" -Recurse | Where { $_.PSisContainer })) {
		$Folders += New-Object PSObject -Property @{
			Object = $Folder
			Depth = ($Folder.FullName.Split("\")).Count
		}
	}
	$Folders = $Folders | Sort Depth -Descending

	$Deleted = @()
	foreach ($Folder in $Folders)
	{
		if ($Folder.Object.GetFileSystemInfos().Count -eq 0) {
			$Deleted += New-Object PSObject -Property @{
				Folder = $Folder.Object.FullName
				Deleted = (Get-Date -Format "hh:mm:ss tt")
				Created = $Folder.Object.CreationTime
				'Last Modified' = $Folder.Object.LastWriteTime
				Owner = (Get-Acl $Folder.Object.FullName).Owner
			}
			Remove-Item -Path $Folder.Object.FullName -Force
		}
	}
	"Done - Deleted"
	exit 0
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
