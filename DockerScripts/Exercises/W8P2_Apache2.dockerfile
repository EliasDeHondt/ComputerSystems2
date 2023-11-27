######################
# By Elias De Hondt  #
######################

# Use Ubuntu 20 as the base image
FROM ubuntu:20.04

# Set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create an apache2 webserver with a custom index.html file." \
      version="1.0"

# Update package list and install apache2 in one command
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Create a non-root user named 'elias'
RUN useradd -ms /bin/bash elias

USER elias

# Copy the customized index.html file to the appropriate location and change the owner to the 'elias' user
RUN echo "<!DOCTYPE html><html><head><title>Hello World Page</title><style>body {font-family: Arial, sans-serif;background-color: #f0f0f0;text-align: center;margin-top: 50px;}.container {width: 50%;margin: 0 auto;background-color: #fff;padding: 20px;border-radius: 10px;box-shadow: 0 0 10px rgba(0,0,0,0.1);}h1 {color: #333;}</style></head><body><div class=\"container\"><h1>Hello World!</h1><p>Welcome to my cool web page!</p><p>Design by Elias De Hondt.</p></div></body></html>" > /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Switch to the 'elias' user and start the Apache service

CMD ["apache2ctl", "-D", "FOREGROUND"]
