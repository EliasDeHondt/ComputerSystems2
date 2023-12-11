#!/bin/bash
######################
# Van Elias De Hondt #
######################

docker-compose up # Start the containers
docker-compose down # Stop the containers

docker-compose up -d # Start the containers in the background
docker-compose up --build # Build the containers and start them

docker-compose build # Build the containers