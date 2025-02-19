output "subnet_id" {
  description = "Subnet ID created on AWS"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  value = aws_security_group.allow_tls.id
}