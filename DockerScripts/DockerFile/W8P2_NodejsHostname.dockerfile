############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Use the latest version of alpine as the base image
FROM alpine:latest

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a nodejs script that prints the hostname of the container." \
      version="1.0"

# Install nodejs in the container
RUN apk update && apk add nodejs

# Set the working directory
WORKDIR /app

# Create the Node.js script directly in the container
RUN echo "var os = require('os'); var hostname = os.hostname(); console.log('hello from ' + hostname); console.log(\"this is v0.2\");" > nodejsHostname.js

# Run the nodejs script
CMD ["node", "nodejsHostname.js"]