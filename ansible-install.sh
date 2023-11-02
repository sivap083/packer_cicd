#!/bin/bash
set +e
# Update the package repository and install EPEL repository
sudo dnf install epel-release -y
sudo dnf update -y
sudo yum update -y
sudo yum makecache

# Install Ansible
sudo dnf install ansible
