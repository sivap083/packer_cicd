#!/bin/bash
echo "ansible" | sudo passwd --stdin ec2-user
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd