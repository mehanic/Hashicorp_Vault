terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.0" # Adjust to the latest stable version as necessary
    }

    random = {
      source = "hashicorp/random"
    }
    postgresql = {
      source = "cyrilgdn/postgresql"
    }
  }
}
