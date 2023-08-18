output "subnet_id" {
  value = aws_subnet.subnet-terraform.vpc_id
}

output "vm_ip_publico" {
  value = aws_instance.vm-terraform-[*].public_ip
}

output "dns_load_balance" {
  value = aws_lb.load_terraform.dns_name
}
