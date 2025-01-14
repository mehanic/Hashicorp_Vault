locals {
  # Removing spaces from the common name suffix
  common_name_suffix = trimspace(var.common_name_suffix)
  # The mount path should not have a leading or trailing slash
  root_ca_mount_path = trim("/", var.root_ca_mount_path)
}
