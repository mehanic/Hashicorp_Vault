resource "vault_ssh_secret_backend_role" "client_keys" {
  name     = var.client_keys_role_name
  backend  = vault_mount.ssh.path
  key_type = var.key_type

  allow_host_certificates = var.allow_host_certificates
  allow_subdomains        = var.allow_subdomains
  allow_user_key_ids      = var.allow_user_key_ids
  allow_user_certificates = var.allow_user_certificates
  default_extensions      = var.default_extensions
  allowed_extensions      = var.allowed_extensions
  default_user            = var.default_user
  allowed_users           = var.allowed_users
  max_ttl                 = var.max_ttl
  ttl                     = var.ttl
  cidr_list               = var.cidr_list
}
