# ragedunicorn-examples

> Module for ragedunicorn-examples

This module creates an S3 bucket for example related resources.

## Inputs

| Name       | Description        | Type   | Default        | Required |
|------------|--------------------|--------|----------------|----------|
| access_key | The AWS access key | string | -              | yes      |
| aws_region | AWS region         | string | `eu-central-1` | no       |
| secret_key | The AWS secret key | string | -              | yes      |

## Outputs

#### S3 Bucket

```
terraform {
  backend "s3" {
    bucket = "ragedunicorn-examples"
    key    = "ragedunicorn-examples.terraform.tfstate"
    region = "eu-central-1"
  }
}
```

| Name               | Description                            |
|--------------------|----------------------------------------|
| id                 | ID of the created bucket               |
| arn                | The ARN of the bucket                  |
| bucket_domain_name | The bucket domain name                 |
| region             | The AWS region this bucket resides in  |
