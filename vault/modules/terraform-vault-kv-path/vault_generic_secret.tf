resource "vault_generic_secret" "secret" {
  path      = var.secret_path
  data_json = var.secret_data

  depends_on = [vault_mount.kv]
}