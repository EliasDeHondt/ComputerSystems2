############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
## How to build and run this image
# docker build . -f apache2.dockerfile -t apache2
# docker run -d -p 8080:80 --rm -v /log:/var/log/apache2 --name apache2in1 apache2:latest
# tail -f /log/access.log

# Use the 22.04 version of ubuntu as the base image
FROM ubuntu:22.04

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a apache2 webserver." \
      version="1.0"

# Update the package list and install apache2 in one command
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# New customized index.html file :)
RUN echo "<!DOCTYPE html><html><head><title>Hello World Page</title><style>body {font-family: Arial, sans-serif;background-color: #f0f0f0;text-align: center;margin-top: 50px;}.container {width: 50%;margin: 0 auto;background-color: #fff;padding: 20px;border-radius: 10px;box-shadow: 0 0 10px rgba(0,0,0,0.1);}h1 {color: #333;}</style></head><body><div class=\"container\"><h1>Hello World!</h1><p>Welcome to my cool web page!</p><p>Design by Elias De Hondt.</p></div></body></html>" > /var/www/html/index.html

# Configureer Apache logging
RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

# Set the log directory PATH
ENV APACHE_LOG_DIR /var/log/apache2

# Expose port 80
EXPOSE 80

# Start Apache service
CMD ["apache2ctl", "-D", "FOREGROUND"]