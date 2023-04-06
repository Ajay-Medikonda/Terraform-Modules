output "public_servers" {
    value = aws_instance.public-servers.*.id
}

output "private_servers" {
    value = aws_instance.private-servers.*.id
}