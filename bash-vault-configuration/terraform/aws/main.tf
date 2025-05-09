# Provider Configuration
provider "aws" {
  region = var.aws_region
}

# Data Source for Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Vault Server EC2 Instance
resource "aws_instance" "vault-server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = module.vault_demo_vpc.public_subnets[0]
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.testing.id]
  associate_public_ip_address = true
  private_ip                  = var.vault_server_private_ip
  iam_instance_profile        = aws_iam_instance_profile.vault-server.id

  # User Data for Vault Server Setup
  user_data = templatefile("${path.module}/templates/userdata-vault-server.tpl", {
    tpl_vault_node_name        = "vault-server"
    tpl_vault_storage_path     = "/vault/vault-server"
    tpl_vault_binary_url       = var.vault_binary_url
    tpl_configure_vault_server = var.configure_vault_server
  })

  tags = {
    Name = "${var.environment_name}-vault-server"
  }

  # Prevent certain changes from triggering a replacement
  lifecycle {
    ignore_changes = [
      ami,     # Do not recreate instance when AMI changes
      tags     # Do not recreate instance when tags change
    ]
  }
}
