output "mongodb_connection_name" {
  description = "The name of the MongoDB connection."
  value       = module.terraform-vault-mongo-oidc.mongodb_connection_name
}

output "mongodb_connection_allowed_roles" {
  description = "The allowed roles for the MongoDB connection."
  value       = module.terraform-vault-mongo-oidc.mongodb_connection_allowed_roles
}

output "mongodb_role_name" {
  description = "The name of the MongoDB role."
  value       = module.terraform-vault-mongo-oidc.mongodb_role_name
}

output "mongodb_role_creation_statements" {
  description = "The creation statements for the MongoDB role."
  value       = module.terraform-vault-mongo-oidc.mongodb_role_creation_statements
}

output "mongodb_user_policy_name" {
  description = "The name of the MongoDB user policy."
  value       = module.terraform-vault-mongo-oidc.mongodb_user_policy_name
}

output "mongodb_user_policy_document" {
  description = "The policy document associated with the MongoDB user."
  value       = module.terraform-vault-mongo-oidc.mongodb_user_policy_document
}
