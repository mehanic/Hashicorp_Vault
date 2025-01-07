output "prometheus_token" {
  description = "The Vault token for Prometheus"
  value       = vault_token.prometheus.id
}

output "prometheus_token_policies" {
  description = "The policies associated with the Prometheus token"
  value       = vault_token.prometheus.policies
}

output "prometheus_token_ttl" {
  description = "The time-to-live (TTL) of the Prometheus token"
  value       = vault_token.prometheus.ttl
}

output "prometheus_role_name" {
  description = "The role name for Prometheus"
  value       = vault_token_auth_backend_role.prometheus.role_name
}

output "prometheus_policy" {
  description = "The policy for Prometheus"
  value       = vault_policy.prometheus.policy
}
