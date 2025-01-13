resource "vault_policy" "approle_rotation" {
  name = "approle_rotation"

  policy = <<EOT
path "auth/approle/role/{{identity.entity.aliases.${var.approle_mount_accessor}.metadata.role_name}}/secret-id-accessor/lookup" {
  capabilities = ["update"]
}

path "auth/approle/role/{{identity.entity.aliases.${var.approle_mount_accessor}.metadata.role_name}}/secret-id-accessor/destroy" {
  capabilities = ["update"]
}

path "auth/approle/role/{{identity.entity.aliases.${var.approle_mount_accessor}.metadata.role_name}}/secret-id/destroy" {
  capabilities = ["update"]
}

path "auth/approle/role/{{identity.entity.aliases.${var.approle_mount_accessor}.metadata.role_name}}/secret-id/lookup" {
  capabilities = ["update"]
}

path "auth/approle/role/{{identity.entity.aliases.${var.approle_mount_accessor}.metadata.role_name}}/custom-secret-id" {
  capabilities = ["update"]
%{if var.restricted_metadata != ""~}
  allowed_parameters = {
    "metadata" = ["${var.restricted_metadata}"]
    "*" = []
  }
%{endif}
}

path "auth/approle/role/{{identity.entity.aliases.${var.approle_mount_accessor}.metadata.role_name}}/secret-id" {
  capabilities = ["update", "list"]
%{if var.restricted_metadata != ""~}
  allowed_parameters = {
    "metadata" = ["${var.restricted_metadata}"]
    "*" = []
  }
%{endif}
}
EOT
}
