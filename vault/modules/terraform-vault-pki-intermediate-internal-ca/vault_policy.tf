# Create a policy that grants access to the role
resource "vault_policy" "this" {
  name = "issue_cert_${var.mesh_name}"
  policy = templatefile("${path.module}/templates/issue.hcl.tmpl",
    {
      mount_path = vault_mount.this.path
      role_name  = vault_pki_secret_backend_role.this.name
    }
  )
}
