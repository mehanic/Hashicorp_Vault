locals {
  path        = coalesce(var.path, var.name)
  description = coalesce(var.description, "${var.name} Certificate Authority")
  urls_prefix = var.urls_prefix
}
