terraform {
  required_version = "1.10.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.0" # Adjust to the latest stable version as necessary
    }
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.61.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}