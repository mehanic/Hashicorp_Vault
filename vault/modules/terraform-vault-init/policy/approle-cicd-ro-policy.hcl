# Read-only permission on secrets stored at 'laboratory/data/*'
path "laboratory/data/*" {
  capabilities = ["read", "list"]
}
path "laboratory/metadata/*" {
  capabilities = ["read", "list"]
}

# Manage all AppRole Secrets IDs
path "auth/approle/role/cicd-ro/secret-id" {
  capabilities = ["create", "read", "update", "list"]
}
