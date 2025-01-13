resource "vault_generic_secret" "this" {
  path      = local.path
  data_json = jsonencode(var.secrets)
}