# ragedunicorn-backend

> The base bucket to store terraform state of all modules within this repository

This is the initial S3 bucket for storing terraform state. Because of this the user of this module is responsible for tracking the state himself. The generated state of terraform is only locally available and might get lost. All other modules within this repository should use this generated bucket to store their state.

```
terraform {
  backend "s3" {
    bucket = "ragedunicorn-backend"
    key    = "[application-name].terraform.tfstate"
    region = "eu-central-1"
  }
}
```

The key name should follow the following naming convention:

* Begin with the service name of the application
* Follow by the aws service e.g. iam, s3 etc.
* End with `.terraform.tfstate`

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
    bucket = "ragedunicorn-backend"
    key    = "[application-name].terraform.tfstate"
    region = "eu-central-1"
  }
}
```

| Name                   | Description                                    |
|------------------------|------------------------------------------------|
| id                     | ID of the created bucket                       |
| arn                    | The ARN of the bucket                          |
| bucket_domain_name     | The bucket domain name                         |
| region                 | The AWS region this bucket resides in          |
