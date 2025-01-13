locals {
  path                  = coalesce(var.path, var.name)
  description           = coalesce(var.description, "${var.name} Certificate Authority")
  parent_authority_path = var.parent_ca
  urls_prefix           = var.urls_prefix
}
