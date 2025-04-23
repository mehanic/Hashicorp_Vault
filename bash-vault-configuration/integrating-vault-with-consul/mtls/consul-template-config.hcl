vault {
  address      = "http://localhost:8200"

  # You can use the Vault agent to manage the required Vault token
  # vault_agent_token_file = ""

  renew_token=false
}

template {
  source      = "templates/ca-certificate.template"
  destination = "secrets/ca.crt"
  command     = "date && consul reload"
}

template {
  source      = "templates/agent-certificate.template"
  destination = "secrets/agent.crt"
  command     = "date && consul reload"
}

template {
  source      = "templates/agent-key.template"
  destination = "secrets/agent.key"
  command     = "date && consul reload"
}
