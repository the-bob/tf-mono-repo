data "terraform_remote_state" "route53" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "route53/terraform.tfstate"
    region = "eu-north-1"
  }
}