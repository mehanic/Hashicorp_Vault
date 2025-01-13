//vault write identity/group name="development" type="internal"

resource "vault_identity_group" "development" {
  name = "development"
  type = "internal"
}