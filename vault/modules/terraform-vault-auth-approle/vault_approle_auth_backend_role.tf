resource "vault_approle_auth_backend_role" "approle" {
  for_each = { for role in var.approles : role.role_name => role }

  backend               = var.approle_mount_path
  role_name             = each.value.role_name
  role_id               = coalesce(each.value.role_id_from_role_name, local.default_role_id_from_role_name) ? each.value.role_name : each.value.role_id
  token_policies        = concat([vault_policy.approle_rotation.name], try(each.value.token_policies, []))
  token_max_ttl         = coalesce(each.value.token_max_ttl, local.default_token_ttl_seconds)
  token_ttl             = coalesce(each.value.token_ttl, each.value.token_max_ttl, local.default_token_ttl_seconds)
  token_bound_cidrs     = try(coalescelist(each.value.token_bound_cidrs, var.name_cidr_regex != null ? var.cidr_map[regex(var.name_cidr_regex, each.value.role_name)[0]] : []), [])
  secret_id_bound_cidrs = try(coalescelist(each.value.secret_id_bound_cidrs, var.name_cidr_regex != null ? var.cidr_map[regex(var.name_cidr_regex, each.value.role_name)[0]] : []), [])
  secret_id_ttl         = coalesce(each.value.secret_id_ttl, local.default_secret_id_ttl_seconds)
  secret_id_num_uses    = coalesce(each.value.secret_id_num_uses, local.default_secret_id_num_uses)
}