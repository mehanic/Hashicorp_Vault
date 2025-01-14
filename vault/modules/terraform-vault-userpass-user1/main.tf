# provider "vault" {
#   auth_login {
#     path = "auth/userpass/login/${var.login_username}"

#     parameters = {
#       password = var.login_password
#     }
#   }
# }


//vault secrets enable -path=dev-secrets kv-v2  
resource "vault_kv_secret_v2" "creds" {
  mount     = "dev-secrets"
  name      = "creds"
  data_json = jsonencode({ password = "my-long-password" })
}

resource "vault_policy" "creds_policy" {
  name   = "creds-policy"
  policy = <<EOT
  path "dev-secrets/data/creds" {
    capabilities = ["create", "update", "read", "list"]
  }

  path "auth/userpass/login/${var.login_username}" {
    capabilities = ["read"]
  }
  EOT
}

resource "vault_generic_endpoint" "toronto_user" {
  path = "auth/userpass/users/${var.login_username}"

  data_json = jsonencode({
    password = var.login_password
    policies = "creds-policy"
  })
}



//terraform apply -target=vault_generic_endpoint.toronto_user -target=vault_policy.creds_policy --auto-approve
//vault list auth/userpass/users/                                                                                                                                      1 (0.334s) < 16:18:28

# Keys
# ----
# toronto-vault-user
