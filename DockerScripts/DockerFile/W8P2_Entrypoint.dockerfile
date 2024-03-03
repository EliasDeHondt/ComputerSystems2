############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

# Use a base image
FROM busybox:latest

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This Dockerfile will test ENTRYPOINT." \
      version="1.0"


# Change the entrypoint to the echo command to display HELLO
ENTRYPOINT ["echo", "HELLO"]

# Use CMD to show WORLD
CMD ["WORLD"]