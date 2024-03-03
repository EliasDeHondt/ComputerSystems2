![logo](/Images/logo.png)
# 💙🤍Labs W7P2🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)


---

## 🖖Introduction

This file contains all related information regarding the lab of the week in question. All commands used are mentioned, but the output is not always shown. Note that the output of commands can be different on your machine.
Subject: **Intro Install First Images & Containers**

## 🔬Labs

### 🔎Lab 1: Docker-First-Images-And-Containers-LAB1-SimpleHelloWorld.pdf

1. Download the busybox image

    In this section, we will download a tiny version of Linux called the **busybox** image by using the following command:
        
    ```bash
    docker image pull busybox
    # or
    docker pull busybox
    ```
    > **Note:** If the image is not found locally, it will be downloaded from the Docker Hub.

2. Show the images

    To show the images that are available locally, we can use the following command:

    ```bash
    docker images
    # or
    docker image ls
    ```
    > **Note:** The output of this command should show the busybox image.

3. Run the busybox image (Hello World)

    Now, you can start your first Docker container. It is standard practice to start with the basic Hello World! application. In the following example, we will **echo Hello World!** by using a **busybox** image.

    ```bash
    docker container run busybox echo "Hello World!"
    # or
    docker run busybox echo "Hello World!"
    ```
    > **Note:** If the image is not found locally, it will be downloaded from the Docker Hub.


### 🔎Lab 2: Docker-First-Images-And-Containers-LAB2-Images-And-Containers.pdf

1. Download the alpine image

    In this section, we will download a tiny version of Linux called the **alpine** image by using the following command:
        
    ```bash
    docker image pull alpine
    # or
    docker pull alpine
    ```
    > **Note:** If the image is not found locally, it will be downloaded from the Docker Hub.

2. Show the images

    To show the images that are available locally, we can use the following command:
    
    ```bash
    docker images
    # or
    docker image ls
    ```
    > **Note:** The output of this command should show the alpine image and all the other images that were downloaded in the previous lab.

3. Run the alpine image

    Great! Let’s now run a Docker **container** based on this image. To do that you are going to use the `docker container run` command.

    ```bash
    dokcer container run alpine ls -l
    # or
    docker run alpine ls -l
    ```
    > **Note:** While the output of the ls command may not be all that exciting, behind the scenes quite a few things just took place. When you call run, the Docker client finds the image (alpine in this case), creates the container and then runs a command in that container. When you run docker container run alpine, you provided a command (ls -l), so Docker executed this command inside the container for which you saw the directory listing. After the ls command finished, the container shut down. The fact that the container exited after running our command is important, as you will start to see.

4. Run the alpine image (hello world)

    Let’s try something more exciting. Type in the following:
    
    ```bash
    docker container run alpine echo "Hello from alpine"
    # or
    docker run alpine echo "Hello from alpine"
    ```
    > **Note:** In this case, the Docker client dutifully ran the echo command inside our alpine container and then exited. If you noticed, all of that happened pretty quickly and again our container exited. As you will see in a few more steps, the echo command ran in a separate container instance. Imagine booting up a virtual machine (VM), running a command and then killing it; it would take a minute or two just to boot the VM before running the command. A VM has to emulate a full hardware stack, boot an operating system, and then launch your app - it’s a virtualized HARDWARE environment. Docker containers function at the application layer so they skip most of the steps VMs require and just run what is required for the app. Now you know why they say containers are fast!

5. Run the alpine image (/bin/sh)

    Let’s try something more exciting. Type in the following:
    
    ```bash
    docker container run alpine /bin/sh
    # or
    docker run alpine /bin/sh
    ```
    > **Note:** Wait, nothing happened! Is that a bug? No! In fact, something did happen. You started a 3rd instance of the alpine container and it ran the command /bin/sh and then exited. You did not supply any additional commands to /bin/sh so it just launched the shell, exited the shell, and then stopped the container. What you might have EXPECTED was an interactive shell where you could type some commands. Docker has a facility for that by adding a flag to run the container in an interactive terminal.

    For this example, type the following:
    
    ```bash
    docker container run -it alpine /bin/sh
    # or
    docker run -it alpine /bin/sh
    ```
    > **Note:** You are now inside the container running a Linux shell and you can try out a few commands like `ls -l, uname -a` and others. Note that Alpine is a small Linux OS so several commands might be missing. Exit out of the shell and container by typing the `exit` command.

6. Show the containers

    To show the containers that are available locally, we can use the following command:
    
    ```bash
    docker container ls -a
    # or
    docker ps -a
    ```
    > **Note:** The output of this command should show the alpine container and all the other containers that were created in the previous labs.

7. Test isolation

    In this section, we will test the isolation of containers. To do that you are going to use the `docker container run` command. The following example will create a new container based on the alpine image and will create a file called `hello.txt` with the content `Hello from alpine`. After that, the content of the file will be shown and the container will be stopped. And the last command we will try to list the files in the container.

    ```bash
    docker container run -it alpine /bin/ash
    echo "Hello from alpine" > hello.txt
    cat hello.txt
    exit
    ```
    > **Note:** The output of the `cat hello.txt` command should show the content of the file `hello.txt`.
    
    ```bash
    docker container run -it alpine /bin/ash
    ls
    exit
    ```
    > **Note:** The output of the `ls` command should not show the file `hello.txt`. This is because the container is isolated from the other containers. So in other words we just created a new container.
    
8. Show container ID

    Every object, including containers in Docker, has a unique ID. To show the ID of the last created container, we can use the following command:

    ```bash
    docker container ps -lq
    # or
    docker ps -lq
    ```
    > **Note:** `-l` means the last container that was created. `-q` means only the container ID will be shown.

9. Start a specific container

    To start a specific container, we can use the following command:

    ```bash
    docker container start <container ID>
    # or
    docker start <container ID>
    ```
    > **Note:** `<container ID>` is the ID of the container that you want to start.

10. Exec into a specific container

    To start a specific container, we can use the following command:

    ```bash
    docker container exec -it <container ID> /bin/ash
    # or
    docker exec -it <container ID> /bin/ash
    ```
    > **Note:** `<container ID>` is the ID of the container that you want to start.

### 🔎Lab 3: Docker-First-Images-And-Containers-LAB3-Tag-Interactive-Daemon-Mgmt.pdf

1. Question 1

    Enter the command:
    
    ```bash
    docker pull -a busybox
    ```

    > What does it do extra compared to the normal pull command?
    > - **Adding the `-a` flag ensures that all available versions of the image are pulled.**

2. Question 2

    Enter the command:
    
    ```bash
    docker images
    ```
    
    > What output do you get? Explain the output details.
    > - **The output shows all the images that are available locally.**
    >   - REPOSITORY - The name of the repository.
    >   - TAG - The tag of the image.
    >   - IMAGE ID - The ID of the image.
    >   - CREATED - The date when the image was created.
    >   - SIZE - The size of the image.

3. Question 3

    > How do you run or pull a specific version of an image?
    ```bash
    docker pull <image name>:<tag>
    docker pull ubuntu:18.04
    ```

4. Question 4

    > Can you run busybox so that you have access to the command-line and can enter commands in this new container? And you are running it in an "interactive" way.

    ```bash
    docker container run -it busybox /bin/sh
    ```

5. Question 5

    > What is the hostname of the newly started container?
    ```bash
    docker container ls -l
    # or
    docker ps -l
    ```
    > **Note:** `-l` means the last container that was created.

6. Analyze and assess 1

    Now, let's use one of the nice features of Docker for detaching it from the interactive container and then look at the details that Docker manages for this container. Yes, we can detach it from our container by using the `Ctrl + P` and `Ctrl + Q` escape sequence. This escape sequence will detach the TTY from the container and land us in the Docker host prompt $, however the container will continue to run.

    Run the following command:
    ```bash
    docker ps
    ```
    > **Note:** The output of this command should show the container that was created in the previous question.

7. Analyze and assess 2

    > Let’s re-attach to our container:
    ```bash
    docker attach <container ID>
    ```
    > **Note:** `<container ID>` is the ID of the container that you want to start.

8. Question 6

    > What is the difference between the `docker attach` and `docker exec` commands?
    > - **`docker attach` attaches to the container and `docker exec` executes a command in the container. `docker attach` will attach to the container and will show the output of the container. `docker exec` will execute a command in the container and will show the output of the command.**

9. Analyze and assess 3

    > Go into the home directory and create a couple of files or directories.
    ```bash
    cd /home
    touch test.txt
    ```

    Execute the following command:
    ```bash
    docker diff <container ID>
    ```
    > **Note:** `<container ID>` is the ID of the container that you want to start. The output of this command should show the changes that were made in the container.

10. Question 7

    Run the following command:
    ```bash
    docker run -d ubuntu /bin/bash -c "while true; do date; sleep 5; done"
    ```

    > What does this command do?
    > - **This command will run a container in the background that will show the date every 5 seconds.**

    You can check the output of the container by using the following command:
    ```bash
    docker logs <container ID>
    ```
    > **Note:** `<container ID>` is the ID of the container that you want to start.

11. Question 8

    Opening the first console a interactive container:
    ```bash
    docker run -it ubuntu /bin/bash
    ```

    And in de second console:
    ```bash
    docker stop <container ID>
    ```
    > **Note:** `<container ID>` is the ID of the container that you want to start.

    > What happens?
    > - **The container stopped working in the first console.**

    Verify this by using the following command:
    ```bash
    docker ps -a
    ```

12. Question 9

    > Restart the stopped container:
    ```bash
    docker start <container ID>
    ```
    > **Note:** `<container ID>` is the ID of the container that you want to start.

13. Analyze and assess 4

    - `start` - Start one or more stopped containers
    - `stop` - Stop one or more running containers
    - `restart` - Restart one or more containers
    - `pause` - Pause all processes within one or more containers
    - `unpause` - Unpause all processes within one or more containers
    - `kill` - Kill one or more running containers

### 🔎Lab 4: Docker-First-Images-And-Containers-LAB4-Commit-Own-Image.pdf

How to create a Docker image from a container?

Let’s start by running an interactive shell in a ubuntu container:
```bash
docker container run -it ubuntu:18.04 /bin/bash
# or
docker run -it ubuntu bash
```
As you know from earlier labs, you just grabbed the image called `ubuntu` from Docker Store and are now running the bash shell inside that container.


To customize things a little bit we will install a package called `figlet` in this container. Your container should still be running so type the following commands at your ubuntu container command line:
```bash
apt-get update
apt-get upgrade -y
apt-get clean
apt-get install -y figlet
figlet "Hello Docker"
```
You should see the words “hello docker” printed out in large ascii characters on the screen. Go ahead and exit from this container.
```bash
exit
```
Now let us pretend this new figlet application is quite useful and you want to share it with the rest of your team. You COULD tell them to do exactly what you did above and install figlet in to their own container, which is simple enough in this example. But if this was a real world application where you had just installed several packages and run through a number of configuration steps the process could get cumbersome and become quite error prone. Instead, it would be easier to create an IMAGE you can share with your team.

To start, we need to get the ID of this container using the ls command (do not forget the -a option 
as the non running container are not returned by the ls command).
```bash
docker container ls -a
# or
docker ps -a
```

Before we create our own image, we might want to inspect all the changes we made. Try typing the command `docker container diff <container ID>` for the container you just created. You should see a list of all the files that were added or changed to in the container when you installed figlet. Docker keeps track of all of this information for us. This is part of the LAYER concept we will explore in a few minutes.

Now, to create an image we need to `commit` this container. Commit creates an image locally on the system running the Docker engine. Run the following command, using the container ID you retrieved, in order to commit the container and create an image out of it.
```bash
docker container commit <container ID>
```

That’s it - you have created your first image! Once it has been commited, we can see the newly created image in the list of available images.
```bash
docker images
# or
docker image ls
```

Note that the image we pulled down in the first step (ubuntu) is listed here along with our own custom image. Except our custom image has no information in the `REPOSITORY` or `TAG` columns, which would make it tough to identify exactly what was in this container if we wanted to share amongst multiple team members.

Adding this information to an image is known as TAGGING an image. From the previous command, get the ID of the newly created image and tag it so it’s named ourfiglet:
```bash
docker image tag <image ID> ourfiglet:1.0
# or
docker image tag <image ID> ourfiglet # latest
```

Now, if you run the `docker images` command again, you will see the new tag in the list of images. You can also see the tag by running `docker image ls`.

Test the image by running the following command:
```bash
docker container run ourfiglet:1.0 figlet "Hello Docker"
```

### 🔎Lab 5: Docker-First-Images-And-Containers-LAB5-Commit-Own-Image.pdf

We will create our own customized apache webserver image…

1. Create container

    Run the following command:
    ```bash
    docker container run -it ubuntu:18.04 /bin/bash
    # or
    docker run -it ubuntu bash
    ```

2. Add apache2

    Run the following command:
    ```bash
    apt-get update
    apt-get upgrade -y
    apt-get clean
    apt-get install -y apache2
    exit
    ```

3. Get container ID

    Run the following command:
    ```bash
    docker container ls -l
    # or
    docker ps -l
    ```

4. Commit container

    Run the following command:
    ```bash
    docker commit containerid -m="A new custom image" -a="Elias De Hondt" myapache2:1.0
    # or
    docker commit containerid myapache2
    ```

5. Show images
    
    Run the following command:
    ```bash
    docker images
    # or
    docker image ls
    ```

6. Inspect image

    Run the following command:
    ```bash
    docker image inspect myapache2
    # or
    docker inspect myapache2
    ```

7. Run image

    Run the following command:
    ```bash
    docker container run -d -p 80:80 myapache2
    # or
    docker run -d -p 80:80 myapache2
    ```

## 🔗Links
- 👯 Web hosting company [EliasDH.com](https://eliasdh.com).
- 📫 How to reach us eliasdehondt@outlook.com.