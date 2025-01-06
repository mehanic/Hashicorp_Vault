output "aws_mount_path" {
  description = "The path where the AWS secrets engine is mounted."
  value       = module.terraform-vault-app-acmevault.aws_mount_path
}

output "aws_role_name" {
  description = "The name of the AWS secret backend role."
  value       = module.terraform-vault-app-acmevault.aws_role_name
}

output "acmevault_client_policy_name" {
  description = "The name of the Vault policy for AcmeVault clients."
  value       = module.terraform-vault-app-acmevault.acmevault_client_policy_name
}

output "acmevault_server_policy_name" {
  description = "The name of the Vault policy for AcmeVault servers."
  value       = module.terraform-vault-app-acmevault.acmevault_server_policy_name
}
