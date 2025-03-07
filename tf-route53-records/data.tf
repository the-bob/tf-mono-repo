data "terraform_remote_state" "loadbalancer" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "loadbalancer/terraform.tfstate"
    region = "eu-north-1"
  }
}

data "terraform_remote_state" "route53" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "route53/terraform.tfstate"
    region = "eu-north-1"
  }
}

data "terraform_remote_state" "redis" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "redis/terraform.tfstate"
    region = "eu-north-1"
  }
}

data "terraform_remote_state" "database" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "rds/terraform.tfstate"
    region = "eu-north-1"
  }
}