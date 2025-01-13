# Create secrets dynamically using for_each
resource "vault_kv_secret_v2" "secrets" {
  for_each = var.secrets

  mount     = vault_mount.main.path
  name      = "myapp/${each.key}"
  cas       = each.value.cas
  data_json = jsonencode(each.value.data)
}
