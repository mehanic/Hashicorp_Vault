output "consul_backend_path" {
  description = "The path where the Consul backend is mounted"
  value       = module.terraform-vault-consul.consul_backend_path
}

output "consul_backend_description" {
  description = "Description of the Consul backend"
  value       = module.terraform-vault-consul.consul_backend_description
}

output "consul_backend_address" {
  description = "Address of the Consul backend"
  value       = module.terraform-vault-consul.consul_backend_address
}


output "consul_role_name" {
  description = "The name of the Consul role"
  value       = module.terraform-vault-consul.consul_role_name
}

output "consul_role_policies" {
  description = "Consul policies associated with the role"
  value       = module.terraform-vault-consul.consul_role_policies
}

output "consul_role_max_ttl" {
  description = "Maximum TTL for the Consul role"
  value       = module.terraform-vault-consul.consul_role_max_ttl
}

output "consul_role_ttl" {
  description = "TTL for the Consul role"
  value       = module.terraform-vault-consul.consul_role_ttl
}

output "consul_role_local" {
  description = "Indicates if the Consul role token is local"
  value       = module.terraform-vault-consul.consul_role_local
}

output "consul_role_namespace" {
  description = "The Consul namespace for the role"
  value       = module.terraform-vault-consul.consul_role_namespace
}
