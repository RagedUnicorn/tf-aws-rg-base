######
# IAM
######
output "gateway_push_logs_role_name" {
  description = "The name of the Api Gateway push logs role"
  value       = aws_iam_role.api_gateway_push_logs_role.name
}

output "gateway_push_logs_role_arn" {
  description = "The arn name of the Api Gateway push logs role"
  value       = aws_iam_role.api_gateway_push_logs_role.arn
}

##########
# Route53
##########
output "dns_name_servers" {
  description = "The list of DNS name servers for the Hosted Zone"
  value       = aws_route53_zone.main_zone.name_servers
}

######
# IAM
######
output "iam_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = aws_iam_user.ragedunicorn_client_user.arn
}

output "iam_name" {
  description = "The user's name"
  value       = aws_iam_user.ragedunicorn_client_user.name
}

output "iam_unique_id" {
  description = "The unique ID assigned by AWS"
  value       = aws_iam_user.ragedunicorn_client_user.unique_id
}

output "iam_access_key" {
  description = "The AWS access key"
  value       = aws_iam_access_key.ragedunicorn_client_key.id
}

output "iam_secret_key" {
  description = "The AWS secret key"
  value       = aws_iam_access_key.ragedunicorn_client_key.secret
}
