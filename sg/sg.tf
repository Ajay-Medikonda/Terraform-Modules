# Create a Security Group
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic"
  #vpc_id      = aws_vpc.default.id   Here it is dependency and will not create in this module, i.e Vpc id will be created in Vpc Module
  vpc_id = var.vpc_id

  ingress {
    # description = "TLS from VPC"
    from_port = 0
    to_port   = 0
    protocol  = -1
    #cidr_blocks = [aws_vpc.LTI_VPC.cidr_block]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
