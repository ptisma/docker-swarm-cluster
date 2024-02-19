# nfs-storage

In order to use the "stateful" applications on our Docker Swarm clusterm, we need to implement some sort of NFS storage to persist the data for our containers. Docker Swarm doesn't do this out of the box so we are going to use the Hetzner Cloud Volumes.

The problem is, that Hetzner Cloud Volumes can only be attached to one single VM, so in order to "mock" the nfs storage we are going to use the one Cloud Volume on one VM, and use that volume and mount it on other VM nodes through sshfs.

We first create the Hetzner Volume on the root VM and attach to it.
I have chosen the manual way of setting up the volume so run setup_volume_root.sh script on the root VM.

In order for our other VM-s to use the volume, they need to connect via SSH to the root VM, we first setup the ssh on non root VM by running the script setup_non_root_ssh.sh (this will generate the ssh keys and output us the public key).

After this run the script setup_root_ssh.sh on root VM to setup the ssh (this will add the public key of non root VM-s).

Lastly, run the setup_non_root_sshfs.sh on non root VM to setup sshf and mount the volume.


DOCS:
https://community.hetzner.com/tutorials/mount-volume-on-multiple-servers-with-sshfs




