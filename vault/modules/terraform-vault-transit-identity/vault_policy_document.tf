data "vault_policy_document" "encrypt" {
  rule {
    path         = "transit/encrypt/{{identity.entity.metadata.env}}-{{identity.entity.metadata.service}}"
    capabilities = ["update"]
    description  = "Allow the use of encryption action with the transit key"
  }
  rule {
    path         = "auth/token/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "create child tokens"
  }
}

data "vault_policy_document" "decrypt" {
  rule {
    path         = "transit/decrypt/{{identity.entity.metadata.env}}-{{identity.entity.metadata.service}}"
    capabilities = ["update"]
    description  = "Allow the use of decryption action with the transit key"
  }
  rule {
    path         = "auth/token/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "create child tokens"
  }
}