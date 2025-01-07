output "prometheus_token" {
  value = module.terraform-vault-prometheus.prometheus_token

}

output "prometheus_token_policies" {
  value = module.terraform-vault-prometheus.prometheus_token_policies
}

output "prometheus_token_ttl" {
  value = module.terraform-vault-prometheus.prometheus_token_ttl
}
output "prometheus_role_name" {
  value = module.terraform-vault-prometheus.prometheus_role_name
}

output "prometheus_policy" {
  value = module.terraform-vault-prometheus.prometheus_policy
}
