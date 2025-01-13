
//Approle is intended when there is no better/native authentication method, eg, aws/gcp/azure/k8s/ldap.
//create approle role that uses secret-provider policy
resource "vault_approle_auth_backend_role" "secret-provider-approle" {
  count          = var.enable_approle ? length(var.enviroments) : 0
  backend        = var.approle_path
  role_name      = "${var.appname}-${var.enviroments[count.index]}-secret-provider"
  token_policies = ["${var.appname}-${var.enviroments[count.index]}-secret-provider"]
}

//create approle role that uses secret-consumer policy
resource "vault_approle_auth_backend_role" "secret-consumer-approle" {
  count          = var.enable_approle ? length(var.enviroments) : 0
  backend        = var.approle_path
  role_name      = "${var.appname}-${var.enviroments[count.index]}-secret-consumer"
  token_policies = ["${var.appname}-${var.enviroments[count.index]}-secret-consumer"]
}

//create approle role that uses secret-admin policy
resource "vault_approle_auth_backend_role" "secret-admin-approle" {
  count          = var.enable_approle ? length(var.enviroments) : 0
  backend        = var.approle_path
  role_name      = "${var.appname}-${var.enviroments[count.index]}-secret-admin"
  token_policies = ["${var.appname}-${var.enviroments[count.index]}-secret-admin"]
}