# ragedunicorn

> Module for ragedunicorn-base

This module is intended to create base resources for use within the RagedUnicorn organization. This includes basic roles and users that don't belong to a specific application or project or other aws resources.


## Inputs

| Name       | Description        | Type   | Default        | Required |
|------------|--------------------|--------|----------------|----------|
| access_key | The AWS access key | string | -              | yes      |
| aws_region | AWS region         | string | `eu-central-1` | no       |
| secret_key | The AWS secret key | string | -              | yes      |


## Outputs

| Name                        | Description                                    |
|-----------------------------|------------------------------------------------|
| gateway_push_logs_role_arn  | The arn name of the Api Gateway push logs role |
| gateway_push_logs_role_name | The name of the Api Gateway push logs role     |

## Creates

### Route 53 ragedunicorn domain

`route53_main`

Module creates the basic zone entry for the `ragedunicorn.com` domain.

### Api Gateway Push Logs Role

`iam_api_gateway_logs`

Module creates a basic IAM role that allows Api Gateway to push logs to CloudWatch. The module will print the arn of the created role when finished.
This arn has to be manually setup inside Api Gateway settings.

[Settings](https://eu-central-1.console.aws.amazon.com/apigateway/home?region=eu-central-1#/settings)

Subsequently logging capabilities can then be activated for Gateway APIs.
