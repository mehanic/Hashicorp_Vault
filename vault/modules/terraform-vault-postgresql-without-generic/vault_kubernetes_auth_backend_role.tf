resource "vault_kubernetes_auth_backend_role" "postgres" {
  count                            = local.set_up_kubernetes_auth ? 1 : 0
  backend                          = var.vault_kubernetes_auth_path
  role_name                        = vault_database_secret_backend_role.postgres.name
  bound_service_account_names      = var.bound_service_account_names
  bound_service_account_namespaces = var.bound_service_account_namespaces
  token_ttl                        = var.default_ttl
  token_policies                   = [vault_policy.postgres.name]
}