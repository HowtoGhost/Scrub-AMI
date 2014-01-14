#!/bin/bash
# Written by Andy Boutte and David Balderston of howtoinstallghost.com and allaboutghost.com
# scrubAMI.sh is used to clean our Amazon AMI before submission to the Marketplacei

# To run this on our AMI:
# sudo wget -O - https://raw2.github.com/howtoinstallghost/Scrub-AMI/master/scrubAMI.sh | sudo bash

# Things to delete for Ghost

rm -r /var/log/ghost
rm /var/www/ghost/content/data/*.db

# Things to delete at OS level

find / -name "authorized_keys" –exec rm –f {} \;
sudo rm -r /home/ec2-user/.ssh/authorized_keys
sudo rm -r /root/.ssh/authorized_keys
find /root/.*history /home/*/.*history -exec rm -f {} \;
history -c
rm /etc/syslog.conf
service rsyslog restart
find /root/.*history /home/*/.*history -exec rm -f {} \;
