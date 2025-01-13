resource "vault_ssh_secret_backend_role" "ssh_backend_role" {
  name                    = var.ssh_backend_role_name
  backend                 = vault_mount.ssh.path
  key_type                = "ca"
  algorithm_signer        = var.algorithm_signer
  allow_user_certificates = true
  allowed_users           = var.allowed_users
  allowed_extensions      = var.allowed_extensions
  default_extensions      = var.default_extensions
  default_user            = var.default_user
  ttl                     = var.ttl
}