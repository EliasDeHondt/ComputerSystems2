######################
# Van Elias De Hondt #
######################

# Use Python 3.6 on Debian Stretch as the base image
FROM python:3.6-stretch

# Set the working directory in the container
WORKDIR /app

# Copy webserver.py from your local directory to the container's /app directory
COPY webserver.py /app/webserver.py

# Expose port 8765
EXPOSE 8765

# Command to start the Python web server when the container starts
CMD ["python3", "webserver.py"]