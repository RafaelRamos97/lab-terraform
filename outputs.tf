output "subnet_id" {
  value = aws_subnet.subnet-terraform.vpc_id
}

output "vm_ip_publico" {
  value = aws_instance.vm-terraform.public_ip
}

