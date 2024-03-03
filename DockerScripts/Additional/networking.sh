#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

apt-get install iproute2 -y # Install iproute2 (ip addr)
apt-get install iputils-ping -y # Install iputils-ping (ping)

# NETWORKING BASIC CHECKS
docker exec -it 393ffcfb81d7 /bin/bash
apt-get install update
apt-get upgrade -y
install iputils-ping -y
ping -c 3 172.17.0.1


## NETWORKING IPS AND PORTS
sudo iptables -t nat -L -n # List all iptables nat rules (network address translation)


## ADVANCED NETWORKING
docker network ls # List all networks
############################################
# NETWORK ID     NAME      DRIVER    SCOPE #
# 6bb2a09c4c53   bridge    bridge    local #
# cc9d1fa0a761   host      host      local #
# 67ad6cc98dba   none      null      local #
############################################
# "NETWORK ID" is the ID of the network
# "NAME" is the name of the network
# "DRIVER" is the driver of the network (bridge, host, none)
# "SCOPE" is the scope of the network (local, swarm)

docker network inspect bridge # Inspect a network (bridge) and show info about it
docker network inspect host # Inspect a network (host) and show info about it
docker network inspect none # Inspect a network (none) and show info about it

sudo apt-get install bridge-utils
brctl show # Show all bridges
ip addr show # Show all network interfaces

docker run -dt ubuntu sleep infinity
docker ps

docker network inspect bridge

ping -c5 172.17.0.3
docker exec -it 4f13962bd0e2 /bin/bash
apt-get update && apt-get install -y iputils-ping
ping -c5 www.github.com
exit
docker stop 4f13962bd0e2


docker run --name web1 -d -p 8080:80 nginx
docker ps
curl 127.0.0.1:8080

# Initialize a new Swarm join a single worker node

## STEP 1: THE BASICS
docker inspect bridge --format='{{.IPAM}}'

docker swarm init --advertise-addr 172.17.0.1 # Initialize a new Swarm

### Now we will create a worker in container
swarm_token=$(docker swarm join-token -q worker)
docker run -d --privileged --name worker --hostname=worker -p 12375:2375 docker:18.09-dind
docker --host=localhost:12375 swarm join --token ${swarm_token} 172.17.0.1:2377

docker node ls # List all nodes in the swarm

## ERROR
docker swarm leave --force
docker service rm $(docker service ls -q)
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
sudo rm -rf /var/lib/docker/swarm


# STEP 2: CREATE AN OVERLAY NETWORK
docker network create -d overlay overnet
docker network ls
docker network inspect overnet

# STEP 3: CREATE A SERVICE
docker service create --name myservice --network overnet --replicas 2 ubuntu sleep infinity # Create a service
docker service ls # List all services
docker service ps myservice # List all tasks of a service
docker network inspect overnet
docker exec -it 948bc0dff5ae /bin/bash
apt-get update && apt-get install -y iputils-ping
ping -c5 10.0.0.3

# STEP 4: TEST SERVICE DISCOVERY
ping -c5 myservice
exit
docker service inspect myservice
#"VirtualIPs":
#    {
#        "NetworkID": "o46yz3pa2di2a3v0q087u5ue4",
#        "Addr": "10.0.1.2/24"
#    }

# CLEANING UP
docker service rm myservice
docker swarm leave --force