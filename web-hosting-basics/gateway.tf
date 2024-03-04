resource "aws_internet_gateway" "fortune_app_nginx_test" {
  vpc_id = aws_vpc.web_hosting_basics.id

  tags = {
    Name = "gw IG"
  }
}
resource "aws_eip" "nat_gateway_ip" {
  domain = "vpc" 
}

resource "aws_nat_gateway" "fortune_app_nginx_test" {
  subnet_id      = aws_subnet.public.id
  allocation_id  = aws_eip.nat_gateway_ip.id  # Associate the EIP with the NAT Gateway

  tags = {
    Name = "gw NAT"
  }

  # Add dependency on the aws_internet_gateway resource
  depends_on = [aws_internet_gateway.fortune_app_nginx_test]
}
