# tf-aws-rg-base

> Base repository for RagedUnicorn aws resources

This repository is the base layer for the AWS setup of RagedUnicorn. It contains resources such as S3 buckets and IAM resources.

## Purpose

Projects that use terraform to build their infrastructure on AWS should use an IAM user that has only the privileges he absolutely needs. That user should not be created by the project itself. Instead a new entry for a project can be created inside this repository. The user of this repository is privileged enough to create new users for new projects.

Additionally terraform projects should store their state on a backend such as S3. For this an S3 store needs to be preexisting. This is also a responsibility of this repository.

## Applications

A list of applications that are managed by this repository:

| Name                  | Description                                                       |
|-----------------------|-------------------------------------------------------------------|
| ragedunicorn_backend  | The base module for creating the backend for this repository      |
| ragedunicorn_base     | The base module for the RagedUnicorn organization                 |
| ragedunicorn_design   | A module for storing and working with design objects              |
| ragedunicorn_examples | A module for storing terraform state for example projects         |
| wow_vanilla_server    | A module for creating the infrastructure for a wow vanilla server |

## Setup

### Credentials

Credentials can be setup in different ways. The modules within this repository either expects the credentials to be available via environment variables or supplied directly to terraform as variables.

```
export AWS_ACCESS_KEY_ID="[acceskey]"
export AWS_SECRET_ACCESS_KEY="[secretkey]"
export AWS_DEFAULT_REGION="eu-central-1"
```

Or directly

```
terraform apply -var 'access_key=[acceskey]' -var 'secret_key=[secretkey]'
```

If none of these are supplied terraform will ask for the variables interactively while preparing the setup

For more details see [documentation](https://www.terraform.io/docs/providers/aws/index.html).

### Terraform State Backend

The first step that needs to be done is to create the S3 bucket backend for this repository

Application `ragedunciorn_backend` will create an S3 bucket that is then subsequently used by other applications as a backend to store the terraform state.

```
cd ragedunciorn_base

# initialize terraform
terraform init

# check what terraform will create
terraform plan

# create resource
terraform apply
```

**Note:** This is the only exception of a module that creates resources but does not store its terraform state anywhere except locally. In this case the user is responsible by himself that the S3 bucket was not already created. Every other module does store its state in this bucket.

### Setup an Application

Inside the application folder initialize and then apply the terraform configuration

```
# initialize terraform
terraform init

# check what terraform will create
terraform plan

# create resource
terraform apply
```

### Creating a new Application

At the root level of the repository create a new folder with the name of the application and the following structure.

```
tf-aws-rg-base/
├── [application-name]/
│   ├── main.tf
│   ├── variables.tf
│   ├── output.tf
│   ├── [service-one].tf
│   ├── [service-two].tf
│   ├── [service-...].tf
│   └── README.md
```

| Name         | Description                                          |
|--------------|------------------------------------------------------|
| main.tf      | Basic setup for terraform S3 and AWS provider        |
| variables.tf | Variables that are needed for the setup              |
| output.tf    | Output of terraform after applying the configuration |
| [service].tf | A service such as S3 or IAM                          |
| README.md    | Description of the application and its repository    |

As a minimum an application should have an S3 service for terraform state storage. But usually an application also needs an IAM service for setting up a user that can deploy the application.

## AWS IAM Setup

> A description of how the AWS IAM Setup looks for RagedUnicorn

## Users

While it is possible to give a user both ui and cli access it is better to split those into separate users. Cli users are usually used in infrastructure tools while ui users are used for manual work in the AWS console.

### Naming Conventions

* User should begin with `rg` to show that they belong to the context of RagedUnicorn
* User should clearly show if they are a console or ui user in the form of `cli` or `ui`
* (Optional) If a user is being used in a specific tool this can be shown here
* A user should clearly show to what application he belongs
* (Optional) If a user was created for a specific service it should follow e.g. lambda
* The last part of the user should show what the intention of the user was - e.g. admin
  * possible roles are
    * admin - User that administers an application (usually a ui user)
    * deployer - A user that is used for deploying infrastructure and the application itself (usually a cli user that is used in conjunction with terraform)

```
# An example for a command line user that is being used within terraform and its role is that of an admin
rg_cli_tf_admin
# A command line user with the role of an admin
rg_cli_admin
# A command line user that is an administrator for lambda functions
rg_cli_lambda_admin
# A ui admin user
rg_ui_admin
```

### Root account
Michael Wiesendanger

Should only be used for high privileged use cases and changing IAM settings.

### Admin
rg_ui_admin

Secondary account with high privileges on services that are actually used in the context of the RagedUnicorn organization. This includes services such as EC2, VPC, Lambda, CloudWatch, Device Farm, S3 and Polly.
It does not include the ability to create or modify users, groups and policies.

### Terraform CLI
rg_cli_tf

A command line user for terraform to build create resources such as IAM users and S3 buckets for other projects. This user should be used conjunction with this repository.

### AWS CLI
rg_cli

A command line user for the AWS cli

## AWS S3 Setup

> A description of how the AWS S3 setup looks like for RagedUnicorn

Buckets that are created from this repository are exclusively used for storing terraform state. If an application requires an S3 bucket for any other use it should be able to create the bucket by itself and the configuration should be in the repository of the application.

### Naming Conventions

* Bucket name should be prefixed by `rg` to show it belongs to the RagedUnicorn organization
* Followed by `tf` to show that the bucket is managed by terraform
* End with the application name. Words should be split by a hyphen `-`

#### Setup State Backend

Application entries within this repository need to store their state inside the base S3 bucket. Following the described pattern for naming their terraform state file.

```
terraform {
  backend "s3" {
    bucket = "ragedunicorn-backend"
    key    = "[application-name].[service].terraform.tfstate"
    region = "eu-central-1"
  }
}
```

The key name should follow the following naming convention:

* Begin with the module name of the application
* Follow by the AWS service e.g. IAM, s3 etc.
* End with `.terraform.tfstate`

The terraform setup for an application itself should not be placed within this repository. An application however needs to store their terraform state within an S3 bucket that is setup by this repository.

Afterwards the backend can be setup like this:

```
terraform {
  backend "s3" {
    bucket = "[bucket-name]]"
    key    = "[application-name].terraform.tfstate"
    region = "eu-central-1"
  }
}
```
