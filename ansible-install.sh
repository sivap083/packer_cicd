#!/bin/bash
sudo curl -O https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo yum install epel-release-latest-8.noarch.rpm -y
sudo yum update -y
sudo yum install ansible -y

