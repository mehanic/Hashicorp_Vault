resource "vault_mount" "ssh" {
  depends_on = [var.module_depends_on]
  type       = "ssh"
  path       = var.ssh_secret_path
}
