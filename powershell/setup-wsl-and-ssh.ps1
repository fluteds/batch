# Ensure WSL is enabled
Write-Host "Checking if WSL is enabled..."
wsl --list > $null 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "WSL is not enabled. Enabling WSL..."
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
    Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
    Restart-Computer
}

# Install Ubuntu if not already installed
Write-Host "Checking if Ubuntu is installed..."
$wslDistros = wsl --list --online | Select-String -Pattern "Ubuntu"
if ($wslDistros -eq $null) {
    Write-Host "Ubuntu is not installed. Installing Ubuntu..."
    wsl --install -d Ubuntu
}

# Wait for Ubuntu installation to complete
Write-Host "Waiting for Ubuntu installation to complete..."
Start-Sleep -Seconds 30

# Set the username for WSL
$wslUsername = "fluted"

# Create .ssh directory in WSL home directory if it doesn't exist
Write-Host "Setting up .ssh directory in WSL..."
wsl -u $wslUsername -- mkdir -p /home/$wslUsername/.ssh

# Copy SSH keys from Windows to WSL
$windowsSshPath = "C:\Users\$env:USERNAME\.ssh"
$wslSshPath = "/home/$wslUsername/.ssh"
Write-Host "Copying SSH keys from Windows to WSL..."
Copy-Item -Path "$windowsSshPath\*" -Destination "\\wsl$\Ubuntu\home\$wslUsername\.ssh" -Recurse

# Set correct permissions on SSH keys in WSL
Write-Host "Setting correct permissions on SSH keys in WSL..."
wsl -u $wslUsername -- chmod 700 /home/$wslUsername/.ssh
wsl -u $wslUsername -- find /home/$wslUsername/.ssh -type d -exec chmod 700 {} \;
wsl -u $wslUsername -- find /home/$wslUsername/.ssh -type f -exec chmod 600 {} \;

Write-Host "WSL and SSH keys setup complete."
