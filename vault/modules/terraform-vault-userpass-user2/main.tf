# Userpass auth method is already enabled, so no need to recreate it
# vault_generic_endpoint allows HTTP API calls through Vault
# Userpass auth method is already enabled, so no need to recreate it
resource "vault_generic_endpoint" "danielle-user" {
  path                 = "auth/userpass/users/toronto-vault-user" # Directly refer to 'userpass' path
  ignore_absent_fields = true

  data_json = <<EOT
{
  "token_policies": ["developer-vault-policy"],
  "password": "pass"
}
EOT
}

resource "vault_policy" "developer-vault-policy" {
  name = "developer-vault-policy"

  policy = <<EOT
path "dev-secrets/+/creds" {
  capabilities = ["create", "update"]
}
path "dev-secrets/+/creds" {
  capabilities = ["read"]
}
## Vault TF provider requires ability to create a child token
path "auth/token/create" {  
  capabilities = ["create", "update", "sudo"]  
}
EOT
}

resource "vault_mount" "dev-secrets" {
  path    = "dev-secrets1"
  type    = "kv"
  options = { version = "2" }
}

