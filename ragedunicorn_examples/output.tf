#####
# S3
#####
output "s3_id" {
  description = "ID of the created bucket"
  value       = aws_s3_bucket.state_store.id
}

output "s3_arn" {
  description = "The ARN of the bucket."
  value       = aws_s3_bucket.state_store.arn
}

output "s3_bucket_domain_name" {
  description = " The bucket domain name."
  value       = aws_s3_bucket.state_store.bucket_domain_name
}

output "s3_region" {
  description = "The AWS region this bucket resides in."
  value       = aws_s3_bucket.state_store.region
}
