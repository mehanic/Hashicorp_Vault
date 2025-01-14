# Uncomment the following block to enable the Vault engine kv-v2
resource "vault_mount" "laboratory" {
  path        = "laboratory"
  type        = "kv"
  options     = { version = "2" }
  description = "Secret KV Version 2 secret engine mount"
}