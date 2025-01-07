variable "token_max_time" {
  type        = number
  description = "maximum lifetime for generated tokens in number of seconds"
  default     = 1800
}

variable "role" {
  type        = string
  description = "name of the role for the usecase"
  default     = "myrole"
}

variable "policy" {
  type        = string
  description = "policy's name"
  default     = "mypolicy"
}

variable "mount-path" {

  type        = string
  description = "custom path to mount the approle auth method"
  default     = "app-demo"

}

variable "ttl" {

  type        = string
  description = "duration of the auth method in secs"
  default     = "300s"

}