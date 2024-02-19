#!/bin/bash
# Script which configures an existing Hetzner Cloud Volume on the VM
# First argument is the name of the filesystem type
# Second argument is the name of the disk device

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <filesystem_type> <disk_device>"
    exit 1
fi

# Format the volume
mkfs."$1" "/dev/disk/by-id/$2"

# Create a directory for mounting
mkdir -p /mnt/storage

# Mount the volume
mount -o discard,defaults "/dev/disk/by-id/$2" /mnt/storage

# Add the volume to /etc/fstab
echo "/dev/disk/by-id/$2 /mnt/storage $1 discard,nofail,defaults 0 0" >> /etc/fstab

