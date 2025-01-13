resource "vault_mount" "default" {
  path        = "secretv2"
  type        = "kv-v2"
  description = "Default Mount for KV Secrets Engine"
}
