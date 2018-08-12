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
