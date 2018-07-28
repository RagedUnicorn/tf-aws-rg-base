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
      "iam:GetUser",
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
      "lambda:UpdateFunctionConfiguration",
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
      "ec2:Describe*",
      "ec2:CreateSecurityGroup",
      "ec2:CreateSecurityGroup",
      "ec2:CreateVpc",
      "ec2:ModifyVpcAttribute",
      "ec2:CreateInternetGateway",
      "ec2:DeleteSecurityGroup",
      "ec2:AuthorizeSecurityGroup*", # AuthorizeSecurityGroup Ingress / Egress
      "ec2:RevokeSecurityGroup*", # RevokeSecurityGroup Ingress / Egress
      "ec2:RunInstances",
      "ec2:Stop*", # StopInstances
      "ec2:Start*", # StartInstances
      "ec2:TerminateInstances",
      "ec2:CreateTags",
      "ec2:CreateVolume",
      "ec2:AttachVolume",
      "ec2:AttachInternetGateway",
      "ec2:CreateSubnet",
      "ec2:ModifySubnetAttribute",
      "ec2:AllocateAddress",
      "ec2:AssociateAddress",
      "ec2:DisassociateAddress",
      "ec2:ReleaseAddress",
      "ec2:CreateRouteTable",
      "ec2:CreateRoute",
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
