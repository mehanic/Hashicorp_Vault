variable "name" {
  type    = string
  default = "intermediate-certificate"
}

variable "parent_ca" {
  type    = string
  default = "intermediate-certificate"  //default = "root-certificate"?
  //vault write root-certificate/config/issuers/default issuer_ref="<issuer-ref>"   vault read root-certificate/issuers

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

# vault secrets enable -path=root-certificate pki
# vault read root-certificate/issuers
# vault write root-certificate/root/generate/internal \
#   common_name="My Root CA" \
#   ttl="87600h"
# vault write root-certificate/config/issuers/default \
#   issuer_ref="root"
