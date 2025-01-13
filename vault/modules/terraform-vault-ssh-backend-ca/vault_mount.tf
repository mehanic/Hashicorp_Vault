resource "vault_mount" "ssh" {
  path = var.path
  type = "ssh"

  default_lease_ttl_seconds = var.default_lease
  max_lease_ttl_seconds     = var.max_lease

  seal_wrap               = var.seal_wrap
  local                   = var.local_mount
  external_entropy_access = var.external_entropy_access

  description = "The ssh secrets engine is mounted at the ssh/ path"
}