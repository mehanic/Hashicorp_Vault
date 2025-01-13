resource "vault_pki_secret_backend_role" "root-role" {
  backend        = vault_mount.pki-root.path
  name           = "2023-servers"
  allow_any_name = true
}

resource "vault_pki_secret_backend_role" "app1" {
  backend            = vault_mount.pki-short.path
  name               = "app1"
  allow_localhost    = true
  allow_subdomains   = false
  allow_bare_domains = true
  allow_glob_domains = false
  allowed_domains    = ["app1.sandbox.mcdevops.dev"]
  server_flag        = true
  client_flag        = true
  code_signing_flag  = true
  ttl                = 180 #3mins
  max_ttl            = 300 #6mins
}
