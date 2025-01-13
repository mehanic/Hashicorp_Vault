locals {
  # Convert db_roles variable to a map for for_each
  db_role_map = { for role in var.db_roles : role.rolename => role }
}
