resource "aws_kms_key" "vault" {
  description             = "Vault unseal key for ${var.env} environment"
  deletion_window_in_days = var.kms_deletion_window_days  # Dynamically set the deletion window period
}

resource "aws_kms_alias" "vault" {
  name          = "alias/${random_id.environment_name.hex}"  # Use the dynamic environment name
  target_key_id = aws_kms_key.vault.key_id
}

