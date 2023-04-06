# Route Table Association with Public_Subnet
resource "aws_route_table_association" "public_subnets_Assoc" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.Terraform-public.id
}

# Route Table Association with Private_Subnet
resource "aws_route_table_association" "private_subnets_Assoc" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.Terraform-private.id
}

# # Create a Route Table & Associate via NAT Gateway Route for Private subnet
# resource "aws_route_table" "RTB_Private" {
#   vpc_id = aws_vpc.LTI_VPC.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.LTI_NGW.id
#   }

#   tags = {
#     Name = "LTI_RTB_Private"
#   }
# }
