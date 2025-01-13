resource "vault_policy" "prometheus" {
  name = "prometheus"

  policy = <<EOT
path "sys/metrics*" {
  capabilities = ["read", "list"]
}
EOT
}
