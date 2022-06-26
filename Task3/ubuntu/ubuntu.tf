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
resource "aws_security_group" "server_ubuntu" {
  name = "server_ubuntu"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "aws_network_interface" "server_ubuntu_1" {
  subnet_id       = "subnet-0ff7abd26217f41d8"
  security_groups = ["${aws_security_group.server_ubuntu.id}"]
  private_ips = ["172.31.29.19"]
 

}
resource "aws_instance" "server_ubuntu" {
  ami = lookup(var.amis_ub, var.region)
  instance_type = "t2.micro"
  key_name = "putty"
  network_interface {
     network_interface_id = "${aws_network_interface.server_ubuntu_1.id}"
     device_index = 0
  }
  tags = {
    Name = "AWS_Ubuntu"
  }
  
user_data= <<-EOF
	#!/bin/bash
	sudo apt install wget
	wget https://exadel-bucket.s3.amazonaws.com/install.sh
	chmod +x install.sh
	./install.sh
	EOF
}



