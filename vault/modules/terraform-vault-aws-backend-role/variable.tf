
variable "name" {
  description = "The name of the AWS secret backend role."
  default     = "aws_backend_role"

}

variable "path" {
  type        = string
  default     = "aws_backend_role"
  description = "description"
}

variable "backend" {
  description = "The AWS backend to configure."
  default     = "aws"
}

variable "credential_type" {
  description = "The type of credential to generate (assumed_role, iam_user, or federated_user)."
  default     = "assumed_role"
}

variable "policy_arns" {
  description = "List of AWS policy ARNs to attach to the role."
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
}

variable "role_arns" {
  description = "List of AWS role ARNs to assume."
  type        = list(string)
  default     = []
}

variable "policy_document" {
  description = "Custom IAM policy document to apply."
  type        = string
  default     = ""
}

variable "default_sts_ttl" {
  description = "Default TTL for STS credentials."
  type = number
  default     = 3600
}

variable "max_sts_ttl" {
  description = "Maximum TTL for STS credentials."
  type = number
  default     = 7200
}



# name             = "aws_backend_role"
# credential_type  = "assumed_role"
# policy_arns      = ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
# role_arns        = []
# policy_document  = ""
# default_sts_ttl  = "3600s"
# max_sts_ttl      = "7200s"
