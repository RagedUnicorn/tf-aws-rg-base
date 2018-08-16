######
# IAM
######
output "gateway_push_logs_role_name" {
  description = "The name of the Api Gateway push logs role"
  value       = "${aws_iam_role.api_gateway_push_logs_role.name}"
}

output "gateway_push_logs_role_arn" {
  description = "The arn name of the Api Gateway push logs role"
  value       = "${aws_iam_role.api_gateway_push_logs_role.arn}"
}

##########
# Route53
##########
output "dns_name_servers" {
  description = "The list of DNS name servers for the Hosted Zone"
  value       = "${aws_route53_zone.main_zone.name_servers}"
}
