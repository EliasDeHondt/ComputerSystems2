############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################

FROM ubuntu:23.10

LABEL author="Elias De Hondt <elias.dehondt@student.kdg.be" \
      description="This is a Dockerfile to create a webapp node.js & redis" \
      version="1.0"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get clean

RUN useradd -m -p $(openssl passwd -1 123) -s /bin/bash elias
RUN usermod -aG sudo elias

WORKDIR /home/elias

RUN apt-get install htop


CMD ["tail", "-f", "/dev/null"]


# docker build . -t ubuntuserver
# docker run -d --rm ubuntuserver

# docker run -d --rm ubuntuserver:latest --name UbuntuServer1
# docker container -it exec UbuntuServer1 /bin/bash