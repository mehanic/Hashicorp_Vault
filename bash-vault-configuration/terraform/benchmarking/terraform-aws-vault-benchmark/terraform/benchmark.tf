provider "aws" {
  region = var.aws_region
}

data "aws_ami" "benchmark" {
  most_recent = true

  filter {
    name   = "image-id"
    values = [var.consul_ami]
  }

  owners = ["self"]
}

resource "aws_instance" "benchmark" {
  ami                         = data.aws_ami.benchmark.id
  instance_type               = var.benchmark_instance_type
  subnet_id                   = module.vpc.private_subnets[0]
  key_name                    = aws_key_pair.aws.key_name
  associate_public_ip_address = false
  ebs_optimized               = true
  iam_instance_profile        = aws_iam_instance_profile.benchmark.id

  vpc_security_group_ids = [
    aws_security_group.benchmark.id,
  ]

  tags = {
    env   = var.env
    role  = "benchmark"
    owner = var.owner
    ttl   = var.ttl
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
  }

  user_data = data.template_file.benchmark.rendered
}

data "template_file" "benchmark" {
  template = file("${path.module}/templates/benchmark.tpl")

  vars = {
    env = var.env
    ca  = tls_self_signed_cert.root.cert_pem
  }
}

resource "aws_security_group" "benchmark" {
  name        = "benchmark"
  description = "Benchmark security group"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Optional: You can update the security group settings if necessary.
