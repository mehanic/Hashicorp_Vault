resource "vault_policy" "user_signing" {
  name   = "user_signing"
  policy = <<EOT
path "${vault_mount.ssh.path}/sign/${vault_ssh_secret_backend_role.client_keys.name}" {
    capabilities = ["create", "read", "update"]
}
EOT
}
