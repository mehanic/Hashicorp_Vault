data "template_file" "code_sign_user_cn_enforce" {
  template = file("../../modules/terraform-vault-pki-ldap-sign/code_sign_user_cn_enforce.sentinel.tpl")
  vars = {
    valid_domain = var.code_sign_user_cn_valid_domain
  }
}
