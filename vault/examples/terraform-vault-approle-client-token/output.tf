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


# output "approle-data" {

#   value = {

#     "renewable" = module.approle.renewable
#     "lease_duration" = module.approle.lease-duration
#     "lease_started" = module.approle.lease-started
#     "client_token" = module.approle.client-token

#   }
