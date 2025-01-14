# Uncomment the following block to enable the Vault authentication method userpass
resource "vault_auth_backend" "userpass" {
  type = "userpass"
  path = "userpass"
}

# Uncomment the following block to enable the Vault AppRole authentication backend
resource "vault_auth_backend" "approle" {
  type = "approle"
  path = "approle_generic_endpoint"
}
