# resource "vault_mount" "main" {
#   type        = "kv"
#   path        = var.mount_path
#   description = var.mount_description

#   options = {
#     version = "2"
#   }
# }

# resource "vault_kv_secret_backend_v2" "main" {
#   mount                = vault_mount.main.path
#   delete_version_after = var.delete_version_after
#   max_versions         = var.max_versions
#   cas_required         = var.cas_required
# }