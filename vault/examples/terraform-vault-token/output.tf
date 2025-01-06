output "token_client_token" {
  sensitive = true
  value     = module.terraform-vault-token.token_client_token
}

output "token_id" {
  value = module.terraform-vault-token.token_id
}

output "token_lease_duration" {
  value = module.terraform-vault-token.token_lease_duration
}

output "token_lease_started" {
  value = module.terraform-vault-token.token_lease_started
}

output "token_no_parent" {
  value = module.terraform-vault-token.token_no_parent
}

output "token_num_uses" {
  value = module.terraform-vault-token.token_num_uses
}

output "token_renewable" {
  value = module.terraform-vault-token.token_renewable
}

output "token_wrapped_token" {
  value = module.terraform-vault-token.token_wrapped_token
 sensitive = true
}

output "token_wrapping_accessor" {
  value = module.terraform-vault-token.token_wrapping_accessor
  sensitive = true
}