######################
# Van Elias De Hondt #
######################

# Use a base image
FROM busybox:latest

# Set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a data-only container for apache2." \
      version="1.0"

# Create a volume for the log directory
VOLUME /var/log/apache2

# Set the log directory PATH
CMD ["/bin/true"]