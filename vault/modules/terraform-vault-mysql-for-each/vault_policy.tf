resource "vault_policy" "db_roles" {
  for_each = local.db_role_map
  name     = "${vault_database_secret_backend_role.db_roles[each.key].name}_policy"
  policy   = <<EOF
path "${vault_mount.database.path}/creds/${vault_database_secret_backend_role.db_roles[each.key].name}" {
  capabilities = ["read"]
}
EOF
}
