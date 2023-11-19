######################
# Van Elias De Hondt #
######################

# Use the previously created persistence1 image as the base image
FROM persistence1

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This Dockerfile will test PERSISTENCE." \
      version="1.0"

# Use CMD to display the contents of the environment variables
CMD echo "Password is: $password" && echo "User is: $user"