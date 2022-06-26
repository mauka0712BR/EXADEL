#!/bin/bash
sudo apt-get update
sudo apt-get install apache2 php squid -y
sudo chown -R $USER:$USER /var/www
sudo chmod -R 755 /var/www
sudo service apache2 restart
rm -rf /var/www/html/index.html
echo "<?php echo'Hello World" >> /var/www/html/index.php  
hostnamectl >> /var/www/html/index.php
echo "';?>" >> /var/www/html/index.php 
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install docker-ce -y
sudo systemctl stop squid
sudo wget https://exadel-bucket.s3.amazonaws.com/squid.conf -P /etc/squid/
sudo systemctl enable squid.service
sudo systemctl start squid