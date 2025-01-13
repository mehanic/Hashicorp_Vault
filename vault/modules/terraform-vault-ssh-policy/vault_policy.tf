
resource "vault_policy" "ssh_backend_policy" {
  name   = "ssh_backend_policy"
  policy = <<EOF
path "${vault_mount.ssh.path}/sign/${vault_ssh_secret_backend_role.ssh_backend_role.name}" {
    capabilities = ["create", "update"]
    }
EOF
}