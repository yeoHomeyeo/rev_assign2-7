locals {
  resource_prefix = "chrisyeo-assign2-7-tf"
  key_pair_name   = "chrisyeo-key-pair"
   
}

# Find the latest Amazon Linux AMI in us-east-1
data "aws_ami" "amazon_linux_latest" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*"]
  }
}

# EC2 creation
resource "aws_instance" "public" {
  ami                         = data.aws_ami.amazon_linux_latest.id #Challenge, find the AMI ID of Amazon Linux 2 in us-east-1
  instance_type               = var.my_inst_type
  subnet_id                   = var.mysubnet_id
  associate_public_ip_address = true
  key_name                    = local.key_pair_name #Change to your keyname, e.g. jazeel-key-pair
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "${local.resource_prefix}-ec2" #chrisyeo-assign2-3var-tf
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "${local.resource_prefix}-secgrp" #Security group name, e.g. jazeel-terraform-security-group
  description = "Allow SSH inbound"
  vpc_id      = var.myvpc_id #VPC ID (Same VPC as your EC2 subnet above), E.g. vpc-xxxxxxx

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"] # Restrict this in production!
  }

tags = {
    Name = "ssh-security-group"
  }

}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}