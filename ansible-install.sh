#!/bin/bash
set +e
# Update the package repository and install EPEL repository
sudo yum update -y
sudo amazon-linux-extras install epel
sudo yum makecache
sudo yum install -y epel-release

# Install Ansible
sudo yum install -y ansible
