output "root_ca_path" {
  description = "Path where the root CA is mounted"
  value       = vault_mount.root_ca.path
}

output "root_ca_description" {
  description = "Description of the root CA"
  value       = vault_mount.root_ca.description
}

output "root_ca_certificate" {
  description = "Root CA certificate in PEM format"
  value       = vault_pki_secret_backend_root_cert.root_cert.certificate
}

output "root_ca_role_name" {
  description = "Name of the root CA backend role"
  value       = vault_pki_secret_backend_role.root_ca.name
}

output "root_ca_cluster_url" {
  description = "Cluster URL configuration for root CA"
  value       = vault_pki_secret_backend_config_cluster.root_ca_cluster.path
}


output "config_inter_ca_path" {
  description = "Path where the intermediate CA for config auth is mounted"
  value       = vault_mount.config_inter_ca.path
}

output "config_inter_ca_certificate" {
  description = "Intermediate CA certificate for config auth"
  value       = vault_pki_secret_backend_intermediate_set_signed.config_inter_ca_cert.certificate
}

output "config_inter_ca_role_name" {
  description = "Name of the config auth CA backend role"
  value       = vault_pki_secret_backend_role.config_inter_ca.name
}

output "web_issuer_ca_path" {
  description = "Path where the web issuer intermediate CA is mounted"
  value       = vault_mount.web_issuer_ca.path
}

output "web_issuer_ca_certificate" {
  description = "Web issuer intermediate CA certificate"
  value       = vault_pki_secret_backend_intermediate_set_signed.web_issuer_ca_cert.certificate
}

output "web_issuer_ca_role_name" {
  description = "Name of the web issuer CA backend role"
  value       = vault_pki_secret_backend_role.web_issuer_ca_role.name
}


output "web_issuer_ca_cluster_url" {
  description = "Cluster URL configuration for web issuer CA"
  value       = vault_pki_secret_backend_config_cluster.web_issuer_ca_cluster.path
}
