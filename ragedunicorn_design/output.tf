#####
# S3
#####
output "id" {
  description = "Id of the created bucket"
  value       = aws_s3_bucket.ragedunicorn_design.id
}

output "arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.ragedunicorn_design.arn
}

output "bucket_domain_name" {
  description = " The bucket domain name"
  value       = aws_s3_bucket.ragedunicorn_design.bucket_domain_name
}

output "region" {
  description = "The AWS region this bucket resides in"
  value       = aws_s3_bucket.ragedunicorn_design.region
}
