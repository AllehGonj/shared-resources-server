#!bin/bash

SERVER_IP_ADDRESS=192.168.10.10

# Install NFS client for Debian distributions
sudo apt-get update && sudo apt-get upgrade
sudo apt install -y nfs-common

sudo mkdir /var/locally-mounted
# sudo mount -t nfs $SERVER_IP_ADDRESS:/shared /var/locally-mounted  # Mount only in current session

sudo echo "$SERVER_IP_ADDRESS:/shared      /var/locally-mounted           nfs     defaults              0 0" >> /etc/fstab

sudo mount /var/locally-mounted
sudo mount $SERVER_IP_ADDRESS:/shared
