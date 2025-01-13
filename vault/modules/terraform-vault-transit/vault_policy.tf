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
