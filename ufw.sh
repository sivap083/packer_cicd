#!/bin/bash

# Update the system packages
sudo yum update -y

# Install UFW
sudo yum install -y ufw

# Enable UFW
sudo systemctl enable ufw
sudo systemctl start ufw

# Set the default policies to allow outgoing traffic and deny incoming traffic
sudo ufw default allow outgoing
sudo ufw default deny incoming

# Allow incoming traffic on ports 22, 80, and 443
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443

# Reload UFW rules to apply changes
sudo ufw reload

# Enable UFW
sudo ufw --force enable

# Display the UFW status and rules
sudo ufw status verbose
