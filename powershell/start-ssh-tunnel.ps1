$host.UI.RawUI.WindowTitle = "SSH Tunnel"

# Function to check if the SSH tunnel is already running
function Is-TunnelRunning {
    if (Test-Path "ssh_pid") {
        $SSH_PID = Get-Content "ssh_pid"
        if (Get-Process -Id $SSH_PID -ErrorAction SilentlyContinue) {
            Write-Output "SSH tunnel is already running with PID: $SSH_PID"
            exit 1
        } else {
            Write-Output "Found stale PID file. Cleaning up."
            Remove-Item "ssh_pid"
        }
    }
}

# Function to check if the port is in use
function Is-PortInUse {
    $port = 6667
    $tcpConnections = Get-NetTCPConnection -LocalPort $port -ErrorAction SilentlyContinue
    if ($tcpConnections) {
        Write-Output "Port $port is already in use."
        exit 1
    }
}

# Log the start time
Write-Output "Starting SSH tunnel: $(Get-Date)"

# Check if the tunnel is already running
Is-TunnelRunning

# Check if the port is in use
Is-PortInUse

# Start SSH tunnel and log output to the console
# Use the correct path to the identity file
Start-Process -NoNewWindow -FilePath "ssh" -ArgumentList "-N -i ~/.ssh/tilde.town fluted@tilde.town -L localhost:6667:localhost:6667" -PassThru | ForEach-Object {
    Start-Sleep -Seconds 1
    if (Get-Process -Id $_.Id -ErrorAction SilentlyContinue) {
        $_.Id | Out-File "ssh_pid"
        Write-Output "SSH tunnel started with PID: $($_.Id)"
        Write-Output "Closing this window will kill the tunnel"
    } else {
        Write-Output "Failed to start SSH tunnel."
    }
}
