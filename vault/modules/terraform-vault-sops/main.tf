# resource "vault_mount" "kv-secret-engine" {
#   count = var.create_secret_engine ? 1 : 0
#   path  = var.secret_engine
#   type  = "kv-v2"
# }

# resource "vault_policy" "kv-secret-engine-ro-policy" {
#   count  = var.create_secret_engine ? 1 : 0
#   name   = "${var.secret_engine}-read-only"
#   policy = <<POLICY
#   path "${var.secret_engine}/*" {
#     capabilities = ["list", "read"]
#   }
#   POLICY
# }

# data "vault_generic_secret" "kv-secret-engine" {
#   count = var.create_secret_engine ? 0 : 1
#   path  = var.secret_engine
# }

# data "sops_file" "file" {
#   for_each    = toset([for secret_file in fileset(var.folder_path, "**") : trimsuffix(secret_file, ".json")])
#   source_file = "${var.folder_path}/${each.key}.json"
#   input_type  = "json"
# }

# resource "vault_generic_secret" "secret" {
#   for_each = toset([for secret_file in fileset(var.folder_path, "**") : trimsuffix(secret_file, ".json")])

#   path      = "${var.secret_engine}/${each.key}"
#   data_json = data.sops_file.file[each.key].raw
#   depends_on = [
#     data.vault_generic_secret.kv-secret-engine,
#     vault_mount.kv-secret-engine
#   ]
# }