![logo](/Images/logo.png)
# 💙🤍Labs W9P2🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)
2. [🖖Introduction](#🖖introduction)
3. [🔬Labs](#🔬labs)
    1. [🔎Lab 1: Docker-DockerFile-LAB1-A-SimpleHelloWorld.pdf](#🔎lab-1-docker-dockerfile-lab1-a-simplehelloworldpdf)
    2. [🔎Lab 2: Docker-DockerFile-LAB1-B-Starwars.pdf](#🔎lab-2-docker-dockerfile-lab1-b-starwarspdf)
    3. [🔎Lab 3: Docker-DockerFile-LAB2-A-Layering-UFS.pdf](#🔎lab-3-docker-dockerfile-lab2-a-layering-ufspdf)
    4. [🔎Lab 4: Docker-DockerFile-LAB2-B-Layering.pdf](#🔎lab-4-docker-dockerfile-lab2-b-layeringpdf)
    5. [🔎Lab 5: Docker-DockerFile-LAB3-AdvancedDockerfile.pdf](#🔎lab-5-docker-dockerfile-lab3-advanceddockerfilepdf)
    6. [🔎Lab 6: Docker-DockerFile-LAB4-DIY.pdf](#🔎lab-6-docker-dockerfile-lab4-diypdf)
    7. [🔎Lab 7: Docker-DockerFile-LAB5-AdvancedDockerfile.pdf](#🔎lab-7-docker-dockerfile-lab5-advanceddockerfilepdf)
    8. [🔎Lab 8: Docker-DockerFile-LAB6-UserDockerfile.pdf](#🔎lab-8-docker-dockerfile-lab6-userdockerfilepdf)
    9. [🔎Lab 9: Docker-DockerFile-LAB7-EntrypointDockerfile.pdf](#🔎lab-9-docker-dockerfile-lab7-entrypointdockerfilepdf)
    10. [🔎Lab 10: Docker-DockerFile-LAB8-Persistence.pdf](#🔎lab-10-docker-dockerfile-lab8-persistencepd)
4. [🔗Links](#🔗links)

---

## 🖖Introduction

This file contains all related information regarding the lab of the week in question. All commands used are mentioned, but the output is not always shown. Note that the output of commands can be different on your machine.
Subject: **Publishing & Volumes**

## 🔬Labs

### 🔎Lab 1: Docker-Publishing-LAB1-Docker-Hub-Quickstart.pdf

Start by creating a Dockerfile to specify your application as shown below. (Best to use a new directory for this)
    
```dockerfile
FROM busybox
CMD echo "Hello world! This is my first Docker image."
```

1. Run docker build -t <your_username>/my-first-repo . to build your Docker image.
```Bash
docker build -t eliasdh/my-first-repo .
```
2. Test your docker image locally by running docker run <your_username>/my-first-repo.
```Bash
docker container run --rm eliasdh/my-first-repo
```
3. Run docker push <your_username>/my-first-repo to push your Docker image to Docker Hub.
```Bash
docker container push eliasdh/my-first-repo
```

### 🔎Lab 2: Docker-Publishing-LAB2-Local-Registry.pdf

Instead of Docker Hub you can also create a local Registry. Fortunately, there is a Container for this! The registry runs on port `5000` by default.

The following run command downloads the Docker Registry image:
    
```Bash
docker run -d -p 5001:5000 --restart=always --name registry registry:2
```
- `-d` runs the container in the background.
- `-p` maps port 5000 of the container to port 5001 on the host.
- `--restart=always` restarts the container if it crashes.
- `--name` gives the container a name.

1. Get an Image from the Docker Hub Registry.
```Bash
docker pull hello-world
```

2. This image is now locally on your disk. Tag the Image with your own registry location and name.
```Bash
docker tag hello-world localhost:5001/helloworld
```

3. Place the Image on your own Docker registry.
```Bash
docker push localhost:5001/helloworld
```

Check the registry catalog to see which images are available locally. For this you need the curl program `sudo apt-get install curl`.
```Bash
curl http://localhost:5001/v2/_catalog
```

Extra assignment:
1. Create a Dockerfile that uses Ubuntu as a base and additionally the `Python3` package installs.
```Dockerfile
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y && apt-get clean

RUN apt-get install -y python3
```
2. Tag this image with your own registry location and name.
```Bash
docker build . -t ubuntupython3
docker tag ubuntupython3 localhost:5001/ubuntupython3
docker push localhost:5001/ubuntupython3
```
3. Check whether the image is in your repository.
```Bash
curl http://localhost:5001/v2/_catalog
```
4. Delete the image on your disk.
```Bash
docker rmi ubuntupython3
docker rmi localhost:5001/ubuntupython3
```
5. Check if the image is still in your repository.
```Bash
curl http://localhost:5001/v2/_catalog
```

### 🔎Lab 3: Docker-Publishing-LAB3-Docker-Hub-Organization.pdf

Create a new organization on Docker Hub and add your collegues to it.

- Test this out with your collegues.
- Build a correctly tagged image (= same name as you will use on the dockerhub):
```Bash
docker build -t kdgstudents/test:1.0 . -f dockerfile
```
- Push the image to the dockerhub:
```Bash
docker push kdgstudents/test:1.0
```

### 🔎Lab 4: Docker-Volumes-LAB1-Relation-Volumes-And-Host-.pdf

We will create a data volume through a Dockerfile. Here’s the Dockerfile:    
```Dockerfile
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Base image (Ubuntu 14.04)
FROM ubuntu:14.04
# Create a volume mount point (MountPointDemo)
VOLUME /MountPointDemo
# Start a shell when container starts (bash)
CMD /bin/bash
```

Build the image:
```Bash
docker build -t mount-point-demo .
```

Inspect the image for the volume mount point:
```Bash
docker inspect mount-point-demo | grep "MountPointDemo"
```

Run the container:
```Bash
docker run -it mount-point-demo
```

Check the presence from the data-volume:
```Bash
ls -ld /MountPointDemo
```
> **Note**: We know that this container’s directory is in fact a mounted disk.

We can check this via:
```Bash
df -h | grep "/MountPointDemo"
```

---

Either stop the running container or open a second console. Execute the following command:
```Bash
docker inspect 98ee99ad6c2a
# docker inspect <container_id> 
```
- Do you see where the /MountPointDemo is point to on the docker host?

Remove the container.
```Bash
docker rm 98ee99ad6c2a
# docker rm <container_id>
```

Remove the image.
```Bash
docker rmi -f mount-point-demo
# docker rmi -f <image_id>
```

Remove the data volume.
```Bash
docker volume rm 28dbbb07daedb3f5a9dd1201c3fbd3927de45923e3a33c76a0a7ca86d08e203b
# docker volume rm <volume_name>
```

### 🔎Lab 5: Docker-Volumes-LAB2-Share-Volume-With-Host.pdf

First, let's launch an interactive container with the `–v` option of the `docker run` subcommand to mount `/tmp/hostdir` of the Docker host directory to `/MountPoint` of the container:
```Bash
docker run -v /tmp/hostdir:/MountPoint -it ubuntu:14.04
```
If `/tmp/hostdir` is not found on the Docker host, the Docker engine will create the directory itself. However, the problem is that the system-generated directory cannot be deleted using the `-v` option of the `docker rm` subcommand.

---

Having successfully launched the container, we can check the presence of `/MountPoint` using the ls command:
```Bash
ls -ld /MountPoint
```

---

Now, we can proceed to checking the mount details using the mount command:
```Bash
mount | grep "/MountPoint"
```

---

Here, we are going to validate `/MountPoint`, change to the `/MountPoint` directory using the `cd` command, create a few files using the `touch` command, and list the files using the `ls` command, as shown in the following script:
```Bash
cd /MountPoint
touch file1 file2 file3
ls -l
```

---

Verify the files in the `/tmp/hostdir` Docker host directory using the `ls` command on a new terminal, as our container is running in an interactive mode on the existing terminal:
```Bash
ls -l /tmp/hostdir
```

---

Finally, let's run the docker inspect subcommand with the container ID `32018811742d` as an argument to see whether the directory mapping is set up between the Docker host and the container mount point, as shown in the following command:
> **Note**: The container ID is different for each container. You can get the container ID using the `docker ps` subcommand.
```Bash
docker inspect --format='{{range .Mounts}}{{.Source}} -> {{.Destination}}{{"\n"}}{{end}}' 32018811742d
```

Apparently, in the preceding output of the docker inspect subcommand, the `/tmp/hostdir` directory of the Docker host is mounted on the `/MountPoint` mount point of the container

### 🔎Lab 6: Docker-Volumes-LAB3-Share-File-With-Host.pdf

In order to mount a file from the Docker host to the container, the file must preexist in the Docker host. Otherwise, the Docker engine will create a new directory with the specified name, and mount it as a directory. We can start by creating a file on the Docker host using the touch command:
```Bash
touch /tmp/hostfile.txt
```

---

Launch an interactive container with the `–v` option of the docker run subcommand to mount the `/tmp/hostfile.txt` Docker host file to the container as `/tmp/mntfile.txt`:
```Bash
docker run -v /tmp/hostfile.txt:/tmp/mntfile.txt -it ubuntu:14.04
```

---

Having successfully launched the container, now let's check the presence of `/tmp/mntfile.txt` using the ls command:
```Bash
ls -l /tmp/mntfile.txt
```

---

Then, proceed to check the mount details using the mount command:
```Bash
mount | grep "/tmp/mntfile.txt"
```

---

Then, update some text to `/tmp/mntfile.txt` using the echo command:
```Bash
echo "Hello World" > /tmp/mntfile.txt
```

Meanwhile, switch to a different terminal in the Docker host, and print the `/tmp/hostfile.txt` Docker host file using the cat command:
```Bash
cat /tmp/hostfile.txt
```

---

Finally, run the docker inspect subcommand with the container ID `8a40061d7455` as it's argument to see the file mapping between the Docker host and the container mount point:
```Bash
docker inspect --format='{{range .Mounts}}{{.Source}} -> {{.Destination}}{{"\n"}}{{end}}' 8a40061d7455
```

From the preceding output, it is evident that the `/tmp/hostfile.txt` file from the Docker host is mounted as `/mountedfile.txt` inside the container


### 🔎Lab 7: Docker-Volumes-LAB4-WebServer-Logfiles-On-Host.pdf

If you run a detached webserver within a container, there’s no easy way to reach the `files/logfiles` on this webserver. We can decide to share the location of the `files/logfiles` between the host and the container to make this possible. This way we can check on the host what’s happening within the container.

Here are the steps:
```Dockerfile
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Base image is Ubuntu
FROM ubuntu:14.04

# Author: Elias De Hont
MAINTAINER Elias elias.dehondt@student.kdg.be

# Install apache2 package
RUN apt-get update && apt-get install -y apache2 && apt-get clean

# Set the log directory PATH
ENV APACHE_LOG_DIR /var/log/apache2

# Launch apache2 server in the foreground
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
```

---

Build the image:
```Bash
docker build -t apache2demo .
```

---

Let's begin with launching an Apache2 HTTP service container by mounting the `/var/log/myhttpd` directory of the Docker host to the `/var/log/apache2` directory of the container, using the `–v` option of the docker run subcommand.
```Bash
sudo docker run -d -p 8080:80 -v /var/log/myhttpd:/var/log/apache2 apache2demo
```

In the Dockerfile, the `APACHE_LOG_DIR` environment variable is set to the `/var/log/apache2` directory, using the `ENV` instruction. This would make the Apache2 HTTP service route all log messages to the `/var/log/apache2` data volume.

---

Once the container is launched, we can change the directory to `/var/log/myhttpd` on the Docker host:
```Bash
cd /var/log/myhttpd
```

---

Perhaps, a quick check of the files present in the `/var/log/myhttpd` directory is appropriate here:
```Bash
ls -l
```

- `access.log` is the access log file of the Apache2 HTTP service. It contains all the HTTP requests made to the Apache2 HTTP service.
- `error.log` is the error log file of the Apache2 HTTP service. It contains all the error messages generated by the Apache2 HTTP service.
- `other_vhosts_access.log` is the virtual host access log file of the Apache2 HTTP service. It contains all the HTTP requests made to the virtual hosts of the Apache2 HTTP service.

---

We can display the content of all the log files in the `/var/log/myhttpd` directory using the `tail` command with the `–f` option:
```Bash
tail -f *.log
```

The `tail -f` command will run continuously and display the content of the files, as soon as they get updated. Here, both `access.log` and `other_vhosts_access.log` are empty, and there are a few error messages on the `error.log` file. Apparently, these error logs are generated by the HTTP service running inside the container. The logs are then stocked in the Docker host directory, which is mounted during the launch time of the container.

---

Let 's check if it works if we access the webserver from the host `curl http://localhost:8080`:
```Bash
curl http://localhost:8080
```

The HTTP service updates the `access.log` file, which we can manipulate from the host directory mounted through the `–v` option of the docker run subcommand.

### 🔎Lab 8: Docker-Volumes-LAB5-WebServer-And-DataOnlyContainer.pdf

In this example we will run a data-only container which contains the log files that are produced by an apache web server container. This is an example of volume-sharing between containers.
> **Note**: This is an “older” way of doing things. The “modern” approach is to simply create a volume and then use that volume within the containers.

Here’s the Dockerfile with the `/var/log/apache2` data volume using the `VOLUME` instruction. The `/var/log/apache2` data volume is a direct mapping to `APACHE_LOG_DIR`, the environment variable set in the Dockerfile we will use to launch the webserver.
```Dockerfile
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Base image is BusyBox
FROM busybox:latest

# Author: Elias De Hondt
MAINTAINER Elias elias.dehondt@student.kdg.be

# Create a data volume at /var/log/apache2, which is same as the log directory PATH set for the apache image
VOLUME /var/log/apache2

# Execute command true
CMD ["/bin/true"]
```

> **Note**: The `/bin/true` command is a command that does nothing, and always returns a success exit code. This is a good command to use as a default execution command for data-only containers.

---

Build the image:
```Bash
docker build -t apache2log .
```

---

Launch a data-only container from the apache2log image using the docker run subcommand and name the resulting container log_vol, using the `--name` option:
```Bash
docker run --name log_vol apache2log
```
Acting on the preceding command, the container will create a data volume in `/var/log/apache2` and move it to a stop state.

---

Meanwhile, you can run the docker ps subcommand with the `-a` option to verify the container's state:
```Bash
docker ps -a
```
As per the output, the container exits with the exit value 0.

---

Here’s the Dockerfile for the apache2 webserver:
```Dockerfile
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Base image is Ubuntu
FROM ubuntu:14.04

# Author: Elias De Hondt
MAINTAINER Elias elias.dehondt@student.kdg.be

# Install apache2 package
RUN apt-get update && apt-get install -y apache2 && apt-get clean

# Set the log directory PATH
ENV APACHE_LOG_DIR /var/log/apache2

# Launch apache2 server in the foreground
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
```

---

Build the image:
```Bash
docker build -t apache2web .
```

---

Launch the Apache2 HTTP service using the docker run subcommand. Here, we are reusing the apache2 image we created before. In this container, we will mount the `/var/log/apache2` data volume from `log_vol`, the data-only container that we launched in step 3, using the `--volumes-from option`:
```Bash
docker run -d -p 8080:80 --volumes-from log_vol apache2web
```

With the successful launch of the Apache2 HTTP service with the `/var/log/apache2` data volume mounted from `log_vol`, we can access the log files using transient containers.
> **Note**: Transient containers are containers that are launched for a short period of time to perform a specific task, and then exit.

---

Here, we are listing the files stored by the Apache2 HTTP service using a transient container. This transient container is spun off by mounting the `/var/log/apache2` data volume from `log_vol`, and the files in `/var/log/apache2` are listed using the ls command. Further, the `--rm` option of the docker run subcommand is used to remove the container once it is done executing the ls command:
```Bash
docker run --rm --volumes-from log_vol busybox:latest ls -l /var/log/apache2
```
> **Note**: In a nutshell, we create a container very quickly. We mount the volume to it and use a command to look in the volume that is also linked to our other Apache2 container.

---

Finally, the error log produced by the Apache2 HTTP service is accessed using the tail command, as highlighted in the following command:
```Bash
docker run --rm --volumes-from log_vol ubuntu:14.04 tail -f /var/log/apache2/error.log
```

---

The "modern" way to use volumes is in the following example:
```Bash
docker volume create myvolume
docker run -v myvolume:/var/log/apache2 -d -p 8080:80 apache2web
```

## 🔗Links
- 👯 Web hosting company [EliasDH.com](https://eliasdh.com).
- 📫 How to reach us eliasdehondt@outlook.com.