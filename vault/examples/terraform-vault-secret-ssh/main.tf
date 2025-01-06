module "terraform-vault-secret-ssh" {
  source   = "../../modules/terraform-vault-secret-ssh"
  ssh_path = "ssh"

  ttl = 172800 # 3600 * 24 * 2 (2 days TTL)

  max_ttl = 604800 # 3600 * 24 * 7 (7 days max TTL)

  allowed_domains = [
    "example.com",
    "mydomain.org"
  ]

  allow_subdomains = false

  algorithm = "rsa-sha2-512"


}
