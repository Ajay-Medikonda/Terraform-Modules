resource "aws_nat_gateway" "default-nat" {      #Created NAt_Gatway 
  allocation_id = aws_eip.eip_nat.id            #eip is Allocated to Nat Gatway 
  #subnet_id = aws_subnet.public-subnets.0.id    #Nat Attached to Public Subnet
  subnet_id = var.public-subnet1

  tags = {
    Name = "Ajay-nat"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.connection {
  #depends_on = [ aws_internet_gateway.default ]
  depends_on = [var.igw_depends_on]
}