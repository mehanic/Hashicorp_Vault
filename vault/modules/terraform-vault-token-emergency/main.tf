resource "vault_token_auth_backend_role" "emergency" {
  role_name         = "emergency_seal"
  allowed_policies  = [vault_policy.emergency.name]
  token_bound_cidrs = var.token_bound_cidrs
  orphan            = true
}

resource "vault_token" "emergency" {
  role_name       = vault_token_auth_backend_role.emergency.role_name
  policies        = [vault_policy.emergency.name]
  display_name    = "emergency-seal"
  renewable       = true
  num_uses        = 1
  ttl             = var.token_ttl
  renew_min_lease = 2592000
  renew_increment = 7776000
}


resource "vault_policy" "emergency" {
  name = "emergency_seal"

  policy = <<EOT
path "/sys/seal" {
  capabilities = ["create", "update", "sudo"]
}
EOT
}


# 1. vault_token_auth_backend_role Resource - emergency
# This resource defines a role in the Vault token authentication backend (token-auth), specifically for the
# "emergency" role.

# role_name: "emergency_seal"

# This defines the name of the token role. The role is called emergency_seal, which likely suggests it is used to provide emergency access 
#(e.g., to unseal the Vault).
# allowed_policies: [vault_policy.emergency.name]

# This attaches the emergency_seal policy (defined elsewhere in your configuration) to this role. The role will grant the specified 
#policies when the token is issued.
# token_bound_cidrs: var.token_bound_cidrs

# This allows you to restrict access to the token from specific CIDR blocks (e.g., IP addresses or subnets). The value for
# var.token_bound_cidrs should be defined elsewhere in your configuration as a list of allowed CIDR blocks.
# orphan: true

# Setting orphan = true means that when the token is generated, it will be an "orphan" token. Orphan tokens are not tied to
# the Vault policies or identity and won't be revoked when the role or user is deleted. It gives the token independent persistence.
# 2. vault_token Resource - emergency
# This resource creates the token itself using the role emergency_seal defined earlier.

# role_name: vault_token_auth_backend_role.emergency.role_name

# This refers to the role that is used to generate the token. In this case, the token is created using the emergency_seal role defined above.
# policies: [vault_policy.emergency.name]

# This attaches the emergency_seal policy to the token. The policy defines what actions the token holder is allowed to perform, 
#such as accessing specific paths in Vault.
# display_name: "emergency-seal"

# This provides a human-readable name for the token. It's typically used to describe the token's purpose, in this case, emergency-seal.
# renewable: true

# Setting this to true allows the token to be renewed after its expiration. This means the token can be extended for longer 
#periods instead of expiring immediately.
# num_uses: 1

# The token can be used only once. This is a useful setting when you want the token to perform a specific action
# (like unsealing Vault) and then expire after being used once.
# ttl: var.token_ttl

# The Time-To-Live (TTL) of the token. This determines how long the token is valid before it expires. The TTL value is dynamically set 
#from the var.token_ttl variable, which should be defined elsewhere in your configuration.
# renew_min_lease: 2592000

# This is the minimum duration in seconds that the token can be renewed for. It is set to 30 days (2592000 seconds), which means the 
#token can be renewed for a minimum of 30 days each time it is renewed.
# renew_increment: 7776000

# This specifies the time increment by which the token's lease is extended when renewed. In this case, it's set to 90 days 
#(7776000 seconds), meaning that each renewal extends the token by 90 days.
