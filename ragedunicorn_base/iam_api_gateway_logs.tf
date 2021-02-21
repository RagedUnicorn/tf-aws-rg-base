###########
# IAM role
###########
data "aws_iam_policy_document" "api_gateway_assume_role_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "api_gateway_push_logs_policy_document" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents",
      "logs:GetLogEvents",
      "logs:FilterLogEvents",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role_policy" "api_gateway_push_logs_policy" {
  name   = "rg-tf-ragedunicorn-base-api-gateway-push-logs"
  role   = aws_iam_role.api_gateway_push_logs_role.name
  policy = data.aws_iam_policy_document.api_gateway_push_logs_policy_document.json
}

resource "aws_iam_role" "api_gateway_push_logs_role" {
  name        = "rg-tf-base-api-gateway-push-logs"
  description = "Allows API Gateway to push logs to CloudWatch Logs."

  assume_role_policy = data.aws_iam_policy_document.api_gateway_assume_role_policy_document.json
}
