data "sops_file" "file" {
  for_each    = toset([for secret_file in fileset(var.folder_path, "**") : trimsuffix(secret_file, ".json")])
  source_file = "${var.folder_path}/${each.key}.json"
  input_type  = "json"
}