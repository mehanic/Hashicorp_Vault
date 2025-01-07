variable "token_cidrs" {
  type    = list(string)
  default = []
}

variable "token_ttl" {
  type    = string
  default = "9600h"
}
