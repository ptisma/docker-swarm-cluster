# docker-swarm-cluster

This repo contains the instructions and code how I setup my home lab Docker Swarm cluster on Hetzner cloud.

General idea was to spin up the bunch of VM-s, connect them to the Docker Swarm cluster and mount the NFS on them to have the persistence enabled for the containers (I dont want the scenario when containers get redeployed to another VM and they don't have the access to same volumes as before).

Since the Hetzner Cloud volumes can only be attached to one VM at a time, I did a "hacky" workaround, the "root" VM has the "big" volume attached to it and mounted on its filesystem, this part of filesystem is then mounted on other Docker Swarm cluster VM-s using sshfs.


## how to setup this stuff

Since the root VM and volume together with the network and firewall already exist, head to hetzner-infra to spin up the new VM-s. After that's done go to docker-swarm to connect those VM-s into the Swarm cluster. Last step is nfs, head there to mount the root's volume on the newly created VM-s.
