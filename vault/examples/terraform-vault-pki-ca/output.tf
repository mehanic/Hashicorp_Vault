
# # output the root CA cert
# output "root_ca_cert" {
#     value = module.terraform-vault-pki-ca.root_ca_cert
# }

# # output the intermediate CA cert
# output "conf_auth_ca_cert" {
#     value = module.terraform-vault-pki-ca.conf_auth_ca_cert
# }

# # output the intermediate CA mount path
# output "conf_auth_ca_mount_path" {
#     value = module.terraform-vault-pki-ca.conf_auth_ca_mount_path
# }

# # output the intermediate CA backend role name
# output "conf_auth_ca_backend_role_name" {
#     value = module.terraform-vault-pki-ca.conf_auth_ca_backend_role_name
# }
# //

# # Output the intermediate CA certificate
# output "web_issuer_ca_cert" {
#   value = module.terraform-vault-pki-ca.web_issuer_ca_cert
# }

# # Output the intermediate CA mount path
# output "web_issuer_ca_mount_path" {
#   value = module.terraform-vault-pki-ca.web_issuer_ca_mount_path
# }

# # Output the intermediate CA backend role name
# output "web_issuer_ca_backend_role_name" {
#   value = module.terraform-vault-pki-ca.web_issuer_ca_backend_role_name
# }



output "root_ca_path" {
  description = "Path where the root CA is mounted"
  value       = module.terraform-vault-pki-ca.root_ca_path
}

output "root_ca_description" {
  description = "Description of the root CA"
  value       = module.terraform-vault-pki-ca.root_ca_description
}

output "root_ca_certificate" {
  description = "Root CA certificate in PEM format"
  value       = module.terraform-vault-pki-ca.root_ca_certificate
}

output "root_ca_role_name" {
  description = "Name of the root CA backend role"
  value       = module.terraform-vault-pki-ca.root_ca_role_name
}

output "root_ca_cluster_url" {
  description = "Cluster URL configuration for root CA"
  value       = module.terraform-vault-pki-ca.root_ca_cluster_url
}


output "config_inter_ca_path" {
  description = "Path where the intermediate CA for config auth is mounted"
  value       = module.terraform-vault-pki-ca.config_inter_ca_path
}

output "config_inter_ca_certificate" {
  description = "Intermediate CA certificate for config auth"
  value       = module.terraform-vault-pki-ca.config_inter_ca_certificate
}

output "config_inter_ca_role_name" {
  description = "Name of the config auth CA backend role"
  value       = module.terraform-vault-pki-ca.config_inter_ca_role_name
}

output "web_issuer_ca_path" {
  description = "Path where the web issuer intermediate CA is mounted"
  value       = module.terraform-vault-pki-ca.web_issuer_ca_path
}

output "web_issuer_ca_certificate" {
  description = "Web issuer intermediate CA certificate"
  value       = module.terraform-vault-pki-ca.web_issuer_ca_certificate
}

output "web_issuer_ca_role_name" {
  description = "Name of the web issuer CA backend role"
  value       = module.terraform-vault-pki-ca.web_issuer_ca_role_name
}


output "web_issuer_ca_cluster_url" {
  description = "Cluster URL configuration for web issuer CA"
  value       = module.terraform-vault-pki-ca.web_issuer_ca_cluster_url
}
