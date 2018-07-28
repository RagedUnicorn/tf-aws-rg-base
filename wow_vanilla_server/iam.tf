#############
# IAM Policy
#############
data "aws_iam_policy_document" "iam_policy_document" {
  statement {
    actions = [
      "iam:PutRolePolicy",
      "iam:PassRole",
      "iam:GetRolePolicy",
      "iam:GetRole",
      "iam:CreateRole",
      "iam:DeleteRole",
      "iam:DeleteRolePolicy",
      "iam:ListInstanceProfilesForRole",
    ]

    resources = [
      "arn:aws:iam::*:role/*",
      "arn:aws:iam::*:*",
    ]
  }
}

resource "aws_iam_user_policy" "iam_policy" {
  name   = "rg_tf_wow_vanilla_server_iam"
  user   = "${aws_iam_user.wow_vanilla_server_user.id}"
  policy = "${data.aws_iam_policy_document.iam_policy_document.json}"
}

####################
# Cloudwatch Policy
####################
data "aws_iam_policy_document" "cloudwatch_policy_document" {
  statement {
    actions = [
      "events:EnableRule",
      "events:DescribeRule",
      "events:ListTargetsByRule",
      "events:RemoveTargets",
      "events:DeleteRule",
    ]

    resources = [
      "arn:aws:events:*:*:*",
    ]
  }

  statement {
    actions = [
      "events:PutTargets",
      "events:PutRule",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_user_policy" "cloudwatch_policy" {
  name   = "rg_tf_wow_vanilla_server_cloudwatch"
  user   = "${aws_iam_user.wow_vanilla_server_user.id}"
  policy = "${data.aws_iam_policy_document.cloudwatch_policy_document.json}"
}

################
# Lambda Policy
################
data "aws_iam_policy_document" "lambda_policy_document" {
  statement {
    actions = [
      "lambda:ListVersionsByFunction",
      "lambda:GetPolicy",
      "lambda:GetFunction",
      "lambda:AddPermission",
      "lambda:RemovePermission",
      "lambda:DeleteFunction",
    ]

    resources = [
      "arn:aws:lambda:*:*:*:*",
    ]
  }

  statement {
    actions = [
      "lambda:CreateFunction",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_user_policy" "lambda_policy" {
  name   = "rg_tf_wow_vanilla_server_lambda"
  user   = "${aws_iam_user.wow_vanilla_server_user.id}"
  policy = "${data.aws_iam_policy_document.lambda_policy_document.json}"
}

#############
# EC2 Policy
#############
data "aws_iam_policy_document" "ec2_policy_document" {
  statement {
    actions = [
      "ec2:DeleteSecurityGroup",
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:RunInstances",
      "ec2:StopInstances",
      "ec2:StartInstances",
      "ec2:TerminateInstances",
      "ec2:CreateTags",
      "ec2:CreateVolume",
      "ec2:AttachVolume",
    ]

    resources = [
      "arn:aws:ec2:*:*:subnet/*",
      "arn:aws:ec2:*:*:instance/*",
      "arn:aws:ec2:*:*:volume/*",
      "arn:aws:ec2:*:*:security-group/*",
      "arn:aws:ec2:*:*:network-interface/*",
      "arn:aws:ec2:*::image/*",
      "arn:aws:ec2:*:*:*",
    ]
  }

  statement {
    actions = [
      "ec2:DescribeInstanceCreditSpecifications",
      "ec2:DescribeAccountAttributes",
      "ec2:DescribeInstanceAttribute",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeVolumes",
      "ec2:DescribeTags",
      "ec2:DescribeKeyPairs",
      "ec2:DescribeInstances",
      "ec2:DescribeImages",
      "ec2:DescribeSecurityGroups",
      "ec2:CreateSecurityGroup",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_user_policy" "ec2_policy" {
  name   = "rg_tf_wow_vanilla_server_ec2"
  user   = "${aws_iam_user.wow_vanilla_server_user.id}"
  policy = "${data.aws_iam_policy_document.ec2_policy_document.json}"
}

###########
# IAM User
###########
resource "aws_iam_user" "wow_vanilla_server_user" {
  name = "rg_cli_tf_wow_vanilla_server_deployer"
  path = "/wow_vanilla_server/"
}

resource "aws_iam_access_key" "wow_vanilla_server_key" {
  user = "${aws_iam_user.wow_vanilla_server_user.name}"
}
