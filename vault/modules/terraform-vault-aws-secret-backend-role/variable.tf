variable "aws_secret_backend_path" {
  type    = string
  default = "aws_route53"
}

variable "route53_hosted_zone" {
  type    = string
  default = "Z1234567890ABC"
}


variable "aws_account_id" {
  type    = string
  default = ""
}

variable "dynamic_name" {
  type    = string
  default = "dynamic_route53_dns"
}

variable "credential_type" {
  type    = string
  default = "iam_user"
}
