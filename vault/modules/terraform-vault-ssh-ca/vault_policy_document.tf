data "vault_policy_document" "allow_ca" {
  rule {
    description  = "allow users to sign their own keys"
    path         = "sshca/sign/{{ identity.entity.name }}"
    capabilities = ["create", "update"]
  }

  rule {
    description  = "allow users to read the CA public key"
    path         = "sshca/config/ca"
    capabilities = ["read"]
  }
}

data "vault_policy_document" "allow_changing_password" {
  rule {
    description  = "allow users to change their own passwords"
    path         = "auth/userpass/users/{{ identity.entity.aliases.${vault_auth_backend.userpass.accessor}.name }}"
    capabilities = ["update"]
    allowed_parameter {
      key   = "password"
      value = []
    }
  }
}