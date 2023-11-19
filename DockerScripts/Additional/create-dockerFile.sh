#!/bin/bash
######################
# Van Elias De Hondt #
######################


####################################################################################################
#################################### W8P2_HelloWorld.dockerfile ####################################
####################################################################################################

# Build a container image (busyboxhelloworld) from a Dockerfile (W8P2_HelloWorld.dockerfile)
docker build . -f W8P2_HelloWorld.dockerfile -t busyboxhelloworld

# List all images
sudo docker images

# Tag a container image (busyboxhelloworld) with a version (1.35)
docker tag 43b1819f60fb busyboxhelloworld:1.35

## Of

# Build a container image (busyboxhelloworld) from a Dockerfile (W8P2_Dockerfile_HelloWorld) and tag it with a version (1.35)
sudo docker build -t busyboxhelloworld:1.35 . -f W8P2_Dockerfile_HelloWorld
####################################################################################################



####################################################################################################
##################################### W8P2_Starwars.dockerfile #####################################
####################################################################################################

# Build a container image (starwars) from a Dockerfile (W8P2_Starwars.dockerfile)
docker build . -f W8P2_Starwars.dockerfile -t starwars

# Run the container image (starwars) in interactive mode (-it) and remove the container after it has been stopped (--rm)
docker run -it --rm starwars
####################################################################################################



####################################################################################################
##################################### W8P2_Apache2.dockerfile ######################################
####################################################################################################

# Build a container image (apache2helloworld) from a Dockerfile (W8P2_Apache2.dockerfile)
docker build . -f W8P2_Apache2.dockerfile -t apache2helloworld

# Run the container image (apache2helloworld) in detached mode (-d), 
# map port 8080 of the host to port 80 of the container (-p 8080:80), 
# remove the container after it has been stopped (--rm) and name the container (ApacheWebServerInstance1)
docker run -d -p 8080:80 --rm --name ApacheWebServerInstance1 apache2helloworld:latest
####################################################################################################



####################################################################################################
###################################### W8P2_Nginx.dockerfile #######################################
####################################################################################################

# Build a container image (nginxhelloworld) from a Dockerfile (W8P2_Nginx.dockerfile)
docker build . -f W8P2_Nginx.dockerfile -t nginxhelloworld

# Run the container image (nginxhelloworld) in detached mode (-d),
# map port 7777 of the host to port 80 of the container (-p 7777:80),
# remove the container after it has been stopped (--rm) and name the container (NginxWebServerInstance1)
docker run -d -p 7777:80 --rm --name NginxWebServerInstance1 nginxhelloworld:latest nginx -g "daemon off;"
####################################################################################################



####################################################################################################
################################## W8P2_NodejsHostname.dockerfile ##################################
####################################################################################################

# Build a container image (nodejshostname) from a Dockerfile (W8P2_NodejsHostname.dockerfile)
docker build . -f W8P2_NodejsHostname.dockerfile -t nodejshostname

# Run the container image (nodejshostname) in detached mode (-d),
# remove the container after it has been stopped (--rm) and name the container (NodejsHostname1)
docker run -d --rm --name NodejsHostname1 nodejshostname:latest
####################################################################################################



####################################################################################################
##################################### W8P2_TestDIY.dockerfile ######################################
####################################################################################################

# Build a container image (testdiy) from a Dockerfile (W8P2_TestDIY.dockerfile)
docker build . -f W8P2_TestDIY.dockerfile -t testdiy

# Run the container image (testdiy) and name the container (TestDIY1)
docker run --name TestDIY1 testdiy:latest

docker exec TestDIY1 show                       # Shows all notes
docker exec TestDIY1 add "nieuwe notitie"       # Adds a new note
docker exec TestDIY1 clear                      # Clears all notes
####################################################################################################



####################################################################################################
#################################### W8P2_UserName.dockerfile ######################################
####################################################################################################

# Build a container image (username) from a Dockerfile (W8P2_UserName.dockerfile)
docker build . -f W8P2_UserName.dockerfile -t username

# Run the container image (username) and name the container (UserName1)
docker run --rm --name UserName1 username:latest
####################################################################################################



####################################################################################################
################################### W8P2_Entrypoint.dockerfile #####################################
####################################################################################################

# Build a container image (entrypoint) from a Dockerfile (W8P2_Entrypoint.dockerfile)
docker build . -f W8P2_Entrypoint.dockerfile -t entrypoint

# Run the container image (entrypoint) and name the container (Entrypoint1)
docker run --rm --name Entrypoint1 entrypoint:latest
####################################################################################################



####################################################################################################
################################## W8P2_Persistence1.dockerfile ####################################
####################################################################################################

# Build a container image (persistence1) from a Dockerfile (W8P2_Persistence1.dockerfile)
docker build . -f W8P2_Persistence1.dockerfile -t persistence1

# Run the container image (persistence1) and name the container (Persistence1) 
# in interactive mode (-it) and remove the container after it has been stopped (--rm)
docker run -it --rm --name Persistence persistence1:latest
####################################################################################################



####################################################################################################
################################## W8P2_Persistence2.dockerfile ####################################
####################################################################################################

# Build a container image (persistence2) from a Dockerfile (W8P2_Persistence2.dockerfile)
docker build . -f W8P2_Persistence1.dockerfile -t persistence2

# Run the container image (persistence2) and name the container (Persistence1) 
# in interactive mode (-it) and remove the container after it has been stopped (--rm)
docker run -it --rm --name Persistence persistence2:latest
####################################################################################################