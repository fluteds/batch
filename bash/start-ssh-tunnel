#!/bin/bash

# Function to check if the SSH tunnel is already running
is_tunnel_running() {
    if [ -e ssh_pid ]; then
        SSH_PID=$(cat ssh_pid)
        if ps -p $SSH_PID > /dev/null; then
            echo "SSH tunnel is already running with PID: $SSH_PID"
            exit 1
        else
            echo "Found stale PID file. Cleaning up."
            rm -f ssh_pid
        fi
    fi
}

# Function to check if the port is in use
is_port_in_use() {
    if netstat -an | grep -q ":6667"; then
        echo "Port 6667 is already in use."
        exit 1
    fi
}

# Log the start time
echo "Starting SSH tunnel: $(date)"

# Check if the tunnel is already running
is_tunnel_running

# Check if the port is in use
is_port_in_use

# Start SSH tunnel and log output to the console
ssh -N -i ~/.ssh/tilde.town fluted@tilde.town -L localhost:6667:localhost:6667 &
SSH_PID=$!
echo $SSH_PID > ssh_pid
echo "SSH tunnel started with PID: $SSH_PID"
