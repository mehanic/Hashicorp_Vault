
# output "devops_policy_name" {
#   value = module.terraform-vault-init
# }

# output "role_id_ro" {
#   value     = module.terraform-vault-init
#   sensitive = true
# }

# output "secret_id_ro" {
#   value     = module.terraform-vault-init
#   sensitive = true
# }

# output "role_id_rw" {
#   value     = module.terraform-vault-init
#   sensitive = true
# }

# output "secret_id_rw" {
#   value     = module.terraform-vault-init
#   sensitive = true
# }


# output "vault_admin_policy" {
#   description = "The admin policy applied in Vault"
#   value       = module.terraform-vault-init
# }

# output "vault_devops_policy" {
#   description = "The devops policy applied in Vault"
#   value       = module.terraform-vault-init
# }

# output "vault_cicd_ro_policy" {
#   description = "The CICD read-only policy applied in Vault"
#   value       = module.terraform-vault-init
# }

# output "vault_cicd_rw_policy" {
#   description = "The CICD read-write policy applied in Vault"
#   value       = module.terraform-vault-init
# }

# output "vault_userpass_auth_backend" {
#   description = "The Userpass authentication backend path"
#   value       = module.terraform-vault-init
# }

# output "admin_user_token_ttl" {
#   description = "Token TTL for the admin user"
#   value       = module.terraform-vault-init
#   sensitive = true
# }

# output "devops_user_token_ttl" {
#   description = "Token TTL for the devops user"
#   value       = module.terraform-vault-init
#   sensitive = true
# }

# output "vault_approle_auth_backend_path" {
#   description = "The AppRole authentication backend path"
#   value       = module.terraform-vault-init
# }

# output "vault_cicd_ro_secret_id" {
#   description = "Secret ID for CICD read-only AppRole"
#   sensitive   = true
#   value       = module.terraform-vault-init
# }

# output "vault_cicd_rw_secret_id" {
#   description = "Secret ID for CICD read-write AppRole"
#   sensitive   = true
#   value       = module.terraform-vault-init
# }

# output "vault_kv_mount_path" {
#   description = "The path of the kv-v2 secrets engine"
#   value       = module.terraform-vault-init
#   sensitive = true
# }

# output "vault_ssh_secret" {
#   description = "Stored SSH keys in Vault"
#   value       = module.terraform-vault-init
#   sensitive = true
# }

# output "vault_pve_auth_user_password_secret" {
#   description = "Stored Proxmox user/password authentication secrets"
#   value       = module.terraform-vault-init
#   sensitive = true
# }

# output "vault_pve_auth_api_secret" {
#   description = "Stored Proxmox API authentication secrets"
#   value       = module.terraform-vault-init
#   sensitive = true
# }
