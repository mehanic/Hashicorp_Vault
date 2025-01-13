resource "vault_policy" "this" {
  for_each = { for role in vault_database_secret_backend_role.this : role.name => role }

  name   = each.value.name
  policy = <<EOH
path "${each.value.backend}/creds/${each.value.name}" {
    capabilities = ["read"]
}
EOH 
}
