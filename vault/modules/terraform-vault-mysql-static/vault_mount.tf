resource "vault_mount" "mysql" {
  path = "mysql_dynamic_static"
  type = "database"
}

#  Error: error creating static role "mysql_static_role" for backend "mysql_dynamic_static": Error making API request.
# │ 
# │ URL: PUT http://127.0.0.1:8200/v1/mysql_dynamic_static/static-roles/mysql_static_role
# │ Code: 500. Errors:
# │ 
# │ * 1 error occurred:
# │ 	* "mysql_static_role" is not an allowed role
# │ 
# │ 


# path "mysql_dynamic_static/static-roles/*" {
#   capabilities = ["create", "read", "update", "delete", "list"]
# }
# path "mysql_dynamic_static/roles/*" {
#   capabilities = ["create", "read", "update", "delete", "list"]
# }
