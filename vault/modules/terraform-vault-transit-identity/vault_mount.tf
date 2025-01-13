resource "vault_mount" "default" {
  path        = var.path
  type        = "transit"
  description = "Vault Secret mount for Transit engine"
}
