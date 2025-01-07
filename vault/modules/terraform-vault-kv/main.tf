resource "vault_mount" "kvv2" {
  path        = var.mount-path # location to mount the kv secrets engine
  type        = "kv-v2"        # type of backend
  description = "kv-v2 mount path"
}
resource "vault_generic_secret" "kvv2" {
  path      = "${vault_mount.kvv2.path}/${var.path-postfix}"
  data_json = <<EOT
  {
    "password": "bar",
    "user": "foo"
  }
  EOT
}

data "vault_policy_document" "policy_documents" {
  rule {
    path         = "${var.mount-path}/data/mysecrets"
    capabilities = ["update", "create", "read", "delete", "list", "sudo"]
    description  = "grants most permissions, including sudo"
  }
  rule {
    path         = "${var.mount-path}/data/certs"
    capabilities = ["update", "create", "read"]
    description  = "create, overwrite and read access"
  }
}
# creates acl policy for kv
resource "vault_policy" "acl" {
  name = var.policy # policy name
  # policy construct
  policy = data.vault_policy_document.policy_documents.hcl

}

