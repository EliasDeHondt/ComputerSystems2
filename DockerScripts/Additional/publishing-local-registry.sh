#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Instead of Docker Hub you can also create a local Registry.

# Create a local registry (START REGISTRY CONTAINER)
docker run -d -p 5000:5000 --restart=always --name registry registry:2
# -d = Run the container in detached mode (in the background)
# -p 5000:5000 = Map port 5000 of the host to port 5000 of the container
# --restart=always = Restart the container automatically when it exits
# --name registry = Name the container registry
# registry:2 = Use the registry:2 image

# Test the local registry (GEBRUIK LOKALE REGISTRY)
docker pull hello-world # Pull a container image (hello-world) from Docker Hub
docker tag hello-world localhost:5000/helloworld # Tag the hello-world image as localhost:5000/helloworld
docker push localhost:5000/helloworld # Push the localhost:5000/helloworld image to the local registry

# Test the local registry (GEBRUIK REGISTRY API)
curl -i http://localhost:5000/v2/_catalog # List all images in the local registry
