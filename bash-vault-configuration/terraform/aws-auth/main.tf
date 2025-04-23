provider "aws" {
  region = var.aws_region
}

module "vault_config" {
  source         = "./modules/templates/vault"
  aws_account_id = var.aws_account_id
}

module "vault" {
  source       = "./modules/ec2"
  aws_region   = var.aws_region
  name_prefix  = "vault-server"
  ssh_key_name = var.ssh_key_name
  owner_tag    = var.owner_tag
  ttl_tag      = var.ttl_tag
  ami_id       = var.ami_id
  instance_type = var.instance_type
  user_data    = module.vault_config.vault_user_data

  # Uncomment if you need to use a public SSH key
  # id_rsa_pub = var.id_rsa_pub
}

module "consumer_config" {
  source     = "./modules/templates/consumer"
  vault_addr = module.vault.ip
}

module "consumer-ec2" {
  source       = "./modules/ec2"
  aws_region   = var.aws_region
  name_prefix  = "vault-consumer"
  ssh_key_name = var.ssh_key_name
  owner_tag    = var.owner_tag
  ttl_tag      = var.ttl_tag
  ami_id       = var.ami_id
  instance_type = var.instance_type
  user_data    = module.consumer_config.user_data

  # Uncomment if you need to use a public SSH key
  # id_rsa_pub = var.id_rsa_pub
}
