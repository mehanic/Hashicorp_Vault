module "terraform-vault-pki-request-certificate-from-existing" {
  source             = "../../modules/terraform-vault-pki-request-certificate-from-existing"
  pki_namespace      = "root"
  backend            = "/pki1"
  name               = "code_sign"
  common_name        = "test.example.com"
  ttl                = "90d"
  format             = "pem"
  private_key_format = "der"
  kv_path            = "kvv2"
  kv_secret          = "secret"


}