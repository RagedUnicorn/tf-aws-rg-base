###########
# IAM User
###########
resource "aws_iam_user" "ragedunicorn_knowledge_client_user" {
  name = "rg_ui_s3_knowledge_admin"
  path = "/ragedunicorn_knowledge_client/"
}

resource "aws_iam_access_key" "ragedunicorn_knowledge_client_key" {
  user = aws_iam_user.ragedunicorn_knowledge_client_user.name
}

#####
# S3
#####
data "aws_iam_policy_document" "s3_policy_document" {
  statement {
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      "arn:aws:s3:::ragedunicorn-knowledge",
    ]
  }

  statement {
    actions = [
      "s3:*",
    ]
    resources = [
      "arn:aws:s3:::ragedunicorn-knowledge/*",
    ]
  }
}

#############
# IAM Policy
#############
resource "aws_iam_policy" "s3_knowledge_policy" {
  name        = "rg-tf-ragedunicorn-knowledge-s3"
  path        = "/ragedunicorn_knowledge/"
  description = "ragedunicorn-knowledge s3 policy"
  policy      = data.aws_iam_policy_document.s3_policy_document.json
}

resource "aws_iam_user_policy_attachment" "s3_knowledge_policy_attach" {
  user       = aws_iam_user.ragedunicorn_knowledge_client_user.name
  policy_arn = aws_iam_policy.s3_knowledge_policy.arn
}
