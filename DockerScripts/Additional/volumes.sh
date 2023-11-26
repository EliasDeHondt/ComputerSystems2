#!/bin/bash
######################
# Van Elias De Hondt #
######################


# We will create a data volume through a Dockerfile.
## W9P2_UbuntuVolume.dockerfile

# Create a Dockerfile with the following content:
docker build -t mount-point-demo . -f W9P2_UbuntuVolume.dockerfile

# Inspect the image to see the mount point
docker inspect mount-point-demo

# Run the container
docker run --rm -it mount-point-demo

# Check the presence from the data-volume:
ls -ld /MountPointDemo

# You should see the following output:
mount


# SHARE VOLUME BETWEEN CONTAINER AND HOST

# Create a directory on the host (-v is used to mount a volume) (hostdir is the directory on the host)
docker run -v /tmp/hostdir:/MountPoint -it ubuntu:14.04

# Check the presence from the data-volume:
ls -ld /MountPoint

# You should see the following output:
mount | grep -E "/MountPoint"

# On Container:
cd /MountPoint
touch {a.txt,b.txt,c.txt}
ls -l

# On Host:
cd /tmp/hostdir/
ls -l


# List all mounted volumes between containers and host
docker inspect --format='{{range .Mounts}}{{.Source}} -> {{.Destination}}{{"\n"}}{{end}}' 9308cb63cb98


# SHARE FILE BETWEEN CONTAINER AND HOST

# On Host:
touch /tmp/hostfile.txt

# Run the container
docker run -v /tmp/hostfile.txt:/mountedfile.txt -it ubuntu:14.04

# On Container:
ls -l /mountedfile.txt
mount | grep -E "/mountedfile.txt"
echo "Hello Host Server" > /mountedfile.txt

# On Host:
cat /tmp/hostfile.txt

# List all mounted volumes between containers and host
docker inspect --format='{{range .Mounts}}{{.Source}} -> {{.Destination}}{{"\n"}}{{end}}' 9b9934a128e1


# WEBSERVER LOGFILES ON HOST

# On Host:
docker build . -f W9P2_WebserverLogfilesOnHost.dockerfile -t webserverlogfilesonhost
docker run -d -p 8080:80 -v /var/log/myhttpd:/var/log/apache2  --rm --name W9P2_WebserverLogfilesOnHost webserverlogfilesonhost:latest

cd /var/log/myhttpd
ls -l
cat access.log # All requests to the webserver
cat error.log # All errors from the webserver
cat other_vhosts_access.log # All requests to the webserver from other vhosts
# of
tail -f *.log # Follow all logfiles


# WEBSERVER AND DATA-ONLY CONTAINER

# Create a data-only container
docker build . -f W9P2_DataOnlyContainer_Apache2.dockerfile -t dataonlycontainerapache2
docker run --name DataOnlyContainerApache2 dataonlycontainerapache2:latest

docker build . -f W9P2_WebserverLogfilesOnData-OnlyContainer.dockerfile -t webserverlogfilesondataonlycontainer
docker run -d -p 8080:80 --volumes-from DataOnlyContainerApache2 --rm --name WebserverLogfilesOnDataOnlyContainer webserverlogfilesondataonlycontainer:latest

