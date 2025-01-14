variable "vault_addr" {
  type        = string
  description = "Vault address (e.g. https://vault.example.com:8200)"
  default     = "" # Optional: Keep or remove if it's always required.
}

# variable "vault_token" {
#   type        = string
#   description = "Vault token"
#   sensitive   = true
#   validation {
#     condition     = length(var.vault_token) > 0
#     error_message = "Vault token must not be empty"
#   }
# }

variable "admin_password" {
  type        = string
  description = "Admin password"
  sensitive   = true
  validation {
    condition     = length(var.admin_password) > 0
    error_message = "Admin password must not be empty"
  }
  default = "qwerty123"
}

variable "devops_password" {
  type        = string
  description = "Devops password"
  sensitive   = true
  validation {
    condition     = length(var.devops_password) > 0
    error_message = "Devops password must not be empty"
  }
  default = "qwerty123"
}

variable "ip_whitelist" {
  type        = list(string)
  description = "IP whitelist"
  default     = [] # Compatible with list(string)
}

variable "ssh_keys" {
  type        = map(string)
  description = "SSH keys (Name and public key)"
  default     = {} # Compatible with map(string)
}

variable "pve_auth_keys_userpass" {
  type        = map(string)
  description = "Proxmox Authentication userpass (Username and password)"
  default     = {} # Compatible with map(string)
}

variable "pve_auth_keys_api" {
  type        = map(string)
  description = "Proxmox Authentication api (Username and API token)"
  default     = {} # Compatible with map(string)
}
