# Terraform for creating ECR Registries

* You either need to set the default credentials in `~/.aws/credentials` or if you have `sts assume role` in you org 
* Current `terraform` version used is `1.1.8` 

## First Time Provisioning

* Create the bucket (NOTE: bucket name are unique globally), the bucket is where the terraform state will be stored
```sh
aws s3 mb s3://acmecorp-tf-eu-west-1-state --region eu-west-1
```

## Some Terraform Note Once Actually Using this

* `locals.tf` - contains the needed values for the repository (*NOTE*: we can use `variables.tf` but that'll be when we fully create an `Iac` and will get this as another `ecosystem` in itself)
* `versions.tf` - this contains the definition for
* * terraform state file (I'll Delete the bucket once we go to the `real` thing)
* * version of `hashicorp/aws` provider
* * required terraform version
* * region to be deployed

## Provisioning the Infra

* terraform init
```sh
terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v4.10.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
* terraform plan
```sh
terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_ecr_repository.repositories["acmecorp-haproxy"] will be created
  + resource "aws_ecr_repository" "repositories" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "acmecorpe-haproxy"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

  # aws_ecr_repository.repositories["acmecorp-nginx"] will be created
  + resource "aws_ecr_repository" "repositories" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "acmecorpe-nginx"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

  # aws_ecr_repository.repositories["acmecorp-php-base"] will be created
  + resource "aws_ecr_repository" "repositories" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "acmecorpe-php-base"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

  # aws_ecr_repository.repositories["acmecorp-php-cli"] will be created
  + resource "aws_ecr_repository" "repositories" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "acmecorpe-php-cli"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

  # aws_ecr_repository.repositories["acmecorp-php-fpm"] will be created
  + resource "aws_ecr_repository" "repositories" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "acmecorpe-php-fpm"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

  # aws_ecr_repository.repositories["acmecorp-php-redis"] will be created
  + resource "aws_ecr_repository" "repositories" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "acmecorpe-php-redis"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

Plan: 6 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```
* terraform apply -auto-approve 
*NOTE*: -auto-approve means it will overwrite the resources in AWS immediatly without prompt
```sh
terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_ecr_repository.repositories["acmecorp-haproxy"] will be created
  + resource "aws_ecr_repository" "repositories" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "acmecorpe-haproxy"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

  # aws_ecr_repository.repositories["acmecorp-nginx"] will be created
  + resource "aws_ecr_repository" "repositories" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "acmecorpe-nginx"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

  # aws_ecr_repository.repositories["acmecorp-php-base"] will be created
  + resource "aws_ecr_repository" "repositories" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "acmecorpe-php-base"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

  # aws_ecr_repository.repositories["acmecorp-php-cli"] will be created
  + resource "aws_ecr_repository" "repositories" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "acmecorpe-php-cli"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

  # aws_ecr_repository.repositories["acmecorp-php-fpm"] will be created
  + resource "aws_ecr_repository" "repositories" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "acmecorpe-php-fpm"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

  # aws_ecr_repository.repositories["acmecorp-php-redis"] will be created
  + resource "aws_ecr_repository" "repositories" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "acmecorpe-php-redis"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
      + tags_all             = (known after apply)

      + image_scanning_configuration {
          + scan_on_push = true
        }
    }

Plan: 6 to add, 0 to change, 0 to destroy.
aws_ecr_repository.repositories["acmecorp-haproxy"]: Creating...
aws_ecr_repository.repositories["acmecorp-nginx"]: Creating...
aws_ecr_repository.repositories["acmecorp-php-fpm"]: Creating...
aws_ecr_repository.repositories["acmecorp-php-cli"]: Creating...
aws_ecr_repository.repositories["acmecorp-php-base"]: Creating...
aws_ecr_repository.repositories["acmecorp-php-redis"]: Creating...
aws_ecr_repository.repositories["acmecorp-nginx"]: Creation complete after 0s [id=acmecorpe-nginx]
aws_ecr_repository.repositories["acmecorp-php-fpm"]: Creation complete after 0s [id=acmecorpe-php-fpm]
aws_ecr_repository.repositories["acmecorp-haproxy"]: Creation complete after 0s [id=acmecorpe-haproxy]
aws_ecr_repository.repositories["acmecorp-php-base"]: Creation complete after 0s [id=acmecorpe-php-base]
aws_ecr_repository.repositories["acmecorp-php-redis"]: Creation complete after 0s [id=acmecorpe-php-redis]
aws_ecr_repository.repositories["acmecorp-php-cli"]: Creation complete after 0s [id=acmecorpe-php-cli]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.1.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.1.10 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.repositories](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->