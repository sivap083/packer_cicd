#!/bin/bash

# Update the package repository and install EPEL repository
sudo yum update -y
sudo yum install -y epel-release

# Install Ansible
sudo yum install -y ansible
