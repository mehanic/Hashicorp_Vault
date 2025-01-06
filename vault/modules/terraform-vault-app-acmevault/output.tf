output "aws_mount_path" {
  description = "The path where the AWS secrets engine is mounted."
  value       = vault_mount.aws.path
}

output "aws_role_name" {
  description = "The name of the AWS secret backend role."
  value       = vault_aws_secret_backend_role.acmevault.name
}

output "acmevault_client_policy_name" {
  description = "The name of the Vault policy for AcmeVault clients."
  value       = vault_policy.acmevault_client.name
}

output "acmevault_server_policy_name" {
  description = "The name of the Vault policy for AcmeVault servers."
  value       = vault_policy.acmevault_server.name
}
