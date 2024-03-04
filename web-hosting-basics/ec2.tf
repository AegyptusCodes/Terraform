resource "aws_instance" "private_app" {
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  key_name = "Fortune-Site-EK-2024"
  iam_instance_profile = "fortune-site-role-dynamodb"
  count         = 1
  subnet_id = aws_subnet.private.id
  tags = {
    Name = "${var.prefix}-instance"
  }
  vpc_security_group_ids = [
    aws_security_group.fortune_app_nginx.id
  ]
  user_data = file("../external-data/script.sh")
}
resource "aws_instance" "public_app" {
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  key_name = "Fortune-Site-EK-2024"
  count         = 1
  subnet_id = aws_subnet.public.id
  tags = {
    Name = "${var.prefix}-instance"
  }
  vpc_security_group_ids = [
    aws_security_group.fortune_app_nginx.id
  ]
  user_data = file("${path.module}/nginx_script.sh")
}