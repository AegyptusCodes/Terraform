#!/bin/bash
sudo yum update -y
sudo yum install git -y
sudo yum install nginx -y
git clone https://github.com/AegyptusCodes/nginx-conf.git
sudo cp nginx-conf/nginx.conf /etc/nginx/nginx.conf
