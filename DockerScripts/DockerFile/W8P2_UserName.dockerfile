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