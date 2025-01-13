resource "vault_mount" "ssh" {
  type = "ssh"
  path = var.ssh_mount_path

  default_lease_ttl_seconds = "14400"  # 4h
  max_lease_ttl_seconds     = "604800" # 1 week
}