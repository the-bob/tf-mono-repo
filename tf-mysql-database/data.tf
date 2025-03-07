data "terraform_remote_state" "database" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "rds/terraform.tfstate"
    region = "eu-north-1"
  }
}