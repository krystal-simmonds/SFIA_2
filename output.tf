output "instance_public_DNS" {
  description = "Public DNS for AWS instance"
  value       = aws_instance.default.public_dns
}
