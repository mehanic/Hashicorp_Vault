data "vault_generic_secret" "kv-secret-engine" {
  count = var.create_secret_engine ? 0 : 1
  path  = var.secret_engine
}

resource "vault_generic_secret" "secret" {
  for_each = toset([for secret_file in fileset(var.folder_path, "**") : trimsuffix(secret_file, ".json")])

  path      = "${var.secret_engine}/${each.key}"
  data_json = data.sops_file.file[each.key].raw
  depends_on = [
    data.vault_generic_secret.kv-secret-engine,
    vault_mount.kv-secret-engine
  ]
}