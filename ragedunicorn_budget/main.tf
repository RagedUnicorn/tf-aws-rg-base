terraform {
  backend "s3" {
    bucket = "ragedunicorn-backend"
    key    = "ragedunicorn-budget.terraform.tfstate"
    region = "eu-central-1"
  }
}

###############
# AWS provider
###############
provider "aws" {
  version    = "~> 1.31"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.aws_region}"
}
