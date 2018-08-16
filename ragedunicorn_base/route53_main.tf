######################
# Route53 Hosted Zone
######################
resource "aws_route53_zone" "main_zone" {
  name    = "ragedunicorn.com"
  comment = "main rg domain"
}
