module "terraform-vault-kv-v2" {
  source = "../../modules/terraform-vault-kv-v2"
  # Description for the KV secret engine mount
  mount_description = "Terraform-managed KV (v2) Secret Backend."

  # Path where the secret engine will be mounted
  mount_path = "kv"

  # Number of versions to retain for each key
  max_versions = 5

  # Enable check-and-set (CAS) on write operations
  cas_required = true

  # Duration before versions are automatically deleted (null means disabled)
  delete_version_after = null
}
