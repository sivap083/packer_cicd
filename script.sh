#!/bin/bash

sudo apt update
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
