#####
# S3
#####
output "id" {
  description = "ID of the created bucket"
  value       = "${aws_s3_bucket.ragedunicorn_backend.id}"
}

output "arn" {
  description = "The ARN of the bucket."
  value       = "${aws_s3_bucket.ragedunicorn_backend.arn}"
}

output "bucket_domain_name" {
  description = " The bucket domain name."
  value       = "${aws_s3_bucket.ragedunicorn_backend.bucket_domain_name}"
}

output "region" {
  description = "The AWS region this bucket resides in."
  value       = "${aws_s3_bucket.ragedunicorn_backend.region}"
}
