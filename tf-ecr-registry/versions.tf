terraform {
  required_version = ">= 1.1.8"
  backend "s3" {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "docker/terraform.tfstate"
    region = "eu-north-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.1.10"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}