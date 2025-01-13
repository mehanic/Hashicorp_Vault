resource "vault_mount" "application-root-per-env" {
  count = length(var.enviroments)
  path  = "${var.appname}/${var.enviroments[count.index]}"
  type  = "kv-v2"
}
