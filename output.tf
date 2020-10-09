output "instance_public_DNS" {
  description = "Public DNS for Jenkins instance"
  value       = aws_instance.jenkins.public_dns
}

output "instance_public_DNS" {
  description = "Public DNS for test instance"
  value       = aws_instance.test.public_dns
}


