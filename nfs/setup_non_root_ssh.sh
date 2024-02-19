#!/bin/bash

# First argument is the name of the root VM which has the volume
# Second argument is the IP address of the root VM which has the volume
# By default we are using the root user

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <server_name> <disk_device>"
    exit 1
fi

# Create .ssh dir /w mode 700 if it doesn't exist
if [ ! -d /root/.ssh ]; then mkdir /root/.ssh && chmod 700 /root/.ssh; fi
cd /root/.ssh

# Create .ssh/config /w mode 600 if it doesn't exist
if [ ! -f /root/.ssh/config ]; then touch /root/.ssh/config && chmod 600 /root/.ssh/config; fi

# Add the config so we can SSH to the root VM via hostname
cat <<EOF > /root/.ssh/config
Host $1
HostName $2
Port 22
User root
IdentityFile ~/.ssh/id_rsa
IdentitiesOnly yes
LogLevel QUIET
EOF

# Create server2's SSH id_rsa as promised in the config above
if [ ! -f /root/.ssh/id_rsa ]; then ssh-keygen -t rsa -C "server2 --> server1"; fi

# Output the public key, save it in the local clipboard so we can use it later
cat /root/.ssh/id_rsa.pub

