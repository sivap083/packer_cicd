#!/bin/bash

sudo setenforce 0

sudo sed -i 's/lock_passwd: true/lock_passwd: false/' /etc/cloud/cloud.cfg
sudo sed -i 's/ssh_pwauth:   0/ssh_pwauth:   True/' /etc/cloud/cloud.cfg

# Set a password for ec2-user
echo "Duod1pcdABe5P" | sudo passwd --stdin ec2-user

# Enable password-based authentication in sshd_config
echo "Updating ssh config"
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart sshd
echo "restarted sshd service"