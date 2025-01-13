locals {
  # --- The connection string for the database can contain more than one host, so handling string creation for that case here.
  database_address = join(",", [for address in var.database_addresses : "${address}:${var.database_port}"])
}
