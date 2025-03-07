terraform {
  required_version = ">= 1.1.8"
  backend "s3" {
    bucket = "acmecorp-tf-state-eu-north-1"
    key    = "kubernetes/terraform.tfstate"
    region = "eu-north-1"
  }
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }

}