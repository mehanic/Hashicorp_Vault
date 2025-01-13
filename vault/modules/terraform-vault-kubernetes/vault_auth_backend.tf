resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
  path = var.k8s_path
}