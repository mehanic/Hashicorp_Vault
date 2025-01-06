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
