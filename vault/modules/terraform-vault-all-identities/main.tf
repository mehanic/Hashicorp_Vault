# Vault Identity Entity
resource "vault_identity_entity" "test" {
  name     = "tester1"
  policies = ["test"]
  metadata = {
    foo = "bar"
  }
}

resource "vault_identity_entity" "entity" {
  name              = "entity"
  external_policies = true
}

resource "vault_auth_backend" "github1" {
  type = "github"
  path = "github1"
}

# Vault Identity Entity Aliases
resource "vault_identity_entity_alias" "test" {
  name = "user_1"
  // mount_accessor  = "github"
  // canonical_id    = "49877D63-07AD-4B85-BDA8-B61626C477E8"
  //  canonical_id   = vault_identity_entity.test.id

  mount_accessor = vault_auth_backend.github1.accessor # Use the accessor from the backend
  canonical_id   = vault_identity_entity.test.id
}

# Vault Identity Entity Policies
resource "vault_identity_entity_policies" "policies" {
  policies = [
    "default",
    "test",
  ]
  exclusive = true
  entity_id = vault_identity_entity.entity.id
}

# Vault Identity Group (Internal)
resource "vault_identity_group" "internal" {
  name     = "internal"
  type     = "internal"
  policies = ["dev", "test"]
  metadata = {
    version = "2"
  }
}

# Vault Identity Group (External)
resource "vault_identity_group" "group" {
  name     = "test"
  type     = "external"
  policies = ["test"]
}

# Vault Identity Group Alias
resource "vault_identity_group_alias" "group-alias" {
  name           = "Github_Team_Slug"
  mount_accessor = vault_auth_backend.github.accessor
  canonical_id   = vault_identity_group.group.id
}

# Vault Auth Backend (GitHub)
resource "vault_auth_backend" "github" {
  type = "github"
  path = "github"
}

# Vault Identity Group Member Entity IDs
resource "vault_identity_group_member_entity_ids" "members" {
  exclusive         = true
  member_entity_ids = [vault_identity_entity.test.id]
  group_id          = vault_identity_group.internal.id
}

# Vault Identity Group Member Group IDs
resource "vault_identity_group_member_group_ids" "members" {
  exclusive        = true
  member_group_ids = [vault_identity_group.group.id]
  group_id         = vault_identity_group.internal.id
}

# Vault Identity MFA (Duo)
resource "vault_identity_mfa_duo" "example" {
  api_hostname    = "api-xxxxxxxx.duosecurity.com"
  secret_key      = "secret-key"
  integration_key = "secret-int-key"
}

# Vault Identity MFA (Okta)
resource "vault_identity_mfa_okta" "example" {
  org_name  = "org1"
  api_token = "token1"
  base_url  = "qux.baz.com"
}

# Vault Identity OIDC Configuration
resource "vault_identity_oidc" "server" {
  issuer = "https://www.acme.com"
}

resource "vault_identity_oidc_key" "testone" {
  name               = "new-key" # Use a different key name if necessary
  allowed_client_ids = ["*"]
  rotation_period    = 3600
  verification_ttl   = 3600
}



# resource "vault_identity_oidc_client" "test" {
#   name          = "application"
#   key           = vault_identity_oidc_key.testone.name
#   redirect_uris = [
#     "http://127.0.0.1:9200/v1/auth-methods/oidc:authenticate:callback",
#     "http://127.0.0.1:8251/callback",
#     "http://127.0.0.1:8080/callback"
#   ]
#   assignments = [
#     vault_identity_oidc_assignment.assignment_1.name
#   ]
#   id_token_ttl     = 2400
#   access_token_ttl = 7200
# }

resource "vault_identity_oidc_key" "test" {
  name               = "my-key"
  allowed_client_ids = ["*"]
  rotation_period    = 3600
  verification_ttl   = 3600
}

# resource "vault_identity_oidc_scope" "test" {
#   name        = "groups"
#   template    = "{\"groups\":{{identity.entity.groups.names}}}"
#   description = "Vault OIDC Groups Scope"
# }


resource "vault_identity_oidc_scope" "groups_scope" {
  name        = "groups_scope"
  template    = "{\"groups\":{{identity.entity.groups.names}}}"
  description = "Vault OIDC Groups Scope - updated"
}
# resource "vault_identity_oidc_provider" "test" {
#   name                = "my-provider"
#   https_enabled        = false
#   issuer_host         = "127.0.0.1:8200"
#   allowed_client_ids  = [vault_identity_oidc_client.test.client_id]
#   scopes_supported    = [vault_identity_oidc_scope.test.name]
# }

resource "vault_identity_oidc_assignment" "default" {
  name       = "my-assignment"
  entity_ids = ["fake-ascbascas-2231a-sdfaa"]
  group_ids  = ["fake-sajkdsad-32414-sfsada"]
}

resource "vault_identity_oidc_role" "role" {
  name = "role"
  key  = vault_identity_oidc_key.key.name
}

resource "vault_identity_oidc_key_allowed_client_id" "role" {
  key_name          = vault_identity_oidc_key.key.name
  allowed_client_id = vault_identity_oidc_role.role.client_id
}


///
# Vault Identity OIDC Key resource
resource "vault_identity_oidc_key" "key" {
  name      = "key"
  algorithm = "RS256"
  allowed_client_ids = [
    "your-client-id", # Replace with your actual client ID
  ]
}

# Vault Identity OIDC Role resource, now uniquely named
resource "vault_identity_oidc_role" "role_1" {
  name = "role-1"
  key  = vault_identity_oidc_key.key.name
}

# Vault Identity OIDC Role resource, another unique role
resource "vault_identity_oidc_role" "role_2" {
  name = "role-2"
  key  = vault_identity_oidc_key.key.name
}

# Vault Identity OIDC Assignment resource, now uniquely named
resource "vault_identity_oidc_assignment" "assignment_1" {
  name       = "assignment-1"
  entity_ids = [vault_identity_entity.test.id]
  group_ids  = [vault_identity_group.internal.id]
}

# Vault Identity OIDC Assignment resource, another unique assignment
resource "vault_identity_oidc_assignment" "assignment_2" {
  name       = "assignment-2"
  entity_ids = [vault_identity_entity.entity.id]
  group_ids  = [vault_identity_group.group.id]
}

# Vault Identity OIDC Key resource for verification
resource "vault_identity_oidc_key" "verification_key" {
  name               = "verification-key"
  allowed_client_ids = ["*"]
  rotation_period    = 3600
  verification_ttl   = 3600
}

# Vault Identity OIDC Client resource
resource "vault_identity_oidc_client" "client" {
  name = "application"
  key  = vault_identity_oidc_key.key.name
  redirect_uris = [
    "http://127.0.0.1:9200/v1/auth-methods/oidc:authenticate:callback",
    "http://127.0.0.1:8251/callback",
    "http://127.0.0.1:8080/callback"
  ]
  assignments = [
    vault_identity_oidc_assignment.assignment_1.name
  ]
  id_token_ttl     = 2400
  access_token_ttl = 7200
}

# Vault Identity OIDC Provider resource
resource "vault_identity_oidc_provider" "oidc_provider" {
  name               = "my-provider"
  https_enabled      = false
  issuer_host        = "127.0.0.1:8200"
  allowed_client_ids = [vault_identity_oidc_client.client.client_id]
  scopes_supported   = [vault_identity_oidc_scope.test.name]
}

# Vault Identity OIDC Scope resource
resource "vault_identity_oidc_scope" "test" {
  name        = "groups"
  template    = "{\"groups\":{{identity.entity.groups.names}}}"
  description = "Vault OIDC Groups Scope"
}
