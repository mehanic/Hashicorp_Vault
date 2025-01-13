data "vault_policy_document" "this" {
  rule {
    description  = "Secrets policy for ${var.owner}"
    path         = "${var.kv_path}/data/${var.owner}"
    capabilities = var.capabilities
  }
}