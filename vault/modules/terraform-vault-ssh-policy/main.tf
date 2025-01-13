resource "vault_mount" "ssh" {
    depends_on = [ var.module_depends_on ]
    type = "ssh"
    path = var.ssh_secret_path
}

resource "vault_ssh_secret_backend_ca" "ssh_backend" {
    backend              = vault_mount.ssh.path
    generate_signing_key = true
}

resource "vault_ssh_secret_backend_role" "ssh_backend_role" {
    name                    = var.ssh_backend_role_name
    backend                 = vault_mount.ssh.path
    key_type                = "ca"
    algorithm_signer        = var.algorithm_signer
    allow_user_certificates = true
    allowed_users           = var.allowed_users
    allowed_extensions      = var.allowed_extensions
    default_extensions      = var.default_extensions
    default_user            = var.default_user
    ttl                     = var.ttl
}

resource "vault_policy" "ssh_backend_policy" {
    name = "ssh_backend_policy"
    policy = <<EOF
path "${vault_mount.ssh.path}/sign/${vault_ssh_secret_backend_role.ssh_backend_role.name}" {
    capabilities = ["create", "update"]
    }
EOF
}