resource "vault_mount" "kv-secret-engine" {
  count = var.create_secret_engine ? 1 : 0
  path  = var.secret_engine
  type  = "kv-v2"
}