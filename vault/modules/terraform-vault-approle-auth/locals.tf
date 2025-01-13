locals {
  approle_sign_policy_template = <<-EOF
        path "%s/sign/*" { capabilities = [ "read", "list", "create", "update" ] }
    EOF
}