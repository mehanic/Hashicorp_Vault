# Read-Write permission on secrets stored at 'laboratory/data/*'
path "laboratory/data/*" {
  capabilities = ["create", "read", "update", "list"]
}
path "laboratory/metadata/*" {
  capabilities = ["create", "read", "update", "list"]
}

# Manage all AppRoles Secrets IDs
path "auth/approle/role/cicd-ro/secret-id" {
  capabilities = ["create", "read", "update", "list"]
}
