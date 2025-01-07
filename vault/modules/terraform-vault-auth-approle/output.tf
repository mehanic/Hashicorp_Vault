# member_entity_ids = [
#     for entry in var.approles : module.terraform-vault-auth-approle.approle_identities[entry.role_name]
#     if contains(entry.groups == null ? [] : entry.groups, each.value.name)
#   ]

output "approle_identity_ids" {
  value = [for entry in vault_identity_entity.approle_identity : entry.id]
}

output "approle_identities" {
  value = { for entry in vault_identity_entity.approle_identity : entry.name => entry.id }
}

//


output "approle_roles" {
  description = "The list of created AppRole roles."
  value = {
    for role in var.approles : role.role_name => {
      role_name    = role.role_name
      role_id      = vault_approle_auth_backend_role.approle[role.role_name].role_id
      token_ttl    = vault_approle_auth_backend_role.approle[role.role_name].token_ttl
      secret_id_ttl = vault_approle_auth_backend_role.approle[role.role_name].secret_id_ttl
    }
  }
}

output "approle_identity_entities" {
  description = "The identity entities created for AppRoles."
  value = {
    for role in var.approles : role.role_name => {
      entity_id = lookup(vault_identity_entity.approle_identity, role.role_name, null) != null ? vault_identity_entity.approle_identity[role.role_name].id : null
      name      = lookup(vault_identity_entity.approle_identity, role.role_name, null) != null ? vault_identity_entity.approle_identity[role.role_name].name : null
      metadata  = lookup(vault_identity_entity.approle_identity, role.role_name, null) != null ? vault_identity_entity.approle_identity[role.role_name].metadata : null
    }
  }
}

output "approle_identity_aliases" {
  description = "The identity aliases created for AppRoles."
  value = {
    for role in var.approles : role.role_name => {
      alias_id          = lookup(vault_identity_entity_alias.approle_identity_alias, role.role_name, null) != null ? vault_identity_entity_alias.approle_identity_alias[role.role_name].id : null
      alias_name        = lookup(vault_identity_entity_alias.approle_identity_alias, role.role_name, null) != null ? vault_identity_entity_alias.approle_identity_alias[role.role_name].name : null
      mount_accessor    = lookup(vault_identity_entity_alias.approle_identity_alias, role.role_name, null) != null ? vault_identity_entity_alias.approle_identity_alias[role.role_name].mount_accessor : null
      canonical_id      = lookup(vault_identity_entity_alias.approle_identity_alias, role.role_name, null) != null ? vault_identity_entity_alias.approle_identity_alias[role.role_name].canonical_id : null
    }
  }
}

output "approle_policies" {
  description = "The AppRole rotation policy created."
  value = vault_policy.approle_rotation.name
}

output "identity_groups" {
  description = "The identity groups created for AppRoles."
  value = {
    for group in var.groups : group.name => {
      group_name = group.name
      policies   = group.policies
      member_entity_ids = [
        for role in var.approles : lookup(vault_identity_entity.approle_identity, role.role_name, null) != null ? vault_identity_entity.approle_identity[role.role_name].id : null
      ]
    }
  }
}
