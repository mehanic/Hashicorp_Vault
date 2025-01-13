resource "vault_ssh_secret_backend_ca" "sshca" {
  backend              = vault_mount.ssh.path
  generate_signing_key = var.generate_signing_key
}
