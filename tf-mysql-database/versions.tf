terraform {
  required_version = ">= 1.1.8"
  backend "s3" {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "mysql/terraform.tfstate"
    region = "eu-north-1"
  }
  required_providers {
    mysql = {
      source  = "terraform-providers/mysql"
      version = ">= 1.9.0"
    }
  }
}


provider "mysql" {
  endpoint = data.terraform_remote_state.database.outputs.db_instance_address
  username = data.terraform_remote_state.database.outputs.db_instance_username
  password = data.terraform_remote_state.database.outputs.db_instance_password
}