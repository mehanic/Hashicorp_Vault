resource "vault_ssh_secret_backend_role" "ssh_ca_role" {
  name                    = var.ssh_ca_role
  backend                 = vault_mount.ssh.path
  key_type                = "ca"
  allowed_users           = var.ssh_ca_allowed_users
  allow_user_certificates = true
  default_extensions      = var.ssh_ca_default_extensions
  allow_user_key_ids      = false
  key_id_format           = "{{token_display_name}}"
  ttl                     = var.ssh_ca_ttl
}

resource "vault_ssh_secret_backend_role" "ssh_otp_role" {
  name          = var.ssh_otp_role
  backend       = vault_mount.ssh.path
  key_type      = "otp"
  default_user  = var.ssh_otp_default_user
  allowed_users = var.ssh_otp_allowed_users
  cidr_list     = var.ssh_otp_cidr_list
}
