resource "snowflake_role_grants" "grants" {
  role_name = var.role_name
  users     = [snowflake_user.user.name]
}
