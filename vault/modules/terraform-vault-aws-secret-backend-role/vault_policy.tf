resource "vault_policy" "dyndns" {
  name = vault_aws_secret_backend_role.dyndns.name

  policy = <<EOT
path "${var.aws_secret_backend_path}/creds/${vault_aws_secret_backend_role.dyndns.name}" {
  capabilities = ["read"]
}
EOT
}