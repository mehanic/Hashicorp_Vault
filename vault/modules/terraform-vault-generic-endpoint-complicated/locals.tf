locals {
  //vault_db_path = "${vault_mount.database.path}-database"
  local_connection_name = "${var.project_id}-${var.database_name}"
}