resource "aws_iam_role" "ec2-ssm" {
  name               = "ec2-ssm"
  description        = "associate ssm with ec2"
  assume_role_policy = <<EOF
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Action": "sts:AssumeRole",
                    "Principal": {
                    "Service": "ec2.amazonaws.com"
                    },
                    "Effect": "Allow",
                    "Sid": ""
                }
            ]
        }
        EOF
  managed_policy_arns = [
      data.aws_iam_policy.EC2RoleforSSM,
      data.aws_iam_policy.S3FullAccess,
      data.aws_iam_policy.SSMFullAccess,
      data.aws_iam_policy.SSMPatchAssociation,
  ]
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-ssm"
  role = aws_iam_role.ec2-ssm.name
}