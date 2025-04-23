# ---------------------------
# Telemetry AMI Data Source
# ---------------------------
data "aws_ami" "telemetry" {
  most_recent = true

  filter {
    name   = "image-id"
    values = [var.consul_ami]
  }

  owners = ["self"]
}

# ---------------------------
# Telemetry EC2 Instance
# ---------------------------
resource "aws_instance" "telemetry" {
  count                       = length(var.telemetry_ips)  # Dynamically set instance count based on telemetry_ips
  ami                         = data.aws_ami.telemetry.id
  instance_type               = var.telemetry_instance_type
  subnet_id                   = module.vpc.private_subnets[count.index]
  key_name                    = aws_key_pair.aws.key_name
  associate_public_ip_address = false
  ebs_optimized               = true

  iam_instance_profile = aws_iam_instance_profile.benchmark.id

  vpc_security_group_ids = [
    aws_security_group.telemetry.id,
  ]

  tags = merge(
    var.default_tags,  # Include default tags for uniformity
    {
      role  = "telemetry"
      TTL   = var.ttl
    }
  )

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
  }

  user_data = data.template_file.telemetry.rendered
}

# ---------------------------
# Telemetry User Data Template
# ---------------------------
data "template_file" "telemetry" {
  template = file("${path.module}/templates/telemetry.tpl")

  vars = {
    env = var.env
  }
}

# ---------------------------
# Telemetry Security Group
# ---------------------------
resource "aws_security_group" "telemetry" {
  name        = "telemetry-sg"
  description = "Telemetry security group"

  ingress {
    from_port   = 3000
    to_port     = 3000
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
# Load Balancer Target Group Attachment for Grafana
# ---------------------------
resource "aws_lb_target_group_attachment" "grafana" {
  target_group_arn = aws_lb_target_group.grafana.arn
  target_id        = aws_instance.telemetry.id
  port             = 3000
}

# ---------------------------
# IAM Instance Profile
# ---------------------------
resource "aws_iam_instance_profile" "benchmark" {
  name = "telemetry-instance-profile"

  role = aws_iam_role.telemetry_role.name
}

# ---------------------------
# IAM Role for Telemetry
# ---------------------------
resource "aws_iam_role" "telemetry_role" {
  name = "telemetry-role"

  assume_role_policy = data.aws_iam_policy_document.telemetry_assume_role_policy.json
}

# ---------------------------
# IAM Policy Document for Telemetry Assume Role
# ---------------------------
data "aws_iam_policy_document" "telemetry_assume_role_policy" {
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
variable "consul_ami" {
  description = "The AMI ID for the Consul EC2 instance"
  default     = "ami-0c55b159cbfafe1f0"  # Example default AMI ID
}

variable "telemetry_instance_type" {
  description = "Instance type for Telemetry instances"
  default     = "t3.medium"
}

variable "telemetry_ips" {
  description = "List of private IPs for Telemetry instances"
  type        = list(string)
  default     = ["10.0.1.20", "10.0.1.21"]
}

variable "env" {
  description = "Environment for the Telemetry instances"
  default     = "production"
}

variable "owner" {
  description = "Owner of the resources"
  default     = "team-xyz"
}

variable "ttl" {
  description = "TTL for the Telemetry instances"
  default     = "7d"
}

variable "allowed_cidr_blocks" {
  description = "List of allowed CIDR blocks for Telemetry security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "default_tags" {
  description = "Default tags applied to all resources"
  type        = map(string)
  default     = {
    "Project" = "Telemetry"
    "Owner"   = "team-xyz"
  }
}
