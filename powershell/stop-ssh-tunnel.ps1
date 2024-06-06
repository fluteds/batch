# Log the action of stopping the SSH tunnel
Write-Output "Stopping SSH tunnel: $(Get-Date)"

# Check if the ssh_pid file exists
if (Test-Path "ssh_pid") {
    # Read the PID from the file
    $SSH_PID = Get-Content "ssh_pid"
    
    # Kill the SSH process
    Stop-Process -Id $SSH_PID -ErrorAction SilentlyContinue
    
    # Check if the kill command was successful
    if (-not (Get-Process -Id $SSH_PID -ErrorAction SilentlyContinue)) {
        Write-Output "SSH tunnel (PID $SSH_PID) terminated successfully."
    } else {
        Write-Output "Failed to terminate SSH tunnel (PID $SSH_PID)."
    }

    # Remove the PID file
    Remove-Item "ssh_pid"
} else {
    Write-Output "No ssh_pid file found. SSH tunnel may not be running."
}

# Log the completion of the action
Write-Output "Finished stopping SSH tunnel: $(Get-Date)"
