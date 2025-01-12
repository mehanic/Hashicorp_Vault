terraform {
  required_version = "1.10.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "4.5.0" # Adjust to the latest stable version as necessary
    }

    random = {
      source = "hashicorp/random"
    }

  }
}