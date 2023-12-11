######################
# Van Elias De Hondt #
######################

# Base image is node.js
FROM node:latest

# Set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a webapp node.js & redis" \
      version="1.0"

# Install redis-server
RUN apt-get update && apt-get install -y redis-server

# Copy the source code to the Docker image
WORKDIR /myapp
COPY example.js /myapp/example.js

# Expose the port
EXPOSE 80

# Command to run the application
CMD ["node", "example.js"]