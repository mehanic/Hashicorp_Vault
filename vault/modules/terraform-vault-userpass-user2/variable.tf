# Define the variables used in this configuration

variable "login_username" {
  type    = string
  default = "toronto-vault-user"
}

variable "login_password" {
  type      = string
  sensitive = true
  default   = "my-long-password"
}
