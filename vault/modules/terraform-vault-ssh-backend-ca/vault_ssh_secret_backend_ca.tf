resource "vault_ssh_secret_backend_ca" "ssh" {
  backend = vault_mount.ssh.path

  generate_signing_key = var.ssh_generate_signing_key
  private_key          = var.ssh_private_key
  public_key           = var.ssh_public_key
}