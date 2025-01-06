output "token_client_token" {
  sensitive = true
  value     = vault_token.this.client_token
}

output "token_id" {
  value = vault_token.this.id
}

output "token_lease_duration" {
  value = vault_token.this.lease_duration
}

output "token_lease_started" {
  value = vault_token.this.lease_started
}

output "token_no_parent" {
  value = vault_token.this.no_parent
}

output "token_num_uses" {
  value = vault_token.this.num_uses
}

output "token_renewable" {
  value = vault_token.this.renewable
}

output "token_wrapped_token" {
  value     = vault_token.this.wrapped_token
  sensitive = true
}

output "token_wrapping_accessor" {
  value     = vault_token.this.wrapping_accessor
  sensitive = true
}