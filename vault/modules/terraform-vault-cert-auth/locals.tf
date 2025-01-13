locals {
  # Create the policy with the list of configuration secrets paths
  config_policy = join("\n", [
    for path in var.config_paths : format("path \"%s\" { capabilities = [\"read\"] }", path)
  ])
}
