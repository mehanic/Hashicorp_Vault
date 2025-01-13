
variable "module_depends_on" {
  type    = any
  default = []
}

resource "vault_mount" "aws" {
  depends_on = [var.module_depends_on]
  path       = "aws"
  type       = "aws"
}



variable "aws_region" {
  description = "The AWS region to deploy the resources."
  type        = string
  default     = "us-east-1"
}
