##########
# Budgets
##########
resource "aws_budgets_budget" "budget_total" {
  name              = "rg-tf-budget-total-monthly"
  budget_type       = "COST"
  limit_amount      = "60"
  limit_unit        = "USD"
  time_period_start = "2018-01-01_00:00"
  time_unit         = "MONTHLY"
}

resource "aws_budgets_budget" "budget_ec2" {
  name              = "rg-tf-budget-ec2-monthly"
  budget_type       = "COST"
  limit_amount      = "20"
  limit_unit        = "USD"
  time_period_start = "2018-01-01_00:00"
  time_unit         = "MONTHLY"

  cost_filters = {
    Service = "Amazon Elastic Compute Cloud - Compute"
  }
}

resource "aws_budgets_budget" "budget_lambda" {
  name              = "rg-tf-budget-lambda-monthly"
  budget_type       = "COST"
  limit_amount      = "5"
  limit_unit        = "USD"
  time_period_start = "2018-01-01_00:00"
  time_unit         = "MONTHLY"

  cost_filters = {
    Service = "AWS Lambda"
  }
}

resource "aws_budgets_budget" "budget_storage" {
  name              = "rg-tf-budget-storage-monthly"
  budget_type       = "COST"
  limit_amount      = "5"
  limit_unit        = "USD"
  time_period_start = "2018-01-01_00:00"
  time_unit         = "MONTHLY"

  cost_filters = {
    Service = "Amazon Simple Storage Service"
  }
}

resource "aws_budgets_budget" "budget_cloudwatch" {
  name              = "rg-tf-budget-cloudwatch-monthly"
  budget_type       = "COST"
  limit_amount      = "5"
  limit_unit        = "USD"
  time_period_start = "2018-01-01_00:00"
  time_unit         = "MONTHLY"

  cost_filters = {
    Service = "AmazonCloudWatch"
  }
}

###################
# Cloudwatch alarm
###################
resource "aws_cloudwatch_metric_alarm" "account_billing_alarm_high" {
  alarm_name          = "rg-tf-account-billing-alarm-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600"
  statistic           = "Average"
  threshold           = "60"
  alarm_description   = "Billing alarm for linked account. Highest expected value."
  alarm_actions       = [aws_sns_topic.billing_alarm_topic.arn]

  dimensions = {
    Currency      = "USD"
    LinkedAccount = var.linked_account
  }
}

resource "aws_cloudwatch_metric_alarm" "account_billing_alarm_mid" {
  alarm_name          = "rg-tf-account-billing-alarm-mid"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600"
  statistic           = "Average"
  threshold           = "30"
  alarm_description   = "Billing alarm for linked account. Mid expected value."
  alarm_actions       = [aws_sns_topic.billing_alarm_topic.arn]

  dimensions = {
    Currency      = "USD"
    LinkedAccount = var.linked_account
  }
}

#######
# SNS
######
resource "aws_sns_topic" "billing_alarm_topic" {
  name = "rg-tf-billing-alarm"
}
