# AWS region and Availability Zones
variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "Availability zones in which to deploy"
  default     = "us-east-1a"
}

# Environment-specific name for tagging
variable "environment_name" {
  description = "Name of the environment for tagging resources"
  default     = "sm-ssh-otp-demo"
}

# Private IPs for Vault server and remote host
variable "vault_server_private_ip" {
  description = "The private IP of the Vault server"
  default     = "10.0.101.21"
}

variable "remote_host_private_ip" {
  description = "The private IP of the remote host"
  default     = "10.0.101.22"
}

# URL for the Vault OSS binary for download
variable "vault_zip_file" {
  description = "URL for Vault OSS binary"
  default     = "https://releases.hashicorp.com/vault/1.6.0/vault_1.6.0_linux_amd64.zip"
}

# Version for Vault SSH Helper
variable "vault_ssh_helper_version" {
  description = "Version of Vault SSH Helper"
  default     = "0.1.6"
}

# EC2 instance size
variable "instance_type" {
  description = "Instance type for EC2 instances"
  default     = "t2.micro"
}

# SSH key name for EC2 access (this key should already exist in AWS)
variable "key_name" {
  description = "SSH key name to access EC2 instances"
}

# HashiBot AWS resource reaper configuration (not fully implemented in this snippet)
variable "hashibot_reaper_ttl" {
  description = "Time-to-live (TTL) for HashiBot AWS resource reaper"
  default     = 48
}

# Vault server and remote host configuration flags
variable "configure_vault_server" {
  description = "Flag to configure Vault server (yes/no)"
  default     = "no"
}

variable "configure_remote_host" {
  description = "Flag to configure the remote host (yes/no)"
  default     = "no"
}
