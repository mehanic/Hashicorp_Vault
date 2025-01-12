resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_mount" "ssh" {
  type                      = "ssh"
  path                      = var.ssh_mount_path
  description               = var.ssh_ca_description
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  max_lease_ttl_seconds     = var.max_lease_ttl_seconds
}

resource "vault_ssh_secret_backend_ca" "sshca" {
  backend              = vault_mount.ssh.path
  generate_signing_key = var.generate_signing_key
}

resource "vault_identity_group" "users" {
  name = "users"
  member_group_ids = [
    vault_identity_group.ssh_users.id,
    vault_identity_group.userpass_users.id
  ]
  member_entity_ids = [
    vault_identity_entity.kitchen.id
  ]
}

resource "vault_identity_group" "ssh_users" {
  name     = var.ssh_group_name
  policies = [vault_policy.allow_ca.name]
}

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

resource "vault_policy" "allow_ca" {
  name   = var.ssh_policy_name
  policy = data.vault_policy_document.allow_ca.hcl
}

resource "vault_identity_group" "userpass_users" {
  name     = var.userpass_group_name
  policies = [vault_policy.allow_changing_password.name]
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

resource "vault_policy" "allow_changing_password" {
  name   = var.userpass_policy_name
  policy = data.vault_policy_document.allow_changing_password.hcl
}

resource "vault_identity_entity" "kitchen" {
  name     = var.kitchen_entity_name
  policies = ["default"]
}

resource "vault_identity_entity_alias" "userpass-kitchen" {
  name           = vault_identity_entity.kitchen.name
  mount_accessor = vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.kitchen.id
}

resource "vault_ssh_secret_backend_role" "kitchen" {
  name                    = var.kitchen_role_name
  backend                 = vault_mount.ssh.path
  key_type                = var.key_type
  allow_user_certificates = var.allow_user_certificates
  allowed_users           = var.allowed_users
  default_user            = var.default_user
  default_extensions      = var.default_extensions
}
