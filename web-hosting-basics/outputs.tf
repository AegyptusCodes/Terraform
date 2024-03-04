output "private_app_private_ip" {
  value = aws_instance.private_app[*].private_ip
  description = "The private IP address of the private EC2 instance"
}

output "public_app_public_ip" {
  value = aws_instance.public_app[*].public_ip
  description = "The public IP address of the public EC2 instance"
}
