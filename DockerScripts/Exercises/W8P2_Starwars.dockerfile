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