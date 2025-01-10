
output "transit_mount_path" {
  description = "Path where the transit backend is mounted."
  value       = vault_mount.transit.path
}

output "transit_cache_size" {
  description = "Cache size configured for the transit backend."
  value       = vault_transit_secret_cache_config.transit.size
}

output "transit_keys" {
  description = "Details of all transit keys created."
  value = {
    for key, data in vault_transit_secret_backend_key.transit :
    key => {
      name                   = data.name
      type                   = data.type
      deletion_allowed       = data.deletion_allowed
      derived                = data.derived
      convergent_encryption  = data.convergent_encryption
      exportable             = data.exportable
      allow_plaintext_backup = data.allow_plaintext_backup
      min_decryption_version = data.min_decryption_version
      min_encryption_version = data.min_encryption_version
    }
  }
}