resource "mysql_grant" "this" {
  provider   = mysql
  for_each   = var.grants
  host       = var.host
  user       = mysql_user.this.user
  database   = each.key
  privileges = each.value
  grant      = true
}
