output "subnet_id" {
  value = aws_subnet.instance_subnet.id
}

output "aws_vpc_id" {
  value = aws_vpc.instance_vpc.id
}

output "sg_id" {
  value = aws_security_group.instance_security_group.id
}
