resource "aws_vpc" "instance_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_security_group" "instance_security_group" {
  vpc_id = aws_vpc.instance_vpc.id

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
  vpc_security_group_ids = [aws_security_group.instance_security_group.id]

  tags = {
    Name = var.instance_name
  }
}

resource "aws_eip" "instance_public_ip" {
  instance = aws_instance.instance1.id
  vpc      = true
}

output "public_ip" {
  value = aws_eip.instance_public_ip.public_ip
}
