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

resource "aws_iam_policy" "s3_policy" {
  name        = "rg-tf-ragedunicorn-design-s3"
  path        = "/ragedunicorn_design/"
  description = "ragedunicorn-design s3 policy"
  policy      = "${data.aws_iam_policy_document.s3_policy_document.json}"
}

resource "aws_iam_user_policy_attachment" "s3_policy_attach" {
  user       = "${aws_iam_user.ragedunicorn_design_user.name}"
  policy_arn = "${aws_iam_policy.s3_policy.arn}"
}

###########
# IAM User
###########
resource "aws_iam_user" "ragedunicorn_design_user" {
  name = "rg_ui_s3_admin"
  path = "/ragedunicorn_design/"
}

resource "aws_iam_access_key" "ragedunicorn_design_key" {
  user = "${aws_iam_user.ragedunicorn_design_user.name}"
}
