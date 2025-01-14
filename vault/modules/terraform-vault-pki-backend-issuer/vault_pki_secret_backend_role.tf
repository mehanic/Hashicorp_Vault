resource "vault_pki_secret_backend_role" "intermediate" {
  for_each           = local.roles_list
  backend            = vault_mount.intermediate[each.value["inter"]].path
  name               = each.key
  ttl                = try(each.value["ttl"], null)
  max_ttl            = try(each.value["max_ttl"], null)
  allow_localhost    = try(each.value["allow_localhost"], null)
  allowed_domains    = try(each.value["allowed_domains"], null)
  allow_bare_domains = try(each.value["allow_bare_domains"], null)
  allow_subdomains   = try(each.value["allow_subdomains"], null)
  allow_glob_domains = try(each.value["allow_glob_domains"], null)
  allow_ip_sans      = try(each.value["allow_ip_sans"], null)
  allowed_uri_sans   = try(each.value["allowed_uri_sans"], null)
  allowed_other_sans = try(each.value["allowed_other_sans"], null)
  issuer_ref         = try(each.value["issuer_ref"], null)
}
