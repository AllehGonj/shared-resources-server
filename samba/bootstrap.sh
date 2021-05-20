#!bin/bash

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y samba samba-common system-config-samba python-glade2

sudo mkdir /home/shared

sudo cp -pf /etc/samba/smb.conf /etc/samba/smb.conf.bak

# Configure directory that will be accessed with Samba
sudo echo "
[public]
comment = My Public Folder
path = /home/shared
public = yes
writable = yes
create mast = 0777
force user = nobody
force group = nogroup
guest ok = yes
security = SHARE
" | sudo tee -a /etc/samba/smb.conf

# Restart Samba service
sudo /etc/init.d/smbd restart

# Give persmissions to shared directory
sudo chmod -R 777 /home/shared

# Save connection data
sudo touch /tmp/conn.txt
echo "To access the shared machine from Windows :" >> /tmp/conn.txt
echo "\\\\$(ifconfig eth0 | sed -n 's/.*dr:\(.*\)\s Bc.*/\1/p')" >> /tmp/conn.txt
