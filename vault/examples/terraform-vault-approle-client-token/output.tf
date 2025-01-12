output "renewable" {
  value = module.terraform-vault-approle-client-token.renewable
}

output "lease-duration" {
  value = module.terraform-vault-approle-client-token.lease-duration
}

output "lease-started" {
  value = module.terraform-vault-approle-client-token.lease-started
}

output "client-token" {
  value     = module.terraform-vault-approle-client-token.client-token
  sensitive = true
}


# output "approle-data" {

#   value = {

#     "renewable" = module.approle.renewable
#     "lease_duration" = module.approle.lease-duration
#     "lease_started" = module.approle.lease-started
#     "client_token" = module.approle.client-token

#   }
