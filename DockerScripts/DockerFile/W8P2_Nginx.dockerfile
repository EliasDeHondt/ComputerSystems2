############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Use the latest version of ubuntu as the base image
FROM ubuntu:14.04

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a nginx webserver with a custom index.html file." \
      version="1.0"

# Update the package list
RUN apt-get update

# Install nginx
RUN apt-get install -y nginx

# New customized index.html file :)
RUN echo "<!DOCTYPE html><html><head><title>Hello World Page</title><style>body {font-family: Arial, sans-serif;background-color: #f0f0f0;text-align: center;margin-top: 50px;}.container {width: 50%;margin: 0 auto;background-color: #fff;padding: 20px;border-radius: 10px;box-shadow: 0 0 10px rgba(0,0,0,0.1);}h1 {color: #333;}</style></head><body><div class=\"container\"><h1>Hello World!</h1><p>Welcome to my cool web page!</p><p>Design by Elias De Hondt.</p></div></body></html>" > /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80