#!bin/bash

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y samba samba-common system-config-samba python-glade2

sudo cp -pf /etc/samba/smb.conf /etc/samba/smb.conf.bak
