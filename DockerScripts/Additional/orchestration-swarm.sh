#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

docker-compose up # Start the containers
docker-compose down # Stop the containers

docker-compose up -d # Start the containers in the background
docker-compose up --build # Build the containers and start them

docker-compose build # Build the containers



# DOCKER ORCHESTRATION HANDS-ON LAB

## SECTION 1: CONFIGURE SWARM MODE
docker run -dt ubuntu sleep infinity # Example one host (docker ps)

docker swarm init # Initialize swarm mode and make your current machine a swarm manager
docker info
docker node ls # List the nodes in the swarm

### Add a worker node to the swarm
docker swarm join --token SWMTKN-1-5jyp20zzrnvjbvl8ct6a3wqe2k8n05h31dqxj02va714ar2flg-6ina9b1jss4zjkmbme6f1le0z 192.168.70.129:2377

## SECTION 3: DEPLOY APPLICATIONS ACROSS MULTIPLE HOSTS
docker service create --name sleep-app ubuntu sleep infinity # Create a service
docker service ls # List the services

docker service update --replicas 7 sleep-app # Scale the service (7)
docker service ps sleep-app # List the tasks of the service

docker service update --replicas 4 sleep-app # Scale the service (4)
docker service ps sleep-app # List the tasks of the service

docker node update --availability drain 6dlewb50pj2y66q4zi3egnwbi # 6dlewb50pj2y66q4zi3egnwbi is the node ID
docker node ls # List the nodes in the swarm
docker service ps sleep-app # List the tasks of the service

docker service rm sleep-app # Remove the service
docker swarm leave --force # Make the current machine leave the swarm