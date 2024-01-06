######################
# Van Elias De Hondt #
######################

# Defining the application structure
# notes/
# │
# ├── Dockerfile
# ├── notes.txt
# └── README.md

# COPY: It is mainly used to copy files from the host to the image.
# It is simple and straightforward in its functionality: it copies files from the host to the container.

# ADD: Performs the same task as COPY (copying files from the host to the container),
# but has additional functionality. It can also handle URLs and download files from a URL,
# in addition, it can automatically extract tar archives to the target location in the container.


# Use the Alpine image as the base image
FROM alpine:latest

# set maintainer
LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be>" \
      description="This is a Dockerfile to create a container that prints the contents of a notes.txt file." \
      version="1.0"

# Define an environment variable for the note file location
ENV NOTES_FILE_PATH=/notes/notes.txt

# Set working directory to /notes
WORKDIR /notes

# Copy the notes file to the container
ADD W8P2_Notes_TestDIY.txt $NOTES_FILE_PATH

# Add an entrypoint script
COPY W8P2_entrypoint_TestDIY.sh /notes/entrypoint.sh
RUN chmod +x /notes/entrypoint.sh

# Define the entrypoint script as the default startup command
ENTRYPOINT ["/notes/entrypoint.sh"]