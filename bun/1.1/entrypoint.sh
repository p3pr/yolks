#!/bin/bash

# Ensure we're in the correct directory
cd /home/container

# Print the current directory
echo "Current directory: $(pwd)"

# Check if the 'bun' command is available
if command -v bun &> /dev/null; then
    echo "bun is installed. Version:"
    bun --version
else
    echo "bun is not installed or not found in PATH"
fi

# Modify and print the STARTUP command
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo "Modified STARTUP command: ${MODIFIED_STARTUP}"

# Execute the modified STARTUP command
echo "Running STARTUP command..."
eval "${MODIFIED_STARTUP}"
