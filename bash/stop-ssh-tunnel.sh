#!/bin/bash

# Log the action of stopping the SSH tunnel
echo "Stopping SSH tunnel: $(date)"

# Check if the ssh_pid file exists
if [ -e ssh_pid ]; then
    # Read the PID from the file
    SSH_PID=$(cat ssh_pid)
    
    # Kill the SSH process
    kill $SSH_PID
    
    # Check if the kill command was successful
    if [ $? -eq 0 ]; then
        echo "SSH tunnel (PID $SSH_PID) terminated successfully."
    else
        echo "Failed to terminate SSH tunnel (PID $SSH_PID)."
    fi

    # Remove the PID file
    rm -f ssh_pid
else
    echo "No ssh_pid file found. SSH tunnel may not be running."
fi

# Log the completion of the action
echo "Finished stopping SSH tunnel: $(date)"
