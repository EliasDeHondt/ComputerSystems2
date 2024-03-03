############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Use a base image
FROM ubuntu:latest

# Installeer het pakket python3
RUN apt-get update && apt-get install -y python3

# Start de shell als standaard commando
CMD ["/bin/bash"]