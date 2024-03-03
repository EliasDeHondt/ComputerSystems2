![logo](/Images/logo.png)
# 💙🤍Labs W10P2🤍💙

## 📘Table of Contents

1. [Introduction](#introduction)
2. [Labs](#labs)
    - [🔎Lab 1: Docker-Networking-LAB1-Basic-Checks.pdf](#lab-1-docker-networking-lab1-basic-checkspdf)
    - [🔎Lab 2: Docker-Networking-LAB2-IPs-And-Ports.pdf](#lab-2-docker-networking-lab2-ips-and-portspdf)
    - [🔎Lab 3: Docker-Networking-LAB3-DIY.pdf](#lab-3-docker-networking-lab3-diypdf)
3. [Links](#links)

---

## 🖖Introduction

This file contains all related information regarding the lab of the week in question. All commands used are mentioned, but the output is not always shown. Note that the output of commands can be different on your machine.
Subject: **Networking**

## 🔬Labs

### 🔎Lab 1: Docker-Networking-LAB1-Basic-Checks.pdf

Check the IP addresses of the docker host.
```bash
ip addr show docker0
```

What range is this interface in?
> 172.17.0.1 172.17.255.255

---

Launch an interactive ubuntu container with an open bash shell:
```bash
docker run -it --rm ubuntu:22.04 /bin/bash
```

---

Depending on the Ubuntu version: If necessary you must install the necessary ip tools.
```bash
apt-get update && apt-get install -y iputils-ping net-tools iproute2
```

---

Check the ip address of the interfaces that are present.
```bash
ip addr show
```

- Which is the IP address?
> 172.17.0.3

- Is it in the same range as the host address?
> Yes

- Can it ping the host address?
> Yes (ping -c 4 172.17.0.1)

- Is there another interface present? Which one & with which IP address?
> lo -> 127.0.0.1/8

---

Launch the Ubuntu server as a detached container. You should know the command:
```bash
docker run --rm -d ubuntu:22.04 tail -f /dev/null
```

Check the network settings bij running the `docker inspect` command. Look for the `Network` or `NetworkSettings` in the output and write down the information you get. Make sure you see the ip address. (If possible, try to explain some of the parameters.)
```bash
docker inspect a827397bbccc
# docker inspect <container-id>
```

If you only need the IP address information, you can retrieve it through:
```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' a827397bbccc
```


### 🔎Lab 2: Docker-Networking-LAB2-IPs-And-Ports.pdf

We will use an apache webserver for our next tests. This Dockerfile will create the apacheserver:
```dockerfile
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

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

# Set the log directory PATH
ENV APACHE_LOG_DIR /var/log/apache2

# Expose port 80
EXPOSE 80

# Start Apache service
CMD ["apache2ctl", "-D", "FOREGROUND"]
```

---

Build the image:
```bash
sudo docker build -t apache2 .
```

---

Run the container:
```bash
docker run -d -p 8080:80 --rm -v /log:/var/log/apache2 --name apache2web apache2:latest
```

---

Check the IP address of the container:
```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' apache2web
```

---

Test if the following command works:
```bash
sudo wget -qO- http://172.17.0.3:8080/index.html
```

- What do you get?
> The HTML code of the index.html file.

- Can you connect via a web-browser on your docker host?
> Yes (sudo wget -qO- http://localhost:8080/index.html)

- Can you connect via a web browser outside your docker host to the container’s IP address?
> No

- Can you connect via a web browser outside your docker host to the host’s IP address?
> Yes (sudo wget -qO- http://192.168.70.129:8080/index.html)

---

What is the port number of the container and what is the port number of the host?
```bash
docker port apache2web
```

---

The iptables is providing the necessary mapping. You can check this by typing:
```bash
sudo iptables -t nat -L -n
```

### 🔎Lab 3: Docker-Networking-LAB3-DIY.pdf

Create your own image of a network-related software of your own choice. The image should work as if the software has been started normally.
```dockerfile
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Use a base image
FROM ubuntu:22.04

# Set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a RabbitMQ server" \
      version="1.0"

# Update the package list and install RabbitMQ in one command
RUN apt-get update && \
    apt-get install -y rabbitmq-server && \
    apt-get clean

# Expose the port
EXPOSE 5672 15672

# Start RabbitMQ bij het opstarten van de container
CMD ["rabbitmq-server"]
```

The Dockerfile is based on the following tutorial: [https://www.rabbitmq.com/install-debian.html](https://www.rabbitmq.com/install-debian.html)

---

Build the image:
```bash
docker build -t my-rabbitmq .
```

---

Run the container:
```bash
docker run -d -p 5672:5672 -p 15672:15672 --name rabbitmq my-rabbitmq
```

## 🔗Links
- 👯 Web hosting company [EliasDH.com](https://eliasdh.com).
- 📫 How to reach us eliasdehondt@outlook.com.