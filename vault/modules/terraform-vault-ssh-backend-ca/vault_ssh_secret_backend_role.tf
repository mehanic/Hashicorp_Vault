
resource "vault_ssh_secret_backend_role" "ssh" {
  backend = vault_ssh_secret_backend_ca.ssh.backend
  name    = var.ssh_backend_role_name

  key_type = var.ssh_key_type
  max_ttl  = var.ssh_max_ttl
  ttl      = var.ssh_default_ttl

  allow_bare_domains      = var.ssh_allow_bare_domains
  allow_host_certificates = var.ssh_allow_host_certificates
  allow_subdomains        = var.ssh_allow_subdomains
  allow_user_certificates = var.ssh_allow_user_certificates
  allow_user_key_ids      = var.ssh_allow_user_key_ids

  allowed_critical_options = var.ssh_allowed_critical_options
  allowed_domains          = var.ssh_allowed_domains
  allowed_extensions       = var.ssh_allowed_extensions
  allowed_users            = var.ssh_allowed_users

  // allowed_user_key_lengths = var.ssh_allowed_user_key_lengths
  default_extensions       = var.ssh_default_extensions
  default_critical_options = var.ssh_default_extensions

  cidr_list     = var.ssh_cidr_list
  default_user  = var.ssh_default_user
  key_id_format = var.ssh_key_id_format
}
