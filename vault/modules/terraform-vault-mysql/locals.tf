locals {
  allowed_roles = contains(var.allowed_roles, "*") ? var.allowed_roles : [
    for item in var.roles : item.role_name

    if try(item.allowed, true) == true
  ]

  db_roles = ({
    for item in var.roles : "${coalesce(var.vault_namespace, "root")}/${coalesce(var.vault_mount_path, "database")}/${item.role_name}" => {
      database_name = try(item.database_name, "")
      role_name     = item.role_name
      role_path     = "${var.vault_mount_path}/${item.role_name}"
      default_ttl   = var.default_ttl
      max_ttl       = var.default_max_ttl

      # sql statements
      creation_statements   = try(item.creation_statements, var.default_creation_statements)
      revocation_statements = try(item.revocation_statements, var.default_revocation_statements)
      renew_statements      = try(item.renew_statements, var.default_renew_statements)
      rollback_statements   = try(item.rollback_statements, var.default_rollback_statements)

      # quotas
      enable_quota = try(item.quota, null) != null ? true : false
      quota_path   = "${var.vault_mount_path}-${item.role_name}"

      max_leases     = try(item.quota.max_leases, var.default_max_leases)
      rate           = try(item.quota.rate_limit_rate, var.default_rate_limit_rate)
      interval       = try(item.quota.rate_limit_interval, var.default_rate_limit_interval)
      block_interval = try(item.quota.rate_limit_block_interval, var.default_rate_limit_block_interval)
    }
  })
}
