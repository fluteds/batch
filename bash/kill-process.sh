#!/bin/bash

ps -u fluted

# Print the processes to be killed
echo "Killing all code-insiders-b processes:"
ps -e | grep code-insiders-b

# Kill all code-insiders-b processes
pkill -f code-insiders-b

# Verify if the processes have been killed
echo "Remaining code-insiders-b processes (should be none):"
ps -e | grep code-insiders-b
