resource "vault_mount" "this" {
  type = "pki"

  path        = local.path
  description = local.description
}