# Declare vault_mount in the root module
resource "vault_mount" "main" {
  type        = "kv"
  path        = var.mount_path
  description = "Key-Value Secrets Engine for my app"

  options = {
    version = "2"
  }
}

# Create secrets dynamically using for_each
resource "vault_kv_secret_v2" "secrets" {
  for_each = var.secrets

  mount     = vault_mount.main.path
  name      = "myapp/${each.key}"
  cas       = each.value.cas
  data_json = jsonencode(each.value.data)
}
