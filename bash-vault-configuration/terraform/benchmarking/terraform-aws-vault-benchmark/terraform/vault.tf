# ---------------------------
# Vault AMI Data Source
# ---------------------------
data "aws_ami" "vault" {
  most_recent = true

  filter {
    name   = "image-id"
    values = [var.vault_ami]
  }

  owners = ["self"]
}

# ---------------------------
# Vault EC2 Instances
# ---------------------------
resource "aws_instance" "vault" {
  count                       = length(var.vault_ips)  # Automatically set count based on the number of IPs
  ami                         = data.aws_ami.vault.id
  instance_type               = var.vault_instance_type
  subnet_id                   = module.vpc.private_subnets[count.index]
  key_name                    = aws_key_pair.aws.key_name
  ebs_optimized               = true
  associate_public_ip_address = false
  private_ip                  = var.vault_ips[count.index]

  vpc_security_group_ids = [
    aws_security_group.vault.id,
  ]

  iam_instance_profile = aws_iam_instance_profile.benchmark.id

  tags = merge(
    var.default_tags,  # Include default tags for uniformity
    {
      role  = "vault"
      TTL   = var.ttl
    }
  )

  root_block_device {
    volume_type = "gp2"
    volume_size = 100
  }

  user_data = data.template_file.vault.rendered
}

# ---------------------------
# Vault User Data Template
# ---------------------------
data "template_file" "vault" {
  template = file("${path.module}/templates/vault.tpl")

  vars = {
    env    = var.env
    kms_id = aws_kms_key.vault.key_id
    cert   = tls_locally_signed_cert.vault.cert_pem
    key    = tls_private_key.vault.private_key_pem
    ca     = tls_self_signed_cert.root.cert_pem
    region = var.region
  }
}

# ---------------------------
# IAM Instance Profile
# ---------------------------
resource "aws_iam_instance_profile" "benchmark" {
  name = "vault-instance-profile"

  role = aws_iam_role.vault_role.name
}

# ---------------------------
# Security Group for Vault
# ---------------------------
resource "aws_security_group" "vault" {
  name        = "vault-sg"
  description = "Vault security group"

  ingress {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ---------------------------
# Vault KMS Key
# ---------------------------
resource "aws_kms_key" "vault" {
  description = "KMS key for Vault encryption"
  policy      = data.aws_iam_policy_document.vault_kms_policy.json

  tags = {
    Name = "vault-kms-key"
  }
}

# ---------------------------
# IAM Policy for KMS Access
# ---------------------------
data "aws_iam_policy_document" "vault_kms_policy" {
  statement {
    actions   = ["kms:Encrypt", "kms:Decrypt"]
    resources = [aws_kms_key.vault.arn]
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.vault_role.arn]
    }
  }
}

# ---------------------------
# IAM Role for Vault
# ---------------------------
resource "aws_iam_role" "vault_role" {
  name = "vault-role"

  assume_role_policy = data.aws_iam_policy_document.vault_assume_role_policy.json
}

# ---------------------------
# Vault IAM Role Assume Policy
# ---------------------------
data "aws_iam_policy_document" "vault_assume_role_policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# ---------------------------
# Variables
# ---------------------------
variable "vault_ami" {
  description = "The AMI ID for the Vault EC2 instance"
  default     = "ami-0c55b159cbfafe1f0"  # Example default AMI ID
}

variable "vault_instance_type" {
  description = "Instance type for Vault instances"
  default     = "t3.medium"
}

variable "vault_ips" {
  description = "List of private IPs for Vault instances"
  type        = list(string)
  default     = ["10.0.1.10", "10.0.1.11", "10.0.1.12"]
}

variable "env" {
  description = "Environment for the Vault instances"
  default     = "production"
}

variable "owner" {
  description = "Owner of the resources"
  default     = "team-xyz"
}

variable "ttl" {
  description = "TTL for the Vault instances"
  default     = "7d"
}

variable "allowed_cidr_blocks" {
  description = "List of allowed CIDR blocks for Vault security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "default_tags" {
  description = "Default tags applied to all resources"
  type        = map(string)
  default     = {
    "Project" = "Vault"
    "Owner"   = "team-xyz"
  }
}
