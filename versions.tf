terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    auth0 = {
      source  = "alexkappa/auth0"
      version = "0.19.0"
    }
  }
}
