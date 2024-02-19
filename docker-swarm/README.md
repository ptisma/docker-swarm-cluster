Installing Docker on Ubuntu 22.04 LTS VM:
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install docker.io

How nodes work in Docker Swarm mode:
Swarm consists of two types of nodes, managers and workers.
Managers take care of cluster state, scheduling services etc.
Workers execute containers.
By default all managers are also workers.

To prevent the scheduler from placing tasks on a manager node in a multi-node swarm, set the availability for the manager node to Drain.
docker node update --availability drain <NODE_ID>

Creating Docker Swarm on first manager node:
docker swarm init --advertise-addr <MANAGER-IP>

Joining nodes in Docker Swarm:

Adding worker to swarm:
Run the command on manager node which will output the join command for worker:
docker swarm join-token worker
Run the join command on worker node for example:
docker swarm join \
  --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
  192.168.99.100:2377

Adding manager to swarm:
Run the command on manager node which will output the join command for manager:
docker swarm join-token manager

Testing the Docker Swarm by deploying a Docker Swarm service, scaling it, updating it and deleting:
docker service create --replicas 2 --name helloworld alpine ping docker.com
docker service ps helloworld
docker service inspect helloworld --pretty
docker service scale helloworld=5
docker service update --image alpine:3.15 helloworld
docker service rm helloworld



9uk4639qpg7npwf3fn2aasksr

Docs:
https://docs.docker.com/engine/swarm/key-concepts/