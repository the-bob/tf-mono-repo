data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "eks/terraform.tfstate"
    region = "eu-north-1"
  }
}

data "terraform_remote_state" "loadbalancer" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "loadbalancer/terraform.tfstate"
    region = "eu-north-1"
  }
}

data "terraform_remote_state" "route53_records" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "route53_records/terraform.tfstate"
    region = "eu-north-1"
  }
}