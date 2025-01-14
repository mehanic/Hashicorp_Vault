# List all available AppRoles
path "auth/approle/role" {
  capabilities = ["list"]
}

# Manage all AppRoles and Secrets IDs
path "auth/approle/role/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
