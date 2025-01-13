resource "vault_mount" "ssh" {
  path        = var.ssh_path
  type        = "ssh"
  description = "ssh secret engine managed by Terraform"
}
