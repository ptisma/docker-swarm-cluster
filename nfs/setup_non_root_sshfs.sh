#!/bin/bash

# Script to setup the sshfs, mount the volume and edit the /etc/fstab for auto-mount on boot

# First argument is the name of the root VM

# Check if one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <server_name>"
    exit 1
fi

# Install sshfs
apt install sshfs -y

# Create the mount point
mkdir /mnt/storage

# Mount the volume from root VM using sshfs
sshfs "$1":/mnt/storage /mnt/storage

# Add the entry to /etc/fstab file so that filesystem is mounted automatically during boot time
echo "$1:/mnt/storage /mnt/storage fuse.sshfs defaults,allow_other,reconnect,_netdev,users,ServerAliveInterval=15,ServerAliveCountMax=3 0 0" | sudo tee -a /etc/fstab

# sudo mount -a




