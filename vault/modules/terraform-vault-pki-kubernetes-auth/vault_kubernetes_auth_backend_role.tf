resource "vault_kubernetes_auth_backend_role" "role1" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "role1"
  bound_service_account_names      = ["app-sa"]
  bound_service_account_namespaces = ["*"]
  token_ttl                        = 3600
  token_max_ttl                    = 28800
  token_policies                   = ["default", vault_policy.pki-app1.name]
}