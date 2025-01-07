resource "vault_auth_backend" "userpass" {
  type = "userpass" # type of auth method
  path = var.mount-path
  tune {
    max_lease_ttl = var.ttl
  }
}
# create user and password
resource "vault_generic_endpoint" "user" {
  path       = "auth/${var.mount-path}/users/${var.user}"
  data_json  = <<EOT
  {
    "policies": ["mypolicy"],
    "password": "changeme"
  }
  EOT
  depends_on = [vault_auth_backend.userpass]
}
