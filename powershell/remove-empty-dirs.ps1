<# 
.SYNOPSIS
    Deletes empty directories recursively from the specified directory path and provides details about the deleted directories.

.DESCRIPTION
    This PowerShell script deletes empty directories recursively from the specified directory path. It first prompts the user to enter the directory path if not provided as a parameter. Then, it identifies all empty directories within the specified path and sorts them based on their depth in the directory tree. After sorting, it deletes each empty directory and records details such as deletion time, creation time, last modified time, and owner. Finally, it displays a message indicating the completion of the deletion process along with any errors encountered.

.PARAMETER DirTree
    Specifies the directory path from which empty directories should be deleted. If not provided, the script prompts the user to enter the directory path.

.EXAMPLE
    Delete empty directories and display details:
    PS C:\> .\remove-empty-dirs.ps1 -DirTree "C:\Path\To\Directory"
#>


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
