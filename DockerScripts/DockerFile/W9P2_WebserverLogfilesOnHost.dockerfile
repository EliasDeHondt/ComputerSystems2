############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Use a base image
FROM ubuntu:14.04

# Set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a apache2 webserver with a custom log PATH on host" \
      version="1.0"

# Update the package list and install apache2 in one command
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Set the log directory PATH
ENV LOG_DIR=/var/log/apache2

# Launch apache2 server in the foreground
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]