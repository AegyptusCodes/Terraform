resource "aws_security_group" "fortune_app_nginx" {
  name        = "fortune_app_nginx"
  description = "Security group for fortune app to allow all inbound and outbound traffic"
  vpc_id      = aws_vpc.web_hosting_basics.id

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fortune_app_nginx"
  }
}
