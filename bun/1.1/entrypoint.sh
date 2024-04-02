#!/bin/bash

# Ensure we're in the correct directory
cd /home/container

# Check if the 'bun' command is available
if command -v bun &> /dev/null; then
    bun --version
else
    echo "bun is not installed or not found in PATH"
fi

# Modify and print the STARTUP command
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')

eval "${MODIFIED_STARTUP}"
