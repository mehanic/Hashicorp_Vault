resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
  path = "minikube"
}