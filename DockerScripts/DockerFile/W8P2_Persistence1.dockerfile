############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Use a base image
FROM alpine:latest

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This Dockerfile will test PERSISTENCE." \
      version="1.0"

# Set environment variables
ENV password="password"
ENV  user="admin"