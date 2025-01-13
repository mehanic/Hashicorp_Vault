resource "vault_mount" "ssh" {
  type                      = "ssh"
  path                      = var.ssh_mount_path
  description               = var.ssh_ca_description
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  max_lease_ttl_seconds     = var.max_lease_ttl_seconds
}