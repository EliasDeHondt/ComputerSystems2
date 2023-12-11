######################
# Van Elias De Hondt #
######################

# Use a base image
FROM busybox:latest

# set maintainer
CMD echo "Hello from user $(whoami)"