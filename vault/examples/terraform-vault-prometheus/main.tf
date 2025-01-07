module "terraform-vault-prometheus" {
  source = "../../modules/terraform-vault-prometheus"
  # Define allowed CIDRs for the token, if applicable (e.g., IP ranges that can use the token)
  token_cidrs = [
    "192.168.1.0/24", # Example CIDR block
    "10.0.0.0/16"     # Another example CIDR block
  ]

  # Define the Time-to-Live (TTL) for the token. Adjust it as necessary.
  token_ttl = "9600h" # Default value is 9600 hours

}
