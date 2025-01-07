output "renewable" {
  value = vault_approle_auth_backend_login.login.renewable
}

output "lease-duration" {
  value = vault_approle_auth_backend_login.login.lease_duration
}

output "lease-started" {
  value = vault_approle_auth_backend_login.login.lease_started
}

output "client-token" {
  value = vault_approle_auth_backend_login.login.client_token
}


