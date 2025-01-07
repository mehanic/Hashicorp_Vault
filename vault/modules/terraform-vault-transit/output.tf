output "transit_mount_path" {
  description = "Path where the transit secret engine is mounted."
  value       = length(vault_mount.transit) > 0 ? vault_mount.transit[0].path : null
}

output "policy_name" {
  description = "The name of the created policy."
  value       = vault_policy.occult.name
}

output "transit_keys" {
  description = "Details of the created transit secret backend keys."
  value = {
    for key_name, key in vault_transit_secret_backend_key.key :
    key_name => {
      name             = key.name
      backend          = key.backend
      exportable       = key.exportable
      allow_backup     = key.allow_plaintext_backup
      deletion_allowed = key.deletion_allowed
      type             = key.type
    }
  }
}
