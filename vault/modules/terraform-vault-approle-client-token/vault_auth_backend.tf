resource "vault_auth_backend" "approle" {
  type = "approle" # auth method type
  path = var.mount-path
  # modify some configurations of userpass
  tune {
    max_lease_ttl = var.ttl
  }

}