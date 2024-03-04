resource "aws_route_table" "public" {
  vpc_id = aws_vpc.web_hosting_basics.id

  route {
    cidr_block        = "0.0.0.0/0"  # This is the route for internet traffic
    gateway_id        = aws_internet_gateway.fortune_app_nginx_test.id
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.web_hosting_basics.id

  route {
    cidr_block           = "0.0.0.0/0"  # This is the route for internet traffic
    nat_gateway_id       = aws_nat_gateway.fortune_app_nginx_test.id
  }
}

resource "aws_route_table_association" "public_app" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private_app" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}