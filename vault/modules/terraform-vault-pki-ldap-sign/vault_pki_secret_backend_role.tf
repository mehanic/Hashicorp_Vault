resource "vault_pki_secret_backend_role" "code_sign" {
  backend = vault_mount.pki.path

  name              = "code_sign"
  ttl               = 86400
  max_ttl           = 86400
  code_signing_flag = true
  allow_any_name    = true
  key_type          = "rsa"
  key_bits          = 4096
  key_usage         = ["DigitalSignature"]
  ou                = ["Information Technology"]
  organization      = ["Acme Corp"]
  country           = ["US"]
  locality          = ["Seattle"]
  province          = ["Washington"]
}
