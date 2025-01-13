locals {
  role_id        = format("%s-%s", var.application_name, var.service)
  group_id       = var.identity_group_id
  env            = var.env
  service        = var.service
  application    = var.application_name
  mount_accessor = var.mount_accessor
  backend_path   = "approle"
}
