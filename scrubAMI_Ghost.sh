#!/bin/bash
# Written by Andy Boutte and David Balderston of howtoinstallghost.com and allaboutghost.com
# scrubAMI.sh is used to clean our Amazon AMI before submission to the Marketplace
#
# Run the following command (immediately after SSHing into server) from the ec2-user on our AMI:
# HISTSIZE=0; sudo wget -O - https://raw.githubusercontent.com/howtoinstallghost/Scrub-AMI/master/scrubAMI_Ghost.sh | sudo bash

# Temporarily disable history
export HISTSIZE=0

# Stop Ghost
pm2 stop all

# Things to delete for Ghost
rm /var/log/cloud-init.log
rm -r /var/log/ghost
rm /home/ghost/.pm2/logs/*
rm /home/ghost/.pm2/pm2.log
rm /root/.pm2/logs/*
rm /root/.pm2/pm2.log
rm /var/www/ghost/content/data/*.db

# Things to delete at OS level
rm /var/log/cron*
rm /var/log/secure*
rm /var/log/messages*
rm /var/log/nginx/*.log
rm /home/ec2-user/.ssh/authorized_keys
rm /home/ghost/.ssh/authorized_keys
rm /root/.ssh/authorized_keys
find / -name "authorized_keys" -delete

# Clear history last
rm /root/.bash_history
rm /home/ec2-user/.bash_history
rm /home/ghost/.bash_history
