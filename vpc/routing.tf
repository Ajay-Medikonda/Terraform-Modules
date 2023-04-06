# Create a Route Table & Associate with Internet Gateway route for Public Subnet
resource "aws_route_table" "Terraform-public" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = "${var.vpc_name}-public-Table"
  }
}

# Create a Route Table & Associate with Internet Gateway route for Public Subnet
resource "aws_route_table" "Terraform-private" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_id
    #nat_gateway_id = aws_nat_gateway.default-nat.id
  }

  tags = {
    Name = "${var.vpc_name}-private-Table"
  }
}