output "kv_secret_engine_path" {
  description = "The path where the KV secret engine is mounted."
  value       = var.create_secret_engine ? var.secret_engine : ""
  sensitive   = false
}

output "kv_secret_engine_policy" {
  description = "The name of the read-only policy for the KV secret engine."
  value = (
    var.create_secret_engine && length(vault_policy.kv-secret-engine-ro-policy) > 0
    ? vault_policy.kv-secret-engine-ro-policy[0].name
    : ""
  )
  sensitive = false
}

output "sops_secrets" {
  description = "List of secrets managed by SOPS and stored in Vault."
  value       = [for key in keys(data.sops_file.file) : "${var.secret_engine}/${key}"]
}

output "vault_generic_secrets" {
  description = "Paths of all secrets uploaded to Vault from SOPS files."
  value = [
    for key in keys(vault_generic_secret.secret) : {
      path   = vault_generic_secret.secret[key].path
      secret = vault_generic_secret.secret[key].data_json
    }
  ]
  sensitive = true
}
