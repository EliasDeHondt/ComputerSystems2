######################
# Van Elias De Hondt #
######################

# docker build . -f W10P2_RabbitMQ.dockerfile -t rabbitmq
# docker run -d -p 5672:5672 -p 15672:15672 --rm --name RabbitMQ rabbitmq:latest

# Use a base image
FROM ubuntu:22.04

# Set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a RabbitMQ server" \
      version="1.0"

# Update the package list and install RabbitMQ in one command
RUN apt-get update && \
    apt-get install -y rabbitmq-server && \
    apt-get clean

# Expose the port
EXPOSE 5672 15672

# Start RabbitMQ bij het opstarten van de container
CMD ["rabbitmq-server"]


# of
# FROM rabbitmq:3.9.15
# EXPOSE 5672 15672

# docker build -t my-rabbitmq .
# docker run -d -p 5672:5672 -p 15672:15672 --name my-rabbitmq my-rabbitmq

# docker exec -it my-rabbitmq bash