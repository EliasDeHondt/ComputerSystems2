######################
# Van Elias De Hondt #
######################

# Use a base image
FROM ubuntu:latest

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This Dockerfile will print de username." \
      version="1.0"

# Define a user dynamically
RUN echo "Hello from user $(whoami)" > /message.txt

# Command to display the message
CMD cat /message.txt