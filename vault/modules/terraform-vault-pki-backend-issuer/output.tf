# Output the root PKI mounts created
output "pki_roots" {
  description = "Root PKI mounts created with their paths"
  value = {
    for rk, rv in var.pki_map :
    rk => {
      path                      = vault_mount.root[rk].path
      default_lease_ttl_seconds = vault_mount.root[rk].default_lease_ttl_seconds
      max_lease_ttl_seconds     = vault_mount.root[rk].max_lease_ttl_seconds
    }
  }
}

# Output root certificate details
output "root_certificates" {
  description = "Root PKI certificate information"
  value = {
    for rk, _ in var.pki_map :
    rk => {
      common_name = vault_pki_secret_backend_root_cert.root[rk].common_name
      issuer_name = vault_pki_secret_backend_root_cert.root[rk].issuer_name
      certificate = vault_pki_secret_backend_root_cert.root[rk].certificate
    }
  }
}

# Output intermediate PKI paths and their roots
output "pki_intermediates" {
  description = "Intermediate PKI mounts and their parent root PKI"
  value = {
    for ik, iv in local.inter_list :
    ik => {
      path        = vault_mount.intermediate[ik].path
      root        = iv.root
      common_name = vault_pki_secret_backend_intermediate_cert_request.intermediate[ik].common_name
      csr         = vault_pki_secret_backend_intermediate_cert_request.intermediate[ik].csr
      certificate = vault_pki_secret_backend_root_sign_intermediate.intermediate[ik].certificate
    }
  }
}

# Output role definitions for intermediates
output "pki_roles" {
  description = "Roles defined in the PKI intermediate backends"
  value = {
    for rk, rv in local.roles_list :
    rk => {
      backend          = vault_pki_secret_backend_role.intermediate[rk].backend
      ttl              = vault_pki_secret_backend_role.intermediate[rk].ttl
      max_ttl          = vault_pki_secret_backend_role.intermediate[rk].max_ttl
      allow_localhost  = vault_pki_secret_backend_role.intermediate[rk].allow_localhost
      allowed_domains  = vault_pki_secret_backend_role.intermediate[rk].allowed_domains
      allow_subdomains = vault_pki_secret_backend_role.intermediate[rk].allow_subdomains
    }
  }
}

# Output the complete PKI paths created
output "pki_paths" {
  description = "All PKI paths created in Vault"
  value = {
    root_pki_paths         = [for rk in keys(var.pki_map) : vault_mount.root[rk].path]
    intermediate_pki_paths = [for ik in keys(local.inter_list) : vault_mount.intermediate[ik].path]
  }
}
