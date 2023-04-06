output vpc_name {
  value = var.vpc_name
}

output vpc_id {
  value = "${aws_vpc.default.id}"
}

output "public_subnet_list" {
  value = aws_subnet.public_subnets.*.id
}

output "private_subnet_list" {
  value = aws_subnet.private_subnets.*.id
}

output "public_subnet_list_1" {
  value = aws_subnet.public_subnets.0.id
}

output "environment" {
  value = var.environment
}

output "igw" {
  value = aws_internet_gateway.default.id
}

output aws_route_table {
  value = "${aws_route_table.Terraform-public.id}"
}