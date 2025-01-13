resource "vault_generic_secret" "kvv2" {
  path      = "${vault_mount.kvv2.path}/${var.path-postfix}"
  data_json = <<EOT
  {
    "password": "bar",
    "user": "foo"
  }
  EOT
}
