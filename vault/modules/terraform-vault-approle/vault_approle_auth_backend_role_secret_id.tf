resource "vault_approle_auth_backend_role_secret_id" "id" {
  backend   = var.approle_path
  role_name = var.role_name

  metadata   = <<EOT
{
  "source": "Generated by Terraform Vault Provider"
}
EOT
  depends_on = [vault_approle_auth_backend_role.terraform]
}