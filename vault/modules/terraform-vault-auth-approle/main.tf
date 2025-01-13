# locals {
#   default_token_ttl_seconds      = 60 * 15
#   default_secret_id_ttl_seconds  = 60 * 60 * 24 * 30
#   default_role_id_from_role_name = true
#   default_secret_id_num_uses     = 0
#   default_create_identity        = true
# }

# resource "vault_approle_auth_backend_role" "approle" {
#   for_each = { for role in var.approles : role.role_name => role }

#   backend               = var.approle_mount_path
#   role_name             = each.value.role_name
#   role_id               = coalesce(each.value.role_id_from_role_name, local.default_role_id_from_role_name) ? each.value.role_name : each.value.role_id
#   token_policies        = concat([vault_policy.approle_rotation.name], try(each.value.token_policies, []))
#   token_max_ttl         = coalesce(each.value.token_max_ttl, local.default_token_ttl_seconds)
#   token_ttl             = coalesce(each.value.token_ttl, each.value.token_max_ttl, local.default_token_ttl_seconds)
#   token_bound_cidrs     = try(coalescelist(each.value.token_bound_cidrs, var.name_cidr_regex != null ? var.cidr_map[regex(var.name_cidr_regex, each.value.role_name)[0]] : []), [])
#   secret_id_bound_cidrs = try(coalescelist(each.value.secret_id_bound_cidrs, var.name_cidr_regex != null ? var.cidr_map[regex(var.name_cidr_regex, each.value.role_name)[0]] : []), [])
#   secret_id_ttl         = coalesce(each.value.secret_id_ttl, local.default_secret_id_ttl_seconds)
#   secret_id_num_uses    = coalesce(each.value.secret_id_num_uses, local.default_secret_id_num_uses)
# }

# resource "vault_identity_entity" "approle_identity" {
#   for_each = { for role in var.approles : role.role_name => role if coalesce(role.create_identity, local.default_create_identity) }
#   name     = each.value.role_name
#   metadata = each.value.identity_metadata
# }

# resource "vault_identity_entity_alias" "approle_identity_alias" {
#   depends_on     = [vault_identity_entity.approle_identity]
#   for_each       = { for role in var.approles : role.role_name => role if coalesce(role.create_identity, local.default_create_identity) }
#   name           = each.value.role_name
#   mount_accessor = var.approle_mount_accessor
#   canonical_id   = vault_identity_entity.approle_identity[each.value.role_name].id
# }

# //

# resource "vault_policy" "approle_rotation" {
#   name = "approle_rotation"

#   policy = <<EOT
# path "auth/approle/role/{{identity.entity.aliases.${var.approle_mount_accessor}.metadata.role_name}}/secret-id-accessor/lookup" {
#   capabilities = ["update"]
# }

# path "auth/approle/role/{{identity.entity.aliases.${var.approle_mount_accessor}.metadata.role_name}}/secret-id-accessor/destroy" {
#   capabilities = ["update"]
# }

# path "auth/approle/role/{{identity.entity.aliases.${var.approle_mount_accessor}.metadata.role_name}}/secret-id/destroy" {
#   capabilities = ["update"]
# }

# path "auth/approle/role/{{identity.entity.aliases.${var.approle_mount_accessor}.metadata.role_name}}/secret-id/lookup" {
#   capabilities = ["update"]
# }

# path "auth/approle/role/{{identity.entity.aliases.${var.approle_mount_accessor}.metadata.role_name}}/custom-secret-id" {
#   capabilities = ["update"]
# %{if var.restricted_metadata != ""~}
#   allowed_parameters = {
#     "metadata" = ["${var.restricted_metadata}"]
#     "*" = []
#   }
# %{endif}
# }

# path "auth/approle/role/{{identity.entity.aliases.${var.approle_mount_accessor}.metadata.role_name}}/secret-id" {
#   capabilities = ["update", "list"]
# %{if var.restricted_metadata != ""~}
#   allowed_parameters = {
#     "metadata" = ["${var.restricted_metadata}"]
#     "*" = []
#   }
# %{endif}
# }
# EOT
# }
