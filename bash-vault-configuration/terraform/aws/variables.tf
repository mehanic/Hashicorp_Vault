# AWS region and availability zones to deploy
variable "aws_region" {
  description = "The AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "The AWS availability zones to use for the deployment"
  type        = list(string)
  default     = ["us-east-1a"]
}

# Environment name for resource tagging
variable "environment_name" {
  description = "The environment name to tag resources with"
  type        = string
  default     = "plugin-password-policies"
}

# Private IP for the Vault server
variable "vault_server_private_ip" {
  description = "The private IP address of the Vault server"
  type        = string
  default     = "10.0.101.21"
}

# URL for Vault OSS binary download
variable "vault_binary_url" {
  description = "The URL for the Vault OSS binary"
  type        = string
  default     = "https://releases.hashicorp.com/vault/1.6.0/vault_1.6.0_linux_amd64.zip"
}

# Instance type for EC2 instances
variable "instance_type" {
  description = "The EC2 instance type to be used"
  type        = string
  default     = "t2.micro"
}

# SSH key name for EC2 instance access
variable "key_name" {
  description = "The SSH key name to access EC2 instances"
  type        = string
}

# TTL for HashiBot AWS resource reaper
variable "hashibot_reaper_ttl" {
  description = "TTL in hours for HashiBot AWS resource reaper"
  type        = number
  default     = 48
}

# Vault server configuration status
variable "configure_vault_server" {
  description = "Indicates whether the Vault server is already configured. Set to 'yes' for configured, 'no' for required configuration"
  type        = string
  default     = "no"
}
