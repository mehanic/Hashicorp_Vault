
resource "vault_policy" "admin_policy" {
  name = "admins"
  // policy = file("policies/admin_policy.hcl")
  policy = var.admin_policy_code
}

resource "vault_policy" "developer_policy" {
  name = "developers"
  //policy = file("policies/developer_policy.hcl")
  policy = var.developer_policy_code
}

resource "vault_policy" "operations_policy" {
  name = "operations"
  // policy = file("policies/operation_policy.hcl")
  policy = var.operation_policy_code
}
