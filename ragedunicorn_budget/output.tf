#########
# Budget
#########
output "budget_total_id" {
  description = "Id of the created resource"
  value       = "${aws_budgets_budget.budget_total.id}"
}

output "budget_ec2_id" {
  description = "Id of the created resource"
  value       = "${aws_budgets_budget.budget_ec2.id}"
}

output "budget_lambda_id" {
  description = "Id of the created resource"
  value       = "${aws_budgets_budget.budget_lambda.id}"
}

output "budget_storage_id" {
  description = "Id of the created resource"
  value       = "${aws_budgets_budget.budget_storage.id}"
}

output "budget_cloudwatch_id" {
  description = "Id of the created resource"
  value       = "${aws_budgets_budget.budget_cloudwatch.id}"
}

#############
# Cloudwatch
#############
output "account_billing_alarm_high_id" {
  description = "Id of the created resource"
  value       = "${aws_cloudwatch_metric_alarm.account_billing_alarm_high.id}"
}

output "account_billing_alarm_mid_id" {
  description = "Id of the created resource"
  value       = "${aws_cloudwatch_metric_alarm.account_billing_alarm_mid.id}"
}

#######
# SNS
######
output "billing_alarm_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = "${aws_sns_topic.billing_alarm_topic.arn}"
}
