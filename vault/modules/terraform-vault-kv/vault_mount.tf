resource "vault_mount" "kvv2" {
  path        = var.mount-path # location to mount the kv secrets engine
  type        = "kv-v2"        # type of backend
  description = "kv-v2 mount path"
}
