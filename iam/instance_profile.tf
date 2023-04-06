resource "aws_iam_instance_profile" "iam_instance_profile" {
    name = "${var.instanceprofilename}" 
    role = "${aws_iam_role.ec2_role.name}" 
}
