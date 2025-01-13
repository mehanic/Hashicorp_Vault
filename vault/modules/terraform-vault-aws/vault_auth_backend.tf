resource "vault_auth_backend" "aws" {
  type        = "aws"
  path        = var.backend_paths["aws"] # Use dynamic path
  description = "AWS Authentication Backend"
}
