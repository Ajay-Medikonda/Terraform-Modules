### EIP(Elastic IP required for NAT Gateway) AND NAT GATEWAY

resource "aws_eip" "eip_nat" {     #Created Elastic ip
  #vpc = true
  tags = {
    Name = "NAT-EIP"
  }
}