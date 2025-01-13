resource "snowflake_user" "user" {
  name              = var.snowflake_username
  password          = random_password.password.result
  default_role      = var.role_name
  default_warehouse = "COMPUTE_WH"
}
