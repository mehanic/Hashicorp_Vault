resource "vault_policy" "acmevault_client" {
  name = "acmevault_client"

  policy = <<EOT
path "${var.path_prefix}/+/client/{{identity.entity.metadata.acmevault_domain}}/pubkey" {
  capabilities = ["read"]
}
path "${var.path_prefix}/+/client/{{identity.entity.metadata.acmevault_domain}}/certificate" {
  capabilities = ["read"]
}
path "${var.path_prefix}/+/client/{{identity.entity.metadata.acmevault_domain}}/privatekey" {
  capabilities = ["read"]
}
EOT
}

resource "vault_policy" "acmevault_server" {
  name = "acmevault_server"

  policy = <<EOT
path "${var.path_prefix}/+/server/*" {
  capabilities = ["list", "create", "update", "read", "delete"]
}
path "${var.path_prefix}/+/client/+/pubkey" {
  capabilities = ["read", "list", "create", "update", "delete"]
}
path "${var.path_prefix}/+/client/+/certificate" {
  capabilities = ["read", "list", "create", "update", "delete"]
}
path "${var.path_prefix}/+/client/+/privatekey" {
  capabilities = ["create", "update", "delete"]
}
path "${var.aws_path}/creds/${vault_aws_secret_backend_role.acmevault.name}" {
  capabilities = ["read"]
}
EOT
}
