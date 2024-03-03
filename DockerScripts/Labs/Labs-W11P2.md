![logo](/Images/logo.png)
# 💙🤍Labs W11P2🤍💙

## 📘Table of Contents

1. [Introduction](#introduction)
2. [Labs](#labs)
    - [🔎Lab 1: Docker-Orchestration-LAB1-Install-Compose.pdf](#lab-1-docker-orchestration-lab1-install-composepdf)
    - [🔎Lab 2: Docker-Orchestration-LAB2-Docker-Compose-Wordpress.pdf](#lab-2-docker-orchestration-lab2-docker-compose-wordpresspdf)
    - [🔎Lab 3: Docker-Orchestration-LAB3-Simple-Webapp.pdf](#lab-3-docker-orchestration-lab3-simple-webapppdf)
    - [🔎Lab 4: Docker-Orchestration-LAB4-Docker-Compose-Pythonweb.pdf](#lab-4-docker-orchestration-lab4-docker-compose-pythonwebpdf)
    - [🔎Lab 5: Docker-Orchestration-LAB5-Docker-Machine.pdf](#lab-5-docker-orchestration-lab5-docker-machinepdf)
3. [Links](#links)

---

## 🖖Introduction

This file contains all related information regarding the lab of the week in question. All commands used are mentioned, but the output is not always shown. Note that the output of commands can be different on your machine.
Subject: **Orchestration**

## 🔬Labs

### 🔎Lab 1: Docker-Orchestration-LAB1-Install-Compose.pdf

How to install docker compose.
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/v2.14.0/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### 🔎Lab 2: Docker-Orchestration-LAB2-Docker-Compose-Wordpress.pdf

Use docker-compose and environment variables to start up a two container, persistent mariadb and wordpress site.

Open a file docker-compose.yml and add following data add values for the environment variables:
```yaml
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

version: '3' 
services: 
  db: 
    image: mariadb 
    volumes: 
      - db_data:/var/lib/mysql 
    restart: always 
    environment: 
      MYSQL_ROOT_PASSWORD: 123
      MYSQL_DATABASE: testdb
      MYSQL_USER: elias
      MYSQL_PASSWORD: 123
  wordpress: 
    depends_on: 
      - db 
    image: wordpress 
    ports: 
      - "8000:80" 
    restart: always 
    environment: 
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: elias
      WORDPRESS_DB_NAME: testdb
      WORDPRESS_DB_PASSWORD: 123
volumes: 
  db_data: {}
```
- Name of file: ***docker-compose.yml***

---

Start the containers:
```bash
docker-compose up -d
```
> **Note**: The -d flag is used to run the containers in the background.

---

Test with following URL:
- http://localhost:8000

### 🔎Lab 3: Docker-Orchestration-LAB3-Simple-Webapp.pdf

In this section, with the help of an example, we are going to experience the power of the orchestration feature provided by the Docker-Compose framework. For this purpose, we are going to build a two-tiered web application that will receive your inputs through a URL and respond back with the associated response text. This application is built using the following two services, as enumerated here:

- **Redis**: This is a key-value database used to store a key and its associated value.
- **Node.js**: This is a JavaScript runtime environment used to implement web server functionality as well as the application logic

Each of these services is packed inside two different containers that are stitched together using the docker-compose tool.

Here, in this example, we begin with implementing the `example.js` module, a `node.js` file to realize the web server and the key lookup functionality. Further on, we will craft the `dockerfile` on the same directory as `example.js` to package the `node.js` runtime environment, and then, define the service orchestration using a `docker-compose.yml` file on the same directory as `example.js`.

The following is the example.js file, which is a `node.js` implementation of the simple Request/Response web application. For demonstration purposes, in this code, we restrict the build and kill docker-compose commands. 

---

For the code to be self-explanatory, we added the comments in between the code:
- Name of file: ***example.js***
```js
/**
 * @author Elias De Hondt
 * @see https://eliasdh.com
 * @since 11/12/2023
 */

// A Simple Request/Response web application
// Load all required libraries
var http = require('http');
var url = require('url');
var redis = require('redis');

/// Connect to redis server running
// createClient API is called with
// -- 6379, a well-known port to which the
// redis server listens to
// -- redis, is the name of the service (container)
// that runs redis server
var client = redis.createClient(6379, 'redis');

// Set the key value pair in the redis server
// Here all the keys proceeds with "/", because
// URL parser always have "/" as its first character
client.set("/", "Welcome to Docker-Compose helper \nEnter the docker-compose command in the URL for help\n", redis.print);
client.set("/build", "Build or rebuild services", redis.print);
client.set("/kill", "Kill containers", redis.print);
var server = http.createServer(function (request, response) {
    var href = url.parse(request.url, true).href;
    response.writeHead(200, {"Content-Type": "text/plain"});
    // Pull the response (value) string using the URL
    client.get(href, function (err, reply) {
        if ( reply == null ) response.write("Command: " + href.slice(1) + " not supported\n");
        else response.write(reply + "\n");
        response.end();
    });
});
console.log("Listening on port 80");
server.listen(80);
```

---

The following text is the content of `dockerfile` that packs the `node.js` image, the redis driver for node.js, and the `example.js` file as defined earlier:
- Name of file: ***dockerfile***
```dockerfile
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Base image is node.js
FROM node:latest

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a node.js image" \
      version="1.0"

# Install redis driver for node.js
RUN npm install redis

# Copy the source code to the Docker image
ADD example.js /myapp/example.js
```

---

The following text is from the `docker-compose.yml` file that the defines the service orchestration for docker compose tool to act upon:
- Name of file: ***docker-compose.yml***
```yaml
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

version: '3'
services:
    web:
        build: .
        command: node /myapp/example.js
        links:
            - redis
        ports:
            - "8080:80"
    redis:
        image: redis:latest
```

We defined two services in this `docker-compose.yml` file, wherein these services serve the following purposes:
- The service named web is built using the Dockerfile in the current directory. Also, it is instructed to launch the container by running the node (the node.js runtime) with /myapp/example.js (web application implementation), as its argument. The container is linked to the redis container, and the container port 80 is mapped to the Docker host's port 8080.
- The service named redis is instructed to launch a container with the redis:latest image. If the image is not present in the Docker host, the Docker engine will pull it from the central repository or the private repository.

---

Now, let's continue with our example by building the Docker images using the docker-compose build command, launch the containers using the docker-compose up command, and connect with a browser to verify the request/response functionality, as explained step by step here:

```text
Application structure
demo/
│
├── docker-compose.yml
├── dockerfile
└── example.js
```

---

1. The docker-compose commands must be executed from the directory in which the docker-compose.yml file is stored. The docker-compose tool considers each docker-compose.yml file as a project, and it assumes the project name from the `docker-compose.yml` file's directory. Of course, this can be overridden using the `-p` option. So, as a first step, let's change the directory, wherein the `docker-compose.yml` file is stored:
```bash
cd demo
```

---

2. Build the services using the docker-compose build command:
```bash
sudo docker-compose build
```

---

3. Proceed to bring up the services as indicated in the `docker-compose.yml`, file using the docker-compose up command:
```bash
sudo docker-compose up
```

---

4. Having successfully orchestrated the services using the docker-compose tool, let's invoke the docker-compose ps command from a different terminal to list the containers associated with the example docker-compose project:
```bash
sudo docker-compose ps
```

Evidently, the two example_redis_1 and example_web_1 containers are up and running. The container name is prefixed with example_, which is the docker-compose project name.

---

5. Explore the functionality of our own request/response web application on a different terminal of the Docker host, as illustrated here:
```bash
curl http://0.0.0.0:8080
```

### 🔎Lab 4: Docker-Orchestration-LAB4-Docker-Compose-Pythonweb.pdf

In this lab we will configure a custom network and startup a simple python3 based webserver.

The default network used by Docker is the bridge network.

Create your own managed network:
```bash
docker network create --subnet 172.16.16.0/24 mybridge
```

---

Use inspect to check your new network:
```bash
docker network inspect mybridge
```

---

Create a new Python file called:
- Name of file: ***webserver.py***
```python
#!/usr/bin/env python3
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# If necessary install python with:
# sudo apt-get install python3 pip3
# pip3 install http.server

from http.server import BaseHTTPRequestHandler, HTTPServer
import time
hostName = "127.0.0.1" # 172.16.16.16
hostPort = 8765
class MyServer(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type","text/html")
        self.end_headers()
        self.wfile.write(bytes("Dit is een python webserver","utf-8"))
myServer = HTTPServer((hostName, hostPort), MyServer)
print(time.asctime(), "Server Starts - %s:%s" % (hostName, hostPort))
try:
    myServer.serve_forever()
except KeyboardInterrupt:
    pass
myServer.server_close()
print(time.asctime(), "Server Stops - %s:%s" % (hostName, hostPort))
```

---

Test the webserver:
```bash
python3 webserver.py
```
- http://127.0.0.1:8765

---

In webserver.py change hostName = `127.0.0.1` to hostName = `172.16.16.16`. We will run the python webserver in the container with that IP.

Create a Dockerfile:
- Name of file: ***dockerfile***
```dockerfile
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Use Python 3.6 on Debian Stretch as the base image
FROM python:3.6-stretch

# Set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a webapp node.js & redis" \
      version="1.0"

# Set the working directory in the container
WORKDIR /app

# Copy webserver.py from your local directory to the container's /app directory
COPY webserver.py /app/webserver.py

# Expose port 8765
EXPOSE 8765

# Command to start the Python web server when the container starts
CMD ["python3", "webserver.py"]
```

---

Build the image:
```bash
docker run --network mybridge --ip 172.16.16.16 -p 8765:8765 -it pythonwebserver
```
- `--network` it will use the network we created earlier.
- `--ip` it will use the IP we specified earlier.
- `-p` it will map the port 8765 from the container to the port 8765 on the host.
- `-i` it will run the container in interactive mode.
- `-t` it will allocate a pseudo-TTY.

---

Remove unused networks:
```bash
docker network prune
```

---

Create a `docker-compose.yml` file with following options:
- defines service `pythonweb` under `services:`
- `image:` uses `python:3.6-stretch` as a base image.
- `volumes:` Maps the current directory . to `/app`.
- `build:` the current directory.
- `working_dir:` uses `/app`.
- `ports:` maps `8765` on the host to `8765` on the container.

```yaml
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

version: "3"
services:
  pythonweb:
    image: python:3.6-stretch
    volumes:
      - .:/app
    build: .
    working_dir: /app
    ports:
      - "8765:8765"
    networks:
      mybridge:
        ipv4_address: 172.16.16.16

networks:
  mybridge:
    driver: bridge
    ipam:
      driver: default
      config:
        - subnet: 172.16.16.0/24

```

---

Start the container:
```bash
docker-compose up -d
```
- `-d` it will run the container in the background.

### 🔎Lab 5: Docker-Orchestration-LAB5-Docker-Machine.pdf

> **Required**: Virtualbox with VBoxManage.

Docker-machine is a tool that configures a virtualbox host with a docker container to be used as swarm manager or swarm worker.

---

Linux machine:
```bash
curl -L https://github.com/docker/machine/releases/download/v0.16.1/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine
chmod +x /tmp/docker-machine
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
```

Windows machine:
[Documentation](https://docs.docker.com/toolbox/toolbox_install_windows)

(Do not install the newer Docker for Windows version, but do install the toolkit!)

---

Create a new machine:
```bash
docker-machine create mymanager
```

To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run:
```bash
docker-machine env mymanager
```

---

start the swarm:
```bash
docker-machine ssh mymanager
docker swarm init
# docker swarm init --advertise-addr 192.168.99.101
```

---

To add a worker to this swarm, run the following command:
```bash
docker swarm join --token SWMTKN-1-54zspplzk8qklxnqs7pft4vzfialj2tu7k3yqprn6tu5osv2qf-2pxiu7bkr32l6im8psllnol0u 192.168.99.101:2377
```
> **Note**: This token and IP are unique to your swarm.

To add a manager to this swarm, run `docker swarm join-token manager` and follow the instructions.

---

To create a first node for your swarm cluster do:
```bash
docker-machine create worker1
```

---

Add this node as a worker to the swarm:
```bash
docker swarm join --token SWMTKN-1-54zspplzk8qklxnqs7pft4vzfialj2tu7k3yqprn6tu5osv2qf-2pxiu7bkr32l6im8psllnol0u 192.168.99.101:2377
```

This node joined a swarm as a worker.

---

Create a webserver on the manager:
```bash
docker-machine ssh mymanager # Connect to the manager
docker node ls # List nodes (is not necessary)
docker service create --name webserver -p 80:80 httpd # Create a service
docker service ls # List services (is not necessary)
docker service scale webserver=2 # Scale the service to 2 containers
docker service ps webserver # List the containers
```

---

Test the webserver in a browser on all IPs of the cluster (manager and worker1). In the example case this was:
- http://192.168.99.101
- http://192.168.99.100

## Extra information

- **Docker Orchestration** refers to managing containers within a larger environment, automating various aspects of container deployments. Its goal is to streamline tasks like deploying containers, scaling them, load balancing, and handling fault tolerance. Docker Orchestration includes tools like Docker Compose, Kubernetes, and Docker Swarm.
- **Docker Swarm** is a built-in Docker tool providing clustering and orchestration capabilities for Docker containers. It allows users to pool together a group of Docker hosts into a single virtual host. It operates using a 'swarm mode,' enabling users to manage multiple Docker machines as a single virtual system. Swarm comes bundled with Docker Engine and is designed to be relatively straightforward in setup and usage.

## 🔗Links
- 👯 Web hosting company [EliasDH.com](https://eliasdh.com).
- 📫 How to reach us eliasdehondt@outlook.com.