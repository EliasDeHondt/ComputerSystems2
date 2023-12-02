#!/bin/bash
######################
# Van Elias De Hondt #
######################

apt-get install iproute2 -y # Install iproute2 (ip addr)
apt-get install iputils-ping -y # Install iputils-ping (ping)

# NETWORKING BASIC CHECKS
docker exec -it 393ffcfb81d7 /bin/bash
apt-get install update
apt-get upgrade -y
install iputils-ping -y
ping -c 3 172.17.0.1


## NETWORKING IPS AND PORTS
sudo iptables -t nat -L -n # List all iptables nat rules (network address translation)


## ADVANCED NETWORKING