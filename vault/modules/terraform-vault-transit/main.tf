resource "vault_mount" "transit" {
  count       = length(var.transit_keys) > 0 ? 1 : 0
  path        = var.transit_path
  type        = "transit"
  description = "Transit secret engine used by occult"
}

resource "vault_policy" "occult" {
  name = "occult"

  policy = <<EOT
path "${var.kv_path}/data/occult/{{ identity.entity.metadata.occult }}" {
  capabilities = ["read"]
}

%{if length(var.transit_keys) > 0~}
path "${var.transit_path}/encrypt/{{ identity.entity.metadata.occult_transit }}" {
  capabilities = ["update"]
}

path "${var.transit_path}/decrypt/{{ identity.entity.metadata.occult_transit }}" {
  capabilities = ["update"]
}
%{endif}
EOT
}


resource "vault_transit_secret_backend_key" "key" {
  for_each               = { for key in var.transit_keys : key.name => key }
  backend                = vault_mount.transit[0].path
  name                   = each.value.name
  exportable             = false
  allow_plaintext_backup = false
  deletion_allowed       = coalesce(each.value.deletion_allowed, false)
  type                   = each.value.type
}
