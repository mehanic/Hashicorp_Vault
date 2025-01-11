locals {
  // Master source from named role => policies it generates
  named_rules = {
    # Allow reading Vault audit information, necessary to make a `terraform plan`, but not writing audit info
    audit_reader = [
      {
        path         = "/sys/audit"
        capabilities = ["read", "sudo"]
        description  = "Allow listing audit devices"
      },
    ],
    # Allow reading and writing Vault audit information
    audit_manager = [
      {
        path         = "/sys/audit"
        capabilities = ["read", "sudo"]
        description  = "Allow listing audit devices"
      },
      {
        path         = "/sys/audit/file"
        capabilities = ["create", "read", "update", "delete", "list", "sudo"]
        description  = "Allow creating a file audit devices"
      },
    ]
  }

  generated_rules = flatten([
    for given_rule in var.named_rules :
    lookup(local.named_rules, given_rule, [])
  ])
}
