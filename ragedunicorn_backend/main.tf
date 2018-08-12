###############
# AWS provider
###############
provider "aws" {
  version    = "~> 1.31"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.aws_region}"
}
