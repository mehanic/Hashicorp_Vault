resource "vault_ssh_secret_backend_ca" "ssh_backend" {
  backend              = vault_mount.ssh.path
  generate_signing_key = true
}
