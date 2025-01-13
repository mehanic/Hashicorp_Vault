resource "vault_kubernetes_auth_backend_config" "minikube" {
  backend = vault_auth_backend.kubernetes.path
  # disable_iss_validation = false #Work around as this option is deprecated but gets set to 'true' sometimes on older Vault provider versions
  kubernetes_host    = var.k8s_host
  kubernetes_ca_cert = var.k8s_ca_cert
  token_reviewer_jwt = var.token_review_jwt
}