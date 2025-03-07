data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "network/terraform.tfstate"
    region = "eu-north-1"
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "eks/terraform.tfstate"
    region = "eu-north-1"
  }
}

data "terraform_remote_state" "acm" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "acm/terraform.tfstate"
    region = "eu-north-1"
  }
}