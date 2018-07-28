#####
# S3
#####
output "id" {
  description = "ID of the created bucket"
  value       = "${aws_s3_bucket.state_store.id}"
}

output "arn" {
  description = "The ARN of the bucket."
  value       = "${aws_iam_user.state_store.arn}"
}

output "bucket_domain_name" {
  description = " The bucket domain name."
  value       = "${aws_s3_bucket.state_store.bucket_domain_name}"
}

output "region" {
  description = "The AWS region this bucket resides in."
  value       = "${aws_s3_bucket.state_store.region}"
}

######
# IAM
######
output "arn" {
  description = "The ARN assigned by AWS for this user."
  value       = "${aws_iam_user.wow_vanilla_server_user.arn}"
}

output "name" {
  description = "The user's name."
  value       = "${aws_iam_user.wow_vanilla_server_user.name}"
}

output "unique_id" {
  description = "The unique ID assigned by AWS."
  value       = "${aws_iam_user.wow_vanilla_server_user.unique_id}"
}

output "access_key" {
  description = "The AWS access key."
  value       = "${aws_iam_access_key.wow_vanilla_server_key.id}"
}

output "secret_key" {
  description = "The AWS secret key."
  value       = "${aws_iam_access_key.wow_vanilla_server_key.secret}"
}
