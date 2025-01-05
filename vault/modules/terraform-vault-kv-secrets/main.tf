locals {
  path = "${var.kv_path}/${var.owner}"
}

resource "vault_generic_secret" "this" {
  path      = local.path
  data_json = jsonencode(var.secrets)
}

data "vault_policy_document" "this" {
  rule {
    description  = "Secrets policy for ${var.owner}"
    path         = "${var.kv_path}/data/${var.owner}"
    capabilities = var.capabilities
  }
}

resource "vault_policy" "this" {
  name   = var.owner
  policy = data.vault_policy_document.this.hcl
}
