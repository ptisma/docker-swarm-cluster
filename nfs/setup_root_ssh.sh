#!/bin/bash

# Script to add an SSH public key to the authorized_keys file of the root user

# Check if one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ssh_public_key>"
    exit 1
fi

# Create the .ssh directory if it doesn't exist
if [ ! -d /root/.ssh ]; then
    mkdir -p /root/.ssh
    chmod 700 /root/.ssh
fi

# Create the authorized_keys file if it doesn't exist
if [ ! -f /root/.ssh/authorized_keys ]; then
    touch /root/.ssh/authorized_keys
    chmod 600 /root/.ssh/authorized_keys
fi

# Append the provided SSH public key to the authorized_keys file
echo "$1" >> /root/.ssh/authorized_keys

