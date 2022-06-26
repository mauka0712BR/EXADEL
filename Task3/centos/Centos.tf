terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}
resource "aws_security_group" "server_centos" {
  name = "server_centos"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.31.29.19/32"]
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.29.19/32"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.31.29.19/32"]
  }
  
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["172.31.29.19/32"]
  }
 
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.31.29.19/32"]
  }
  
  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.29.19/32"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.31.29.19/32"]
  }
  
  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["172.31.29.19/32"]
  }
  
}

resource "aws_network_interface" "server_centos" {
  subnet_id = "subnet-0ff7abd26217f41d8"
  private_ips = ["172.31.29.20"]
  security_groups = ["${aws_security_group.server_centos.id}"]
}
resource "aws_instance" "server_centos" {
  ami = lookup(var.amis_centOS, var.region)
  instance_type = "t2.micro"
  key_name = "putty"
  network_interface {
     network_interface_id = "${aws_network_interface.server_centos.id}"
     device_index = 0
  }
  tags = {
    Name = "AWS_Centos"
  }
  
user_data= <<-EOF
	#!/bin/bash
	echo "proxy=http://172.31.29.19:443" >> /etc/dnf/dnf.conf
	yum update -y  
	yum install httpd httpd-tools php php-mysqlnd -y  
	sudo wget https://exadel-bucket.s3.amazonaws.com/dnf.conf -P /etc/dnf/ 
	systemctl start httpd  
	systemctl enable httpd  
	usermod -a -G apache ec2-user  
	chown -R ec2-user:apache /var/www  
	chmod 2775 /var/www  
	find /var/www -type d -exec chmod 2775 {} \;  
	find /var/www -type f -exec chmod 0664 {} \;
	echo "<?php echo'Hello World" >> /var/www/html/index.php  
	echo "';?>" >> /var/www/html/index.php 
	EOF
}


