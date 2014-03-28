#!/bin/bash
# Written by Andy Boutte and David Balderston of howtoinstallghost.com and allaboutghost.com
# scrubAMI.sh is used to clean our Amazon AMI before submission to the Marketplace
#
# Run the following from the ec2-user on our AMI:
# HISTSIZE=0; sudo wget -O - https://raw2.github.com/howtoinstallghost/Scrub-AMI/master/scrubAMI.sh | sudo bash

# Temporarily disable history
export HISTSIZE=0

# Things to delete for Discourse
rm -r /var/log/ghost
rm /.pm2/log
rm /var/www/ghost/content/data/*.db

# Things to delete at OS level
rm /var/log/cron*
rm /var/log/secure*
rm /var/log/messages*
rm /var/log/nginx/*.log
rm /home/ec2-user/.ssh/authorized_keys
rm /home/ghost/.ssh/authorized_keys
rm /root/.ssh/authorized_keys
find / -name "authorized_keys" –exec rm –f {} \;

# Clear history last
rm /root/.bash_history
rm /home/ec2-user/.bash_history
rm /home/discourse/.bash_history