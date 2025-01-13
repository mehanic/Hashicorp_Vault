resource "vault_quota_lease_count" "role" {
  # enterprise only
  for_each = {
    for key, item in local.db_roles : key => item
    if var.lease_count_enabled
  }

  namespace = var.vault_namespace
  name      = each.value.quota_path

  path       = each.value.role_path
  max_leases = each.value.max_leases
}

//vault lease revoke -force -prefix database/