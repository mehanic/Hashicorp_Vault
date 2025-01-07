terraform {
  required_version = "1.10.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.0" # Adjust to the latest stable version as necessary
    }

    sops = {
      source  = "carlpett/sops"
      version = "0.7.1" # Adjust as needed
    }
  }
}