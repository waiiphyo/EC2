resource "aws_vpc" "instance_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "instance_subnet" {
  vpc_id = aws_vpc.instance_vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = var.subnet_availability_zone
  map_public_ip_on_launch = var.subnet_map_public_ip_on_launch
  tags = {
    Name = var.subnet_name
  }
}

resource "aws_security_group" "instance_security_group" {
  vpc_id = aws_vpc.instance_vpc.id
  tags = {
    Name = var.sg_name
  }

  ingress {
    from_port   = var.security_group_ingress_port
    to_port     = var.security_group_ingress_port
    protocol    = var.security_group_ingress_protocol
    cidr_blocks = [var.security_group_ingress_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "instance1" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.instance_subnet.id
  vpc_security_group_ids = [aws_security_group.instance_security_group.id]

  tags = {
    Name = var.instance_name
  }
}

