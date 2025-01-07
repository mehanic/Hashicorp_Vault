variable "mount-path" {
  type        = string
  description = "kvv2 secret mount path"
  default     = "foobar"
}
variable "path-postfix" {
  type        = string
  description = "subpath of a kv mount path"
  default     = "mysecrets"
}
variable "policy" {
  type        = string
  description = "policy's name"
  default     = "mypolicy"
}