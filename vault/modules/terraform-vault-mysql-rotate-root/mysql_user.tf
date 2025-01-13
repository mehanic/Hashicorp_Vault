# MySQL User and Grant Resources
resource "mysql_user" "this" {
  provider           = mysql
  user               = var.name
  host               = var.host
  plaintext_password = var.password
}