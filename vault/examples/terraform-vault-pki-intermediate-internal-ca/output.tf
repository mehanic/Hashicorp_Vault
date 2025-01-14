output "token_roles" {
  value = [
    module.white.role_name,
    module.black.role_name
  ]
}


