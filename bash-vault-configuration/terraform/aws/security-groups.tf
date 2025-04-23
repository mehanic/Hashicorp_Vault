resource "aws_security_group" "testing" {
  name        = "${var.environment_name}-testing-sg"
  description = "SSH and Internal Traffic"
  vpc_id      = module.vault_demo_vpc.vpc_id

  tags = {
    Name = var.environment_name
  }

  # Define the list of ingress rules
  dynamic "ingress" {
    for_each = [
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 8200, to_port = 8200, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 8201, to_port = 8201, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 0, to_port = 0, protocol = "-1", self = true }  # Internal Traffic
    ]

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      self        = lookup(ingress.value, "self", null)
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
