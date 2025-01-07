variable "secret_engine" {
  type        = string
  default     = "secret"
  description = "Vault Secret Engine where the secrets will be stored."
}
variable "folder_path" {
  type        = string
  default     = "/opt/secrets"
  description = "Folder path where sops encrypted files reside."
}

variable "create_secret_engine" {
  type        = bool
  default     = false
  description = "Enable key-value secret engine creation."
}