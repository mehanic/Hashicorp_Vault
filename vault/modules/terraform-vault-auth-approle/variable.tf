variable "approle_mount_path" {
  type = string
  default = "approle"
}

variable "approle_mount_accessor" {
  type = string
  default = "approle-mount-accessor"
}
variable "role_name_prefix" {
  type    = string
  default = ""
}

variable "global_bound_cidrs" {
  type    = list(string)
  default = []
}

variable "approles" {
  type = list(object({
    role_name              = string
    role_id                = optional(string)
    role_id_from_role_name = optional(bool)
    token_policies         = optional(list(string))
    token_max_ttl          = optional(number)
    token_ttl              = optional(number)
    token_bound_cidrs      = optional(list(string))
    secret_id_ttl          = optional(number)
    secret_id_num_uses     = optional(number)
    secret_id_bound_cidrs  = optional(list(string))
    create_identity        = optional(bool)
    identity_metadata      = optional(map(string))
   // groups                = optional(list(string))
  }))
}


# Declare the groups variable
variable "groups" {
  type = list(object({
    name     = string
    policies = list(string)
  }))
  default = [
    {
      name     = "web-servers"
      policies = ["web-policy"]
    },
    {
      name     = "db-servers"
      policies = ["db-policy"]
    }
  ]
}


variable "restricted_metadata" {
  type    = string
  default = ""
}

variable "name_cidr_regex" {
  type    = string
  default = "([a-z]{2}).[a-z]{3,}.[a-z]{2,}$"
}

variable "cidr_map" {
  type = map(list(string))
  default = {
    "ez" : ["192.168.2.0/24"],
    "dd" : ["192.168.64.0/21"],
    "pt" : ["192.168.72.0/21"],
    "wg" : ["196.168.200.0/24"]
  }

}
