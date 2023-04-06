#Create Instance
resource "aws_instance" "public-servers" {
    count = var.environment == "production" ? 3 : 1
    ami = var.imagename 
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = element(var.public-subnets, count.index)
    vpc_security_group_ids = [var.sg]
    associate_public_ip_address = true
    iam_instance_profile = "var.iam_instance_profile" 	
    tags = {
        Name = "${var.vpc_name}-PublicServer-${count.index + 1}"
        Env = "Pro"
        Owner = "Ajay"
        Costcenter = "ABCD"
    }
    user_data = <<EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx jq
    sudo systemctl start nginx
    sudo systemctl enable nginx
    echo "<h1>Deployed via Terraform<h1>" | sudo tee -a/var/www/html/index.nginx-debain.html
    echo "<h1>${var.vpc_name}-public-server-${count.index + 1}<h1>" | sudo tee -a/var/www/html/index.nginx-debain.html
    EOF
}
 
# user_data = <<EOF
#     #!/bin/bash
#     yum update -y
#     yum install -y httpd.x86_64
#     systemctl start httpd.service
#     systemctl enable httpd.service
#     echo ?Hello World from $(hostname -f)? > /var/www/html/index.htm
#     EOF