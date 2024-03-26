data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
data "aws_iam_policy_document" "ec2_describe_instances_policy" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:DescribeInstances"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ec2_describe_instances_policy" {
  name        = "EC2DescribeInstancesPolicy"
  description = "Allows the assumed role to describe EC2 instances"
  policy      = data.aws_iam_policy_document.ec2_describe_instances_policy.json
}

resource "aws_iam_role_policy_attachment" "ec2_describe_instances_attachment" {
  role       = aws_iam_role.iam_for_lambda.name # Replace with the IAM role ARN
  policy_arn = aws_iam_policy.ec2_describe_instances_policy.arn
}