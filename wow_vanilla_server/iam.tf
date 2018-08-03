#############
# IAM Policy
#############
data "aws_iam_policy_document" "iam_policy_document" {
  statement {
    actions = [
      "iam:GetRole",
      "iam:ListInstanceProfilesForRole",
      "iam:PassRole",
      "iam:DeleteRolePolicy",
      "iam:DeleteRole",
      "iam:CreateRole",
      "iam:PutRolePolicy",
      "iam:GetUser",
      "iam:GetRolePolicy",
    ]

    resources = [
      "arn:aws:iam::*:user/*",
      "arn:aws:iam::*:role/*",
    ]
  }
}

resource "aws_iam_policy" "iam_policy" {
  name        = "rg-tf-wow-vanilla-server-iam"
  path        = "/wow_vanilla_server/"
  description = "wow-vanilla-server iam policy"
  policy      = "${data.aws_iam_policy_document.iam_policy_document.json}"
}

resource "aws_iam_user_policy_attachment" "iam_policy_attach" {
  user       = "${aws_iam_user.wow_vanilla_server_user.name}"
  policy_arn = "${aws_iam_policy.iam_policy.arn}"
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

resource "aws_iam_policy" "cloudwatch_policy" {
  name        = "rg-tf-wow-vanilla-server-cloudwatch"
  path        = "/wow_vanilla_server/"
  description = "wow-vanilla-server cloudwatch policy"
  policy      = "${data.aws_iam_policy_document.cloudwatch_policy_document.json}"
}

resource "aws_iam_user_policy_attachment" "cloudwatch_policy_attach" {
  user       = "${aws_iam_user.wow_vanilla_server_user.name}"
  policy_arn = "${aws_iam_policy.cloudwatch_policy.arn}"
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

resource "aws_iam_policy" "lambda_policy" {
  name        = "rg-tf-wow-vanilla-server-lambda"
  path        = "/wow_vanilla_server/"
  description = "wow-vanilla-server lambda policy"
  policy      = "${data.aws_iam_policy_document.lambda_policy_document.json}"
}

resource "aws_iam_user_policy_attachment" "lambda_policy_attach" {
  user       = "${aws_iam_user.wow_vanilla_server_user.name}"
  policy_arn = "${aws_iam_policy.lambda_policy.arn}"
}

#############
# EC2 Policy
#############
data "aws_iam_policy_document" "ec2_policy_document" {
  statement {
    actions = [
      "ec2:DescribeImages",
      "ec2:DescribeInstances",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeTags",
      "ec2:DescribeInstanceAttribute",
      "ec2:DescribeVolumes",
      "ec2:DescribeAccountAttributes",
      "ec2:DescribeKeyPairs",
      "ec2:DescribeInstanceCreditSpecifications",
      "ec2:DescribeSecurityGroups",
      "ec2:CreateSecurityGroup",
      "ec2:DescribeVpcs",
      "ec2:DescribeVpcAttribute",
      "ec2:DescribeRouteTables",
      "ec2:DescribeInternetGateways",
      "ec2:DescribeSubnets",
      "ec2:DescribeAddresses",
      "ec2:CreateVpc",
      "ec2:AllocateAddress",
      "ec2:AssociateAddress",
      "ec2:CreateInternetGateway",
      "ec2:AssociateRouteTable",
      "ec2:AttachInternetGateway",
      "ec2:CreateSubnet",
      "ec2:DeleteSubnet",
      "ec2:DisassociateRouteTable",
      "ec2:ReplaceRouteTableAssociation",
      "ec2:CreateSecurityGroup",
      "ec2:ModifyVpcAttribute",
      "ec2:ModifySubnetAttribute",
      "ec2:DisassociateAddress",
      "ec2:ReleaseAddress",
      "ec2:CreateRouteTable",
      "ec2:DetachInternetGateway",
      "ec2:DeleteVpc",
      "ec2:AttachVolume",
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:TerminateInstances",
      "ec2:DeleteTags",
      "ec2:CreateTags",
      "ec2:RunInstances",
      "ec2:StopInstances",
      "ec2:CreateVolume",
      "ec2:DeleteRouteTable",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:StartInstances",
      "ec2:CreateRoute",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:DeleteSecurityGroup",
      "ec2:DeleteInternetGateway",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "ec2_policy" {
  name        = "rg-tf-wow-vanilla-server-ec2"
  path        = "/wow_vanilla_server/"
  description = "wow-vanilla-server ec2 policy"
  policy      = "${data.aws_iam_policy_document.ec2_policy_document.json}"
}

resource "aws_iam_user_policy_attachment" "ec2_policy_attach" {
  user       = "${aws_iam_user.wow_vanilla_server_user.name}"
  policy_arn = "${aws_iam_policy.ec2_policy.arn}"
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
