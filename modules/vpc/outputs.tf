output "public_subnet_id" {
  value = aws_subnet.public.id
  description = "The ID of the public subnet"
}
output "web_sg_id" {
  value       = aws_security_group.allow_web.id
  description = "ID of the security group for web access"
}
