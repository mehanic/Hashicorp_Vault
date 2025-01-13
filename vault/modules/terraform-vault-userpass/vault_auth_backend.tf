resource "vault_auth_backend" "userpass" {
  type = "userpass" # type of auth method
  path = var.mount-path
  tune {
    max_lease_ttl = var.ttl
  }
}