output "vault_mount" {
  description = "Exported Attributes for `vault_mount`."
  value       = module.terraform-vault-kv-v2.vault_mount
}

output "vault_kv_secret_backend_v2" {
  description = "Exported Attributes for `vault_kv_secret_backend_v2`."
  value       = module.terraform-vault-kv-v2.vault_kv_secret_backend_v2
}
