
#create the iam role
resource "aws_iam_role" "ec2_instance_role" {
name = "ec2_instance_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags =  { Name = "${local.name}- aws assume role"}
  
}

# Create the iam policy for the role
resource "aws_iam_policy" "policy" {
  name        = "ec2_instance_policy"
  description = "A policy for EC2"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]

  })

  tags = { Name =  "${local.name}-aws assume policy"}

}

# Attach the policy to the role

resource "aws_iam_role_policy_attachment" "test-attach" {
        role       = aws_iam_role.ec2_instance_role.name
        policy_arn = aws_iam_policy.policy.arn
    }

 resource "aws_iam_instance_profile" "ip" {
        name = "aws_instance_profile_test_new"
        role =  aws_iam_role.ec2_instance_role.name
    }

