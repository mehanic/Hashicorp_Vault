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

# Declare the approles variable
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
    groups                 = optional(list(string))
  }))
  default = [
    {
      role_name              = "web_server"
      role_id                = "web-role-id"
      role_id_from_role_name = true
      token_policies         = ["web_policy"]
      token_max_ttl          = 86400
      token_ttl              = 7200
      token_bound_cidrs      = ["192.168.0.0/16"]
      secret_id_ttl          = 43200
      secret_id_num_uses     = 10
      secret_id_bound_cidrs  = ["192.168.1.0/24"]
      create_identity        = true
      identity_metadata      = { environment = "production", application = "web" }
      groups                 = ["web-servers"]
    },
    {
      role_name          = "db_server"
      token_policies     = ["db_policy"]
      token_max_ttl      = 172800
      token_ttl          = 14400
      secret_id_ttl      = 86400
      secret_id_num_uses = 5
      identity_metadata  = { environment = "staging", application = "database" }
      create_identity    = false
    }
  ]
}


#this is for automation
resource "vault_auth_backend" "approle" {
  type = "approle"
  path = "vault_auth_approle"
}

module "terraform-vault-auth-approle" {
  source = "../../modules/terraform-vault-auth-approle"
  #this is for manual to some existing
  # vault auth list                                                     
  # Path                 Type        Accessor                  Description                Version
  # ----                 ----        --------                  -----------                -------
  # approle/             approle     auth_approle_6d1f132c     n/a                        n/a
  #   approle_mount_accessor = "auth_approle_6d1f132c"  //auth_approle_6d1f132c
  #   approle_mount_path      = "approle"
  approle_mount_accessor = vault_auth_backend.approle.accessor
  approle_mount_path     = vault_auth_backend.approle.path

  role_name_prefix   = "myapp-"
  global_bound_cidrs = ["192.168.0.0/16", "10.0.0.0/8"]
  approles           = var.approles
}

resource "vault_identity_group" "approle" {
  for_each = { for group in var.groups : group.name => group }
  member_entity_ids = [
    for entry in var.approles : module.terraform-vault-auth-approle.approle_identities[entry.role_name]
    if contains(entry.groups == null ? [] : entry.groups, each.value.name)
  ]
  name     = each.value.name
  type     = "internal"
  policies = each.value.policies
}
