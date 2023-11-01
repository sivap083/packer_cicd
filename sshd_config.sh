#!/bin/bash

# Set a password for ec2-user
echo "ansible" | sudo passwd --stdin ec2-user

# Enable password-based authentication in sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart sshd
