![logo](/Images/logo.png)
# 💙🤍Labs W8P2🤍💙

This file contains all related information regarding the lab of the week in question.

---

## 📘Table of Contents

1. [Introduction](#introduction)
2. [Labs](#labs)
    - [🔎Lab 1: Docker-DockerFile-LAB1-A-SimpleHelloWorld.pdf](#lab-1-docker-dockerfile-lab1-a-simplehelloworldpdf)
    - [🔎Lab 2: Docker-DockerFile-LAB1-B-Starwars.pdf](#lab-2-docker-dockerfile-lab1-b-starwarspdf)
    - [🔎Lab 3: Docker-DockerFile-LAB2-A-Layering-UFS.pdf](#lab-3-docker-dockerfile-lab2-a-layering-ufspdf)
    - [🔎Lab 4: Docker-DockerFile-LAB2-B-Layering.pdf](#lab-4-docker-dockerfile-lab2-b-layeringpdf)
    - [🔎Lab 5: Docker-DockerFile-LAB3-AdvancedDockerfile.pdf](#lab-5-docker-dockerfile-lab3-advanceddockerfilepdf)
    - [🔎Lab 6: Docker-DockerFile-LAB4-DIY.pdf](#lab-6-docker-dockerfile-lab4-diypdf)
    - [🔎Lab 7: Docker-DockerFile-LAB5-AdvancedDockerfile.pdf](#lab-7-docker-dockerfile-lab5-advanceddockerfilepdf)
    - [🔎Lab 8: Docker-DockerFile-LAB6-UserDockerfile.pdf](#lab-8-docker-dockerfile-lab6-userdockerfilepdf)
    - [🔎Lab 9: Docker-DockerFile-LAB7-EntrypointDockerfile.pdf](#lab-9-docker-dockerfile-lab7-entrypointdockerfilepdf)
    - [🔎Lab 10: Docker-DockerFile-LAB8-Persistence.pdf](#lab-10-docker-dockerfile-lab8-persistencepdf)
3. [Links](#links)

---

## 🖖Introduction

This file contains all related information regarding the lab of the week in question. All commands used are mentioned, but the output is not always shown. Note that the output of commands can be different on your machine.
Subject: **Dockerfile**

## 🔬Labs

### 🔎Lab 1: Docker-DockerFile-LAB1-A-SimpleHelloWorld.pdf

Create a file called dockerfile insert the following instructions (Explain what it does):
```dockerfile
######################
# Van Elias De Hondt #
######################

# Use the latest busybox image as base image
FROM busybox:latest

# Execute the echo command when the container starts
CMD echo Hello World!!
```

Build the image:
```bash
docker build -t hello-world .
```

List the images:
```bash
docker images
# or
docker image ls
```

Run the image:
```bash
docker run --rm hello-world
```

Tag the image:
```bash
docker tag <image-id> hello-world:1.0
```
> **Note**: You can find the image-id by running `docker images` or `docker image ls`

### 🔎Lab 2: Docker-DockerFile-LAB1-B-Starwars.pdf

Put this Dockerfile in a directory called starwars:

```dockerfile
######################
# Van Elias De Hondt #
######################


# Use the latest version of ubuntu as the base image
FROM ubuntu:latest

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a container that telnet to the Star Wars server." \
      version="1.0"

# Install telnet
RUN apt-get update && apt-get -y install telnet

# Set the command to telnet to the Star Wars server when the container starts
CMD ["/usr/bin/telnet", "freechess.org", "23"]
```

Build the image:
```bash
docker build -t starwars .
```

Run the image:
```bash
docker run -it --rm starwars
```

### 🔎Lab 3: Docker-DockerFile-LAB2-A-Layering-UFS.pdf

- You will build your own file-system and use the union feature.
- This will help you understand how images are build.
- Check the man page of `mount` and search for `overlay`.
- Which extra directories do you need to specify when mounting a filesystem as an `overlay` type?
- Which directory can be read-only?

> Answers:
> - Lowerdir: This directory contains the read-only lower layers of the filesystem.
> - Upperdir: This directory holds the changes or modifications made to the lower layers, typically in a writable form.
> - Workdir: This directory is used internally by the overlay filesystem for managing changes and is necessary for its functioning. It is not meant to be directly manipulated or accessed.

Create a directory called “test-overlay”.
```bash
elias@ubuntu:/$ sudo mkdir test-overlay
elias@ubuntu:/$ cd test-overlay
```

In this directory you create these 3 directories: base, diff, merged and workdir.
```bash
elias@ubuntu:/test-overlay$ sudo mkdir base diff merged workdir
```

Create one file in the base directory: startfile1. Put some content inside the file.
```bash
elias@ubuntu:/test-overlay$ sudo bash -c 'echo "TEST 123" >> startfile1'
```

Create one dir in the base directory: startdir with a file inside (startfile2). Put some content inside the file.
```bash
elias@ubuntu:/test-overlay$ sudo mkdir startdir
elias@ubuntu:/test-overlay$ cd startdir
elias@ubuntu:/test-overlay/startdir$ sudo bash -c 'echo "TEST 321" >> startfile2'
```

Check your structure with the `ls -lR` command.
```bash
elias@ubuntu:/test-overlay/startdir$ cd ..
elias@ubuntu:/test-overlay$ ls -lR
```

You then give this command to start your union filesystem:
```bash
sudo mount -t overlay -o lowerdir=base,upperdir=diff,workdir=workdir overlay merged
```

Recheck your structure (ls -lR) with your useraccount. What is different?
```bash
elias@ubuntu:/test-overlay$ ls -lR
```

> Answer: The `merged` directory is now filled with the contents of the base directory.

---

UFS and DIRS
Create the following structure the 3 directories diff, workdir and merged and…
```bash
sudo mkdir -p diff workdir merged
cd diff
sudo mkdir -p base1 base2 base3
cd base1
sudo mkdir -p homework1 homework2
cd ../base2
sudo mkdir -p homework1 homework3
cd ../base3
sudo mkdir -p homework2 homework3

sudo bash -c 'echo "1.1.1" >> base1/homework1/student1'
sudo bash -c 'echo "1.2.2" >> base1/homework2/student2'
sudo bash -c 'echo "2.1.3" >> base2/homework1/student3'
sudo bash -c 'echo "2.3.4" >> base2/homework3/student4'
sudo bash -c 'echo "3.2.3" >> base3/homework2/student3'
sudo bash -c 'echo "3.3.4" >> base3/homework3/student4'
```

Now mount the overlay filesystem:
```bash
sudo mount -t overlay -o lowerdir=base1:base2:base3,upperdir=diff,workdir=workdir overlay merged
```

> Answer:
> - What do you see?
>    - You see the merged directory with the contents of the base directories.
> - What do you specifically see in the homework3 folder?
>    - There is only 1 file present.
> - Unmount the union file system.
>    - `sudo umount merged`
> - Now remount with this command:
>    - `sudo mount -t overlay -o lowerdir=base1:base3:base2,upperdir=diff,workdir=workdir overlay merged`


### 🔎Lab 4: Docker-DockerFile-LAB2-B-Layering.pdf

Create a file called dockerfile insert the following instructions:
```dockerfile
######################
# Van Elias De Hondt #
######################

FROM ubuntu:14.04

LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a apache2 webserver." \
      version="1.0"

RUN apt-get update && apt-get install -y apache2 && apt-get clean
```

Build the image:
```bash
docker build -t apache2 .
```

- Execute the `docker info` command. Where do you see the used storage driver?
    - `Storage Driver: overlay2`
- What is it?
    - OverlayFS (overlay2) is a modern union filesystem that allows layers to be stacked on top of each other, enabling efficient storage and sharing of filesystem layers between Docker images. This driver is widely used and is known for its performance and storage optimization capabilities within Docker environments.

Execute the `docker history` command with the container you just created. Note that several layer have been created.
```bash
docker history apache2
```

Use the `docker inspect` command to see the full information on your container. Use grep with the image (layer) ID you found in most recent line of the `docker history` command. Do you see that the layers are present?
```bash
docker inspect apache2 | grep <image-id>
```
> **Note**: <image-id> is the image id you found in the most recent line of the `docker history` command.

When you run your container it will use the union filesystem to combine the contents of the lower layers and 
to present a merged filesystem to the user.
Use the `docker inspect` command on your container to see the directories, which are called:

- LowerDir = base layers used for your container
- UpperDir = the RW layer that will be used when the container runs
- MergedDir = the layer that is presented as an overlay view to the user = shows the combination of all layers
- WorkDir = a directory that is used internally by docker for transport of file information between layers

```bash
docker inspect apache2 | grep -E 'LowerDir|UpperDir|MergedDir|WorkDir'
```

What is different about the `LowerDir`? Why this difference?
> Answer: The `LowerDir` represents the lower layer of the overlay filesystem. It contains the read-only layers of the image, where the actual file content from the image layers resides.

Check how many containers are running on your system and note this as number A.
```bash
docker ps
```

Run and note this as number B.
```bash
mount | grep overlay2 | wc -l
```

What’s the link between A and B?
> Answer: If containers are running, they are also mounted in the file system.


### 🔎Lab 5: Docker-DockerFile-LAB3-AdvancedDockerfile.pdf

> **Note**: Create a directory e.g. called `AdvancedDockerfile` and use this to perform the actionsin.

We will use a simple example in this section and build a `hello world` application in Node.js. Do not be concerned if you are not familiar with Node.js: Docker (and this exercise) does not require you to know all these details.

We will start by creating a file in which we retrieve the hostname and display it.

Type the following content into a file named INDEX.JS. You can use vi, vim or several other Linux editors in this exercise. If you need assistance with the Linux editor commands to do this follow this footnote.

```js
var os = require("os");
var hostname = os.hostname();
console.log("hello from " + hostname);
```

The file we just created is the javascript code for our server. As you can probably guess, Node.js will simply print out a “hello” message. We will Docker-ize this application by creating a Dockerfile. We will use alpine as the base OS image, add a Node.js runtime and then copy our source code in to the container. We will also specify the default command to be run upon container creation.

Create a file named DOCKERFILE and copy the following content into it. Again, help creating this file with Linux editors is here.
```dockerfile
######################
# Van Elias De Hondt #
######################

FROM alpine:latest

LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a nodejs script that prints the hostname of the container." \
      version="1.0"

RUN apk update && apk add nodejs

COPY . /app/

WORKDIR /app

CMD ["node", "index.js"]
```

Let’s build our first image out of this Dockerfile and name it `hello:0.1`
```bash
docker build -t hello:0.1 .
```

We then start a container to check that our applications runs correctly:
```bash
docker container run --rm hello:0.1
# or
docker run hello
```

### 🔎Lab 6: Docker-DockerFile-LAB4-DIY.pdf

Create Dockerfiles that test the following commands (seen in theory) You can use whatever base image you want…
```dockerfile
######################
# Van Elias De Hondt #
######################

# Defining the application structure
# notes/
# │
# ├── Dockerfile
# ├── notes.txt
# └── README.md

# COPY: It is mainly used to copy files from the host to the image.
# It is simple and straightforward in its functionality: it copies files from the host to the container.

# ADD: Performs the same task as COPY (copying files from the host to the container),
# but has additional functionality. It can also handle URLs and download files from a URL,
# in addition, it can automatically extract tar archives to the target location in the container.


# Use the Alpine image as the base image
FROM alpine:latest

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a container that prints the contents of a notes.txt file." \
      version="1.0"

# Define an environment variable for the note file location
ENV NOTES_FILE_PATH=/notes/notes.txt

# Set working directory to /notes
WORKDIR /notes

# Copy the notes file to the container
ADD W8P2_Notes_TestDIY.txt $NOTES_FILE_PATH

# Add an entrypoint script
COPY W8P2_entrypoint_TestDIY.sh /notes/entrypoint.sh
RUN chmod +x /notes/entrypoint.sh

# Define the entrypoint script as the default startup command
ENTRYPOINT ["/notes/entrypoint.sh"]
```

Build the image:
```bash
docker container build -t notes .
# or
docker build -t notes .
```

Run the image:
```bash
docker container run --rm notes
# or
docker run --rm notes
```

### 🔎Lab 7: Docker-DockerFile-LAB5-AdvancedDockerfile.pdf

We are going to create a static web-server.
```dockerfile
######################
# Van Elias De Hondt #
######################

# Use the 22.04 version of ubuntu as the base image
FROM ubuntu:22.04

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a apache2 webserver." \
      version="1.0"

# Update the package list and install apache2 in one command
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# New customized index.html file :)
RUN echo "<!DOCTYPE html><html><head><title>Hello World Page</title><style>body {font-family: Arial, sans-serif;background-color: #f0f0f0;text-align: center;margin-top: 50px;}.container {width: 50%;margin: 0 auto;background-color: #fff;padding: 20px;border-radius: 10px;box-shadow: 0 0 10px rgba(0,0,0,0.1);}h1 {color: #333;}</style></head><body><div class=\"container\"><h1>Hello World!</h1><p>Welcome to my cool web page!</p><p>Design by Elias De Hondt.</p></div></body></html>" > /var/www/html/index.html

# Configureer Apache logging
RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

# Expose port 80
EXPOSE 80

# Start Apache service
CMD ["apache2ctl", "-D", "FOREGROUND"]
```

Build the image:
```bash
docker container build -t apache2 .
# or
docker build -t apache2 .
```

Run the image:
```bash
docker container run --rm apache2
# or
docker run --rm apache2
```

### 🔎Lab 8: Docker-DockerFile-LAB6-UserDockerfile.pdf

We are going to run a command as a specific user.
```dockerfile
######################
# Van Elias De Hondt #
######################

# Use the 22.04 version of ubuntu as the base image
FROM ubuntu:22.04

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This Dockerfile will print a username." \
      version="1.0"

# Define a user dynamically
RUN echo "Hello from user $(whoami)" > /message.txt

# Command to display the message
CMD cat /message.txt
```

Build the image:
```bash
docker container build -t usernameprint .
# or
docker build -t usernameprint .
```

Run the image:
```bash
docker container run --rm usernameprint
# or
docker run --rm usernameprint
```

### 🔎Lab 9: Docker-DockerFile-LAB7-EntrypointDockerfile.pdf


We will use ENTRYPOINT to change the default shell into another command
```dockerfile
######################
# Van Elias De Hondt #
######################

# Use the latest version of ubuntu as the base image
FROM busybox:latest

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This Dockerfile will test ENTRYPOINT." \
      version="1.0"


# Change the entrypoint to the echo command to display HELLO
ENTRYPOINT ["echo", "HELLO"]

# Use CMD to show WORLD
CMD ["WORLD"]
```

Build the image:
```bash
docker container build -t entrypoint .
# or
docker build -t entrypoint .
```

Run the image:
```bash
docker container run --rm entrypoint
# or
docker run --rm entrypoint
```

### 🔎Lab 10: Docker-DockerFile-LAB8-Persistence.pdf

We will prove that without caution, docker images give a lot of information.
```dockerfile
######################
# Van Elias De Hondt #
######################

# Use the latest version of ubuntu as the base image
FROM alpine:latest

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This Dockerfile will test PERSISTENCE." \
      version="1.0"

# Set environment variables
ENV password="password"
ENV user="admin"
```

Build the image:
```bash
docker container build -t persistence1 .
# or
docker build -t persistence1 .
```

Run the image:
```bash
docker container run --rm persistence1
# or
docker run --rm persistence1
```

```dockerfile
######################
# Van Elias De Hondt #
######################

# Use the previously created persistence1 image as the base image
FROM persistence1

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This Dockerfile will test PERSISTENCE." \
      version="1.0"

# Use CMD to display the contents of the environment variables
CMD echo "Password is: $password" && echo "User is: $user"
```

Build the image:
```bash
docker container build -t persistence2 .
# or
docker build -t persistence2 .
```

## 🔗Links
- 👯 Web hosting company [EliasDH.com](https://eliasdh.com).
- 📫 How to reach us eliasdehondt@outlook.com.