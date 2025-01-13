resource "vault_kubernetes_auth_backend_role" "k8s_role" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = var.k8s_role
  bound_service_account_names      = ["${var.kubernetes_sa}"]
  bound_service_account_namespaces = ["${var.kubernetes_namespace}"]
  token_ttl                        = 3600
  token_policies                   = ["default", "${var.policy_name}"]
}