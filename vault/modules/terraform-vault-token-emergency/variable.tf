variable "token_ttl" {
  type    = string
  default = "9600h"
}

variable "token_bound_cidrs" {
  type    = list(string)
  default = []
}