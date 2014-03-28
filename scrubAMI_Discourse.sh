#!/bin/bash
# Written by Andy Boutte and David Balderston of howtoinstallghost.com and allaboutghost.com
# scrubAMI.sh is used to clean our Amazon AMI before submission to the Marketplace
#
# Run the following command (immediately after SSHing into server) from the ubuntu on our AMI:
# HISTSIZE=0; sudo wget -O - https://raw2.github.com/howtoinstallghost/Scrub-AMI/master/scrubAMI_Discourse.sh | sudo bash

# Temporarily disable history
export HISTSIZE=0

# Things to delete for Discourse
rm /.pm2/log
rm /var/www/ghost/content/data/*.db

# Things to delete at OS level
rm /var/log/cloud-init.log
rm /var/log/cron*
rm /var/log/secure*
rm /var/log/messages*
rm /home/ubuntu/.ssh/authorized_keys
rm /root/.ssh/authorized_keys
find / -name "authorized_keys" -delete

# Clear history last
rm /root/.bash_history
rm /home/ubuntu/.bash_history