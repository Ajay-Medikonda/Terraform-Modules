resource "aws_iam_policy" "policy" {
  name = var.iam_policy_name
  path = "/"
  description = var.iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
            "ec2:Describe*",
            "s3:*",
        ]
        Effect = "Allow"
        Resource = "*"
        },
    ]
    })
}

resource "aws_iam_policy_attachment" "test-policy-attach" {
  name       = "iam-policy-attachment"
  roles       = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.policy.arn
}  

  