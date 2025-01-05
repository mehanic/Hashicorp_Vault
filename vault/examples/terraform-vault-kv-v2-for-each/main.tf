module "terraform-vault-kv-v2-for-each" {
  source  = "../../modules/terraform-vault-kv-v2-for-each"
  
  secrets = {
    secret1 = {
      cas = 0
      data = {
        username = "admin"
        password = "supersecret"
      }
      metadata = {
        description = "Credentials for the admin user"
        tags = ["dev", "admin"]
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
        tags = ["prod", "api"]
      }
    }
    secret3 = {
      cas = 0
      data = {
        connection_string = "host=db.example.com;user=admin"
      }
      metadata = {
        description = "Database connection string"
        tags = ["prod", "db"]
      }
    }
  }
}
