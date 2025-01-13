variable "name" {
  type    = string
  default = "certificate"
}

variable "description" {
  type    = string
  default = ""
}

variable "path" {
  type    = string
  default = ""
}

variable "urls_prefix" {
  type    = set(string)
  default = []
}
