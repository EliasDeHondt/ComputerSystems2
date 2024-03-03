############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Use the latest version of busybox as the base image
FROM busybox:latest

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a container that prints Hello World!!" \
      version="1.0"

# Set the command to echo "Hello World!!" when the container starts
CMD echo Hello World!!