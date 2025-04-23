variable "security_groups" {
  description = "A map of security groups and their rules"
  type = map(object({
    name        = string
    description = string
    ingress     = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
  default = {
    bastion = {
      name        = "bastion"
      description = "Bastion access"
      ingress = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "TCP"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
    consul = {
      name        = "consul"
      description = "Consul nodes"
      ingress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["10.0.0.0/16"]
        }
      ]
      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
    vault = {
      name        = "vault"
      description = "Vault nodes"
      ingress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["10.0.0.0/16"]
        }
      ]
      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
    telemetry = {
      name        = "telemetry"
      description = "Telemetry service"
      ingress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["10.0.0.0/16"]
        }
      ]
      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
    envoy = {
      name        = "envoy"
      description = "Envoy proxy"
      ingress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["10.0.0.0/16"]
        },
        {
          from_port   = 8080
          to_port     = 8080
          protocol    = "TCP"
          cidr_blocks = ["0.0.0.0/0"]
        },
        {
          from_port   = 8443
          to_port     = 8443
          protocol    = "TCP"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
    benchmark = {
      name        = "benchmark"
      description = "Benchmark service"
      ingress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["10.0.0.0/16"]
        }
      ]
      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
    telemetry_lb = {
      name        = "telemetry-lb"
      description = "Telemetry load balancer"
      ingress = [
        {
          from_port   = 3000
          to_port     = 3000
          protocol    = "TCP"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
  }
}

resource "aws_security_group" "dynamic" {
  for_each = var.security_groups

  name        = each.value.name
  description = each.value.description
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = each.value.ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = each.value.egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
