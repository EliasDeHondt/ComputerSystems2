#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

## Good to know.
--restart=always # Restart the container when the host gets restart it

## Docker commands info
docker login # Login to docker hub
docker container ls -a # List all containers
docker container ls # List all running containers
docker ps # List all running containers
docker images ls # List all images

docker diff 88b8664e4df5 # List all changes made to a container (88b8664e4df5)
docker logs -f 39189b9eb3d7 # Print the logs of a container (39189b9eb3d7)

# Show the stats of all containers (Name, CPU%, MEM%)
docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"
docker stats --no-stream
docker stats # Like HTOP but for docker containers


## Docker run commands
docker run hello-world # Run a container (print hello world)
docker image pull alpine # Pull a container image (alpine linux distribution image lightweight)


## Docker pull commands
docker pull busybox # Pull a container image (busybox)
docker pull -a busybox # Pull all versions of a container image (busybox)
docker pull busybox:1.31.1 # Pull a specific version of a container image (busybox)


## Docker build commands (build a container image)
docker run busybox echo "Hello World!" # Run a container (busybox) and print "Hello World!"


## Docker run commands
docker container run hello-world # Run a container (hello-world)

docker container run --rm -it busybox:1.31.1 /bin/sh # Run a container (busybox) and start an interactive shell in the container (sh shell) and remove the container after exiting the shell

docker container run alpine ls -l # Run a container (alpine) and print the directory listing of the root directory
docker container run alpine echo "hello from alpine" # Run a container (alpine) and print "hello from alpine"
docker container run -it alpine /bin/sh # Run a container (alpine) and start an interactive shell in the container (sh shell)
docker container run -it alpine /bin/ash # Run a container (alpine) and start an interactive shell in the container (ash shell)
docker run -it busybox:1.31.1 /bin/sh # Run a container (busybox) and start an interactive shell in the container (sh shell)


## Docker start commands
docker container start f5cda1627119 # Start a container (f5cda1627119)


## Docker exec commands
docker container exec f5cda1627119 ls # Run a command (ls) in a running container (f5cda1627119)


## Docker attach commands
docker attach ebc24fccdd16 # Attach to a running container (ebc24fccdd16)


## Docker start, stop, restart, pause & unpause commands
docker stop 92e963a87fa2 # Stop a container (92e963a87fa2)
docker start 92e963a87fa2 # Start a container (92e963a87fa2)
docker restart 92e963a87fa2 # Restart a container (92e963a87fa2)
docker pause 92e963a87fa2 # Pause a container (92e963a87fa2)
docker unpause 92e963a87fa2 # Unpause a container (92e963a87fa2)


## Docker rm commands
docker rm $(docker ps -aq --no-trunc) # Remove all containers not running


## Docker search commands
docker search centos # Search for a container image (centos)


## Docker history commands
docker history apache2helloworld:latest # Show the history of a container image (apache2helloworld:latest)


## Delete image commands
docker rmi bd9cd091f6e9 # Remove a container image (bd9cd091f6e9)
docker image rm $(docker image ls -q ubuntu) # Remove all images (ubuntu) not running


## Network commands
docker network ls # List all networks
docker network inspect bridge # Inspect a network (bridge) and show info about it
docker inspect --format='{{.NetworkSettings.IPAddress}}' 9f40ad1ace9f # Show the IP address of a container
docker inspect --format='{{.NetworkSettings.Ports}}' 9f40ad1ace9f # Show the ports of a container
docker network create --driver bridge my-bridge-network # Create a network (my-bridge-network) with the bridge driver


# Default networks 
# (bridge, host, none) 
# (bridge is the default network) 
# (host is the host network) 
# (none is no network)f


# Testing ground :)
dokcer pull ubuntu:latest
docker container run -it ubuntu:latest ls # Run command on new container. [stop]
docker container run -it ubuntu:latest /bin/bash # Start container and go into the container. [stop]
docker container run -d ubuntu:latest tail -f /dev/null # Start container and keep it running. [running]
docker container -it exec ddf45e66f531 /bin/bash # Go into a running container. [running]


docker run -it ubuntu /bin/bash # Start container and go into the container. [stop]
docker run -d ubuntu tail -f /dev/null


docker stop $(docker ps -q) # Stop all containers

docker rmi -f $(docker images | grep busybox | awk '{print $3}') # Remove all images with the name busybox (force)