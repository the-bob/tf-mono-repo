data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "network/terraform.tfstate"
    region = "eu-north-1"
  }
}
