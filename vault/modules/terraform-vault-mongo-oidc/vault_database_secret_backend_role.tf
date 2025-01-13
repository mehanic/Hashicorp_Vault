resource "vault_database_secret_backend_role" "role" {
  backend             = vault_mount.db.path
  name                = "my-role"
  db_name             = vault_database_secret_backend_connection.mongodb.name
  creation_statements = ["{\"database_name\": \"admin\",\"roles\": [{\"databaseName\":\"admin\",\"roleName\":\"atlasAdmin\"}]}"]
}
