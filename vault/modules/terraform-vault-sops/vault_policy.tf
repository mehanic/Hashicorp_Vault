resource "vault_policy" "kv-secret-engine-ro-policy" {
  count  = var.create_secret_engine ? 1 : 0
  name   = "${var.secret_engine}-read-only"
  policy = <<POLICY
  path "${var.secret_engine}/*" {
    capabilities = ["list", "read"]
  }
  POLICY
}
