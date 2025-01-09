output "this" {
  value = vault_database_secret_backend_role.this
}

output "role_path" {
  value = "${vault_database_secret_backend_role.this.backend}/creds/${vault_database_secret_backend_role.this.name}"
}