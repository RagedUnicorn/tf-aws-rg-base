######################
# Route53 Hosted Zone
######################
resource "aws_route53_zone" "main_zone" {
  name    = "ragedunicorn.com"
  comment = "main rg domain"

  tags {
    Type         = "rg-generated"
    Organization = "ragedunicorn"
    Name         = "tf-ragedunicorn-base"
    Description  = "Ragedunicorn Route53 zone entry"
    Environment  = "prod"
  }
}
