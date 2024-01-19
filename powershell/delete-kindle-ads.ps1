<# 
.SYNOPSIS
Deletes the ads off of a Kindle device.

.DESCRIPTION
This PowerShell script automates the process of removing ads from a Kindle device. It first detects the Kindle drive letter, checks for the existence of the required path, removes the ads directory and its contents, creates an empty file in the specified path, and ensures that read-only, system, and hidden attributes are removed. The script then verifies whether the ads have been successfully deleted and provides appropriate messages based on the outcome.

.EXAMPLE
Basic usage:
C:\PS> PowerShell.exe -ExecutionPolicy Bypass .\delete-kindle-ads.ps1

#>

Clear-Host

# Automatically detect the Kindle drive letter
$kindleVolume = Get-Volume | Where-Object { $_.FileSystemLabel -eq 'Kindle' }

# Check if Kindle drive volume was found
if ($null -eq $kindleVolume) {
    Write-Host "Error: Kindle drive not found."
    Pause
    exit
}

# Extract the drive letter from the volume object
$letter = $kindleVolume.DriveLetter

# Construct the path
$path = "${letter}:\system\.assets"

# Check if the path exists before attempting to remove it
if (Test-Path $path) {
    # Remove the directory and its contents
    Remove-Item -Path $path -Recurse -Force

    # Create an empty file at the specified path
    New-Item -ItemType File -Path $path -Force | Out-Null

    # Remove read-only, system, and hidden attributes from the directory and its contents
    Get-ChildItem -Path $path -Recurse | ForEach-Object {
        $_.Attributes = $_.Attributes -band (-bnot [System.IO.FileAttributes]::ReadOnly) -band (-bnot [System.IO.FileAttributes]::Hidden) -band (-bnot [System.IO.FileAttributes]::System)
    }

    # Check if the directory still exists
    if (Test-Path "${path}\*") {
        Write-Host "An error has occurred, the ads on your Kindle have NOT been removed."
        Clear-Host
        Write-Host "There's been a mistake, the Kindle ads have NOT been deleted."
    } else {
        Write-Host "Ads on your Kindle have been deleted correctly."
        Clear-Host
        Write-Host "Ads on your Kindle have been deleted correctly."
    }
} else {
    Write-Host "Error: The specified path does not exist."
}

# Pause to keep the console open
Pause
