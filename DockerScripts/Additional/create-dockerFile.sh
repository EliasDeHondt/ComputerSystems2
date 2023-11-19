#!/bin/bash
######################
# Van Elias De Hondt #
######################


####################################################################################################
#################################### W8P2_Dockerfile_HelloWorld ####################################
####################################################################################################

# Build a container image (busyboxhelloworld) from a Dockerfile (W8P2_Dockerfile_HelloWorld)
docker build . -f W8P2_Dockerfile_HelloWorld -t busyboxhelloworld

# List all images
sudo docker images

# Tag a container image (busyboxhelloworld) with a version (1.35)
docker tag 43b1819f60fb busyboxhelloworld:1.35

## Of

# Build a container image (busyboxhelloworld) from a Dockerfile (W8P2_Dockerfile_HelloWorld) and tag it with a version (1.35)
sudo docker build -t busyboxhelloworld:1.35 . -f W8P2_Dockerfile_HelloWorld
####################################################################################################



####################################################################################################
##################################### W8P2_Dockerfile_Starwars #####################################
####################################################################################################

# Build a container image (starwars) from a Dockerfile (W8P2_Dockerfile_Starwars)
docker build . -f W8P2_Dockerfile_Starwars -t starwars

# Run the container image (starwars) in interactive mode (-it) and remove the container after it has been stopped (--rm)
docker run -it --rm starwars
####################################################################################################



####################################################################################################
##################################### W8P2_Dockerfile_Apache2 ######################################
####################################################################################################

# Build a container image (apache2helloworld) from a Dockerfile (W8P2_Dockerfile_Apache2)
docker build . -f W8P2_Dockerfile_Apache2 -t apache2helloworld

# Run the container image (apache2helloworld) in detached mode (-d), 
# map port 8080 of the host to port 80 of the container (-p 8080:80), 
# remove the container after it has been stopped (--rm) and name the container (WebServerInstance1)
docker run -d -p 8080:80 --rm --name WebServerInstance1 apache2helloworld:latest
####################################################################################################