provider "aws" {
  region = "us-east-1"
  }
  data "aws_ami" "myami"{
  most_recent= true
  owners = ["amazon"]
  filter {
  name = "name"
  values = ["amzn2-ami-hvm*"]
  }
  }
  resource "aws_instance" "myec2" {
  ami      =data.aws_ami.myami.id
  instance_type="t2.micro"
  tags= {
  name = "instance-1"
  }
   count = 1
   }

resource "aws_vpc" "sl-vpc"{
cidr_block  ="10.0.0.0/16"
tags = {
    Name = "sl-vpc"
}
}
