## PKI Intermediates
locals {
  inter_list = merge([for rk, rv in var.pki_map : { for ik, iv in rv.intermediates : ik => merge(iv, { root : rk }) }]...)
}

## PKI Roles
locals {
  roles_list = merge(flatten([for rk, rv in var.pki_map : [for ik, iv in rv.intermediates : { for ok, ov in iv.roles : ok => merge(ov, { inter : ik }) }]])...)
}
