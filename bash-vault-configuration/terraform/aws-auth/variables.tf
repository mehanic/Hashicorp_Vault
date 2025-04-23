# AWS region where the resources will be provisioned
variable "aws_region" {
  description = "The AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

# AWS Account ID required for Vault IAM policy
variable "aws_account_id" {
  description = "The AWS account ID used for Vault IAM policy"
  type        = string
}

# SSH key name associated with Vault and consumer instances
variable "ssh_key_name" {
  description = "The existing AWS SSH key to associate with Vault and consumer instances"
  type        = string
}

# Tag identifying instance owner, used for resource tracking
variable "owner_tag" {
  description = "Tag identifying the owner of the instance"
  type        = string
  default     = "Vault-aws-test"
}

# TTL tracking tag for custom resource management
variable "ttl_tag" {
  description = "TTL tracking tag for custom management of resources"
  type        = string
  default     = "24"
}

# ID of the AMI to be provisioned. Defaults to Ubuntu 14.04 Base Image
variable "ami_id" {
  description = "The ID of the AMI to use for provisioning. Default is Ubuntu 14.04 Base Image"
  type        = string
  default     = "ami-2e1ef954"
}

# Type of EC2 instance to be provisioned
variable "instance_type" {
  description = "The type of EC2 instance to provision"
  type        = string
  default     = "t2.micro"
}

# Example of public key if SSH key creation is needed (Check README.md for usage)
# variable "id_rsa_pub" {
#   description = "Public key contents"
#   type        = string
#   default     = "ssh-rsa AAAA...RFi9wrf+M7Q== abc@mylaptop.local"
# }
