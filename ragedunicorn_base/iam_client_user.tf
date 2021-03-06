###########
# IAM User
###########
resource "aws_iam_user" "ragedunicorn_client_user" {
  name = "rg_ui_s3_admin"
  path = "/ragedunicorn_client/"
}

resource "aws_iam_access_key" "ragedunicorn_client_key" {
  user = aws_iam_user.ragedunicorn_client_user.name
}

#####
# S3
#####
data "aws_iam_policy_document" "s3_policy_document" {
  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "*",
    ]
  }
}

#############
# IAM Policy
#############
resource "aws_iam_policy" "s3_video_policy" {
  name        = "rg-tf-ragedunicorn-video-s3"
  path        = "/ragedunicorn_video/"
  description = "ragedunicorn-video s3 policy"
  policy      = data.aws_iam_policy_document.s3_policy_document.json
}

resource "aws_iam_user_policy_attachment" "s3_video_policy_attach" {
  user       = aws_iam_user.ragedunicorn_client_user.name
  policy_arn = aws_iam_policy.s3_video_policy.arn
}

resource "aws_iam_policy" "s3_design_policy" {
  name        = "rg-tf-ragedunicorn-design-s3"
  path        = "/ragedunicorn_design/"
  description = "ragedunicorn-design s3 policy"
  policy      = data.aws_iam_policy_document.s3_policy_document.json
}

resource "aws_iam_user_policy_attachment" "s3_design_policy_attach" {
  user       = aws_iam_user.ragedunicorn_client_user.name
  policy_arn = aws_iam_policy.s3_design_policy.arn
}
