provider "aws" {
  region = var.aws_region
}

module "security" {
  source      = "../security"
  aws_region  = var.aws_region
  name_prefix = var.name_prefix
  owner_tag   = var.owner_tag
  ttl_tag     = var.ttl_tag
}

resource "aws_instance" "ubuntu" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.ssh_key_name
  vpc_security_group_ids = [module.security.security_group_id]
  user_data              = var.user_data
  iam_instance_profile   = var.iam_instance_profile_name

  tags = {
    Name  = "vault-demo-${var.name_prefix}"
    Owner = var.owner_tag
    TTL   = var.ttl_tag
  }
}
