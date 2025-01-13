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