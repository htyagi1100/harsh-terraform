provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2R26BF2A4TZRYEPO"
  secret_key = "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"
}




resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}


resource "aws_security_group" "sec-grp" {
  name = "sec-grp"
  description = "Allow HTTP and SSH traffic via Terraform"
  tags  = {
    Name = "sec-grp"
    Env  = "test"
  }
  
  
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




------------------------------------------------------------------------------
provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2R26BF2A4TZRYEPO"
  secret_key = "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"
}




resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}


# creating security group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  dynamic "ingress" {
    for_each = [80,8080,443,9090,9000]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


