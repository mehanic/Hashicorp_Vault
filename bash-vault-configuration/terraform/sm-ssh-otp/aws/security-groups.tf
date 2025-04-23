resource "aws_security_group" "testing" {
  name        = "${var.environment_name}-testing-sg"
  description = "SSH and Internal Traffic"
  vpc_id      = module.vault_demo_vpc.vpc_id

  tags = {
    Name = var.environment_name
  }

  # Dynamic Ingress Rules
  dynamic "ingress" {
    for_each = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8200
        to_port     = 8200
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8201
        to_port     = 8201
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        self      = true
      }
    ]
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      self        = ingress.value.self
    }
  }

  # Dynamic Egress Rule
  dynamic "egress" {
    for_each = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
