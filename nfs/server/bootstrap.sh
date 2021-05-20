#!bin/bash

CLIENT_IP_ADDRESS=192.168.10.11

# Install NFS server for Debian distributions
sudo apt-get update && sudo apt-get upgrade
sudo apt install -y nfs-kernel-server

# Create Root NFS Directory
sudo mkdir /mnt/shared
sudo chown nobody:nogroup /mnt/shared  # No one is owner of shared directory
sudo chmod 777 /mnt/shared  # Everyone can modify files in shared directory

sudo echo "/mnt/shared $CLIENT_IP_ADDRESS(rw,sync,no_subtree_check)" >> /etc/exports

# Make the NFS Share Available to Clients
sudo exportfs -a  # Makes the file share available
sudo ufw allow nfs  # Allow firewall access for NFS
sudo systemctl restart nfs-kernel-server
