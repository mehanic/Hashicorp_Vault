module "terraform-vault-kv-secrets" {
  source = "../../modules/terraform-vault-kv-secrets"
  # Specify the path where secrets are stored (use the appropriate mount path, like "secret" for KV v2)
  kv_path = "secret"

  # Specify the owner of the secrets
  owner = "peter"

  # List of capabilities for the Vault policy (e.g., read, create, update, etc.)
  capabilities = ["read", "create", "update", "delete", "list"]

  # Define the secrets in JSON-like structure (adjust according to your requirements)
  secrets = {
    "db_username" = "admin"
    "db_password" = "supersecretpassword"
    "api_key"     = "abc123xyz456"
  }


}
