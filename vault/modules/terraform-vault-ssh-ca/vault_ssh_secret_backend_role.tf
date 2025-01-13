resource "vault_ssh_secret_backend_role" "kitchen" {
  name                    = var.kitchen_role_name
  backend                 = vault_mount.ssh.path
  key_type                = var.key_type
  allow_user_certificates = var.allow_user_certificates
  allowed_users           = var.allowed_users
  default_user            = var.default_user
  default_extensions      = var.default_extensions
}
