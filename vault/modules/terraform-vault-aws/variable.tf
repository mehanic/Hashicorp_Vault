
variable "backend_paths" {
  type        = map(string)
  description = "map with paths to the aws backend as the keys, and names of the roles to create as the value"
  default = {
    "aws" = "aws-vault"
  }
}

variable "name" {
  type        = string
  description = "Name of the role in Vault"
  //type    = map(string)
  default = "aws-vault"
    
}

variable "named_rules" {
  description = "List of common rules that have standard policies"
  type        = list(string)
  default     = ["audit_reader", "audit_manager"]
}

variable "rules" {
  type = list(object({
    path               = string
    capabilities       = list(string)
    description        = string
    allowed_parameters = map(list(string))
    denied_parameters  = map(list(string))
  }))
  default = [
    {
      path               = "secret/data/team/*"
      capabilities       = ["read", "list"]
      description        = "Read and list secrets for the team"
      allowed_parameters = {
        "ttl" = ["30m", "1h"]
      }
      denied_parameters  = {
        "max_ttl" = ["2h"]
      }
    },
    {
      path               = "sys/policies/acl/*"
      capabilities       = ["create", "read", "update", "delete"]
      description        = "Manage ACL policies"
      allowed_parameters = {}
      denied_parameters  = {}
    }
  ]
}

variable "token_ttl" {
  type        = number
  description = "The incremental lifetime for generated tokens in number of seconds. Its current value will be referenced at renewal time."
  default     = 72000 # 20 hours
}

variable "token_max_ttl" {
  type        = number
  description = "The maximum lifetime for generated tokens in number of seconds. Its current value will be referenced at renewal time"
  default     = 72000 # 20 hours
}

variable "wrapping_ttl" {
  type        = number
  description = "If Approle is enabled, the number of seconds after this module is applied where you can unwrap the secret_id"
  default     = 3600
}

variable "login_role_arns" {
  type        = list(string)
  description = "The ARNs of IAM Roles that should be able to access variables in this vault cluster"
  default     = ["arn:aws:iam::123456789012:role/example-role"]
}
