variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_ami" {
  description = "AMI ID for the EC2 instance"
  default = "ami-06a0cd9728546d178"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  default = "webserver"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "security_group_ingress_port" {
  description = "Ingress port for the security group"
  default     = 22
}

variable "security_group_ingress_protocol" {
  description = "Ingress protocol for the security group"
  default     = "tcp"
}

variable "security_group_ingress_cidr_block" {
  description = "CIDR block for ingress in the security group"
  default     = "0.0.0.0/0"
}
