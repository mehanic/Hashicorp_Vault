## PKI Roots
resource "vault_mount" "root" {
  for_each                  = var.pki_map
  path                      = "${var.pki_path}/${each.key}"
  description               = try(each.value["description"], "Managed by Terraform")
  type                      = "pki"
  default_lease_ttl_seconds = try(each.value["default_lease_ttl_seconds"], null)
  max_lease_ttl_seconds     = try(each.value["max_lease_ttl_seconds"], null)
}


resource "vault_mount" "intermediate" {
  for_each                  = local.inter_list
  path                      = "${var.pki_path}/${each.key}"
  type                      = vault_mount.root[each.value["root"]].type
  description               = try(each.value["description"], "Managed by Terraform")
  default_lease_ttl_seconds = try(each.value["default_lease_ttl_seconds"], null)
  max_lease_ttl_seconds     = try(each.value["max_lease_ttl_seconds"], null)
}