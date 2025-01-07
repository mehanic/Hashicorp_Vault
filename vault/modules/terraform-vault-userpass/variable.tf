variable "mount-path" {
  type        = string
  description = "custom path to mount the userpass auth method"
  default     = "admin-demo"
}
variable "ttl" {
  type        = string
  description = "duration of the auth method in secs"
  default     = "300s"
}
variable "policy" {
  type        = string
  description = "name of policy"
  default     = "mypolicy"
}
variable "user" {
  type        = string
  description = "username"
  default     = "intern"

}