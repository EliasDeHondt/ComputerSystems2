#!/bin/bash
######################
# Van Elias De Hondt #
######################

####################################################################################################
##################################### New image -> ubuntu_wget #####################################
####################################################################################################

## Make docker image
docker run -i -t ubuntu:18.04 /bin/bash # Run a container (ubuntu:18.04) and start an interactive shell in the container (bash shell)

apt-get update # Update the package list
apt-get install -y wget # Install wget
which wget # Print the location of wget
exit # Exit the container

docker diff 381d9e775c64 # List all changes made to a container (381d9e775c64)
docker stop 381d9e775c64 # Stop a container (381d9e775c64)
docker commit 381d9e775c64 ubuntu_wget # Create a new image (ubuntu_wget) from a container (381d9e775c64)
docker images ubuntu_wget # List all images (grep for ubuntu_wget)
####################################################################################################


####################################################################################################
############################# New image -> ubuntu_figlet_hello_eliasdh #############################
####################################################################################################

## Make docker image
docker run -i -t ubuntu:18.04 /bin/bash # Run a container (ubuntu:18.04) and start an interactive shell in the container (bash shell)

apt-get update # Update the package list
apt-get install -y figlet # Install figlet
figlet "Test Figlet" # Print "Test Figlet"
exit # Exit the container

docker container diff d803936aa023 # List all changes made to a container (d803936aa023)
docker stop d803936aa023 # Stop a container (d803936aa023)
docker commit d803936aa023 ubuntu_figlet_hello_eliasdh # Create a new image (ubuntu_figlet_hello_eliasdh) from a container (d803936aa023)
# docker image tag 81e9c0bdded0 figlet_hello_eliasdh
docker images ubuntu_figlet_hello_eliasdh # List all images (grep for ubuntu_figlet_hello_eliasdh)

## Run docker image
docker container run ubuntu_figlet_hello_eliasdh figlet "Hello EliasDH"
####################################################################################################


####################################################################################################
################################### New image -> ubuntu_apache2 ####################################
####################################################################################################

## Make docker image
docker run -i -t ubuntu:18.04 /bin/bash # Run a container (ubuntu:18.04) and start an interactive shell in the container (bash shell)

apt-get -yqq update # Update the package list
apt-get -y install apache2 # Install apache2
exit # Exit the container

docker commit -m "Apache2 server test" -a "Elias De Hondt" 57362badc07f ubuntu_apache2 # Create a new image (ubuntu_apache2) from a container (57362badc07f)
docker images ubuntu_apache2 # List all images (grep for ubuntu_apache2)
docker inspect ubuntu_apache2 # Inspect the ubuntu_apache2 image

## Run docker image
docker container run -ti ubuntu_apache2 /bin/bash # Run a container (ubuntu_apache2) and start an interactive shell in the container (bash shell)
####################################################################################################