variable "mount_path" {
  description = "Path where the KV secrets engine is mounted"
  type        = string
  default     = "different_secrets"
}


variable "secrets" {
  description = "Map of secrets to store in Vault along with metadata"
  type = map(object({
    cas  = number
    data = map(string)
    metadata = object({
      description = string
      tags        = list(string)
    })
  }))
  default = {
    secret1 = {
      cas = 0
      data = {
        username = "admin"
        password = "supersecret"
      }
      metadata = {
        description = "Credentials for the admin user"
        tags        = ["dev", "admin"]
      }
    }
    secret2 = {
      cas = 0
      data = {
        api_key = "12345-abcde"
        token   = "jwt-token-09876"
      }
      metadata = {
        description = "API key and token for the application"
        tags        = ["prod", "api"]
      }
    }
    secret3 = {
      cas = 0
      data = {
        connection_string = "host=db.example.com;user=admin"
      }
      metadata = {
        description = "Database connection string"
        tags        = ["prod", "db"]
      }
    }
  }
}
