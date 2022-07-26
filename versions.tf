terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = ">=0.27.0"
    }
  }
  required_version = ">= 0.13"
}
