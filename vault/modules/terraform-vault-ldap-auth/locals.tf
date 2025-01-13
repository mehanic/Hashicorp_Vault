locals {
  identity_map = merge([for i, g in var.jumpcloud_group_policy : {
    for k, v in g.identities : k => merge(v, { group : i, policies = g.policies })
  }]...)
  jumpcloud_cert = var.jumpcloud_ad_cert_filename == null ? "${path.module}/tls/jumpcloud.chain.pem" : var.jumpcloud_ad_cert_filename
  test_prefix    = "__test"
}
