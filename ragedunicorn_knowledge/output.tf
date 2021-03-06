#####
# S3
#####
output "id" {
  description = "Id of the created bucket"
  value       = aws_s3_bucket.ragedunicorn_knowledge.id
}

output "arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.ragedunicorn_knowledge.arn
}

output "bucket_domain_name" {
  description = " The bucket domain name"
  value       = aws_s3_bucket.ragedunicorn_knowledge.bucket_domain_name
}

output "region" {
  description = "The AWS region this bucket resides in"
  value       = aws_s3_bucket.ragedunicorn_knowledge.region
}

######
# IAM
######
output "iam_arn" {
  description = "The ARN assigned by AWS for this user."
  value       = aws_iam_user.ragedunicorn_knowledge_client_user.arn
}

output "iam_name" {
  description = "The user's name."
  value       = aws_iam_user.ragedunicorn_knowledge_client_user.name
}

output "iam_unique_id" {
  description = "The unique ID assigned by AWS."
  value       = aws_iam_user.ragedunicorn_knowledge_client_user.unique_id
}

output "iam_access_key" {
  description = "The AWS access key."
  value       = aws_iam_access_key.ragedunicorn_knowledge_client_key.id
}

output "iam_secret_key" {
  description = "The AWS secret key."
  value       = aws_iam_access_key.ragedunicorn_knowledge_client_key.secret
}
