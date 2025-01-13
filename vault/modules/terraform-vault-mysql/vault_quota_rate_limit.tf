resource "vault_quota_rate_limit" "role" {
  for_each = {
    for key, item in local.db_roles : key => item
    if item.enable_quota
  }

  namespace = var.vault_namespace
  name      = each.value.quota_path

  path = each.value.role_path

  rate           = each.value.rate
  interval       = each.value.interval
  block_interval = each.value.block_interval

  depends_on = [
    vault_database_secret_backend_connection.this,
    vault_database_secret_backend_role.this
  ]
}
