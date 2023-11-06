#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Maak een VM-instance aan met Rocket Chat-server.

INSTANCE_NAME=rocketChatServer-vm
MACHINE_TYPE=n1-standard-1
IMAGE_PROJECT=ubuntu-os-cloud
IMAGE_FAMILY=ubuntu-2004-lts
ZONE=europe-west1-c
TAG=rocketChatServer
FIREWALL_RULE=rocketChatServer

# Inline startup-script om Rocket Chat-server te installeren via Snap.
STARTUP_SCRIPT="
#!/bin/bash
apt-get -y update
sudo snap install rocketchat-server
"

# gcloud compute instances create rocketChatServer-vm --machine-type=n1-standard-1 --image-project=ubuntu-os-cloud --image-family=ubuntu-2004-lts --zone=europe-west1-c --tags=rocketChatServer-vm
gcloud compute instances create $INSTANCE_NAME \
    --machine-type=$MACHINE_TYPE \
    --image-project=$IMAGE_PROJECT \
    --image-family=$IMAGE_FAMILY \
    --zone=$ZONE \
    --tags=$TAG \
    --metadata=startup-script=\"$STARTUP_SCRIPT\"


gcloud compute firewall-rules create $FIREWALL_RULE --allow=tcp:80,tcp:3000 --source-ranges=0.0.0.0/0 --target-tags=$TAG

# gcloud compute ssh rocketChatServer-vm
# ps aux | grep chat

# Public IP van server opvragen:
# gcloud compute instances describe rocketChatServer-vm --format='get(networkInterfaces[0].accessConfigs[0].natIP)'

# Extra:
# gcloud compute firewall-rules delete rocketChatServer
# gcloud compute instances stop rocketChatServer-vm
# gcloud compute instances delete rocketChatServer-vm