module "white" {
  source             = "../../modules/terraform-vault-pki-intermediate-internal-ca"
  mesh_name          = "white"
  root_ca_mount_path = "pki_root_ca"


}

module "black" {
  source                    = "../../modules/terraform-vault-pki-intermediate-internal-ca"
  mesh_name                 = "black"
  root_ca_mount_path        = "pki_root_ca"
  common_name_suffix        = "service mesh"
  default_certificate_ttl   = 24
  maximum_certificate_ttl   = 72
  token_role_ttl            = 24
  additional_token_policies = ["manage_self"]
}


# module "yellow" {
#   //source = "github.com/grantorchard/terraform-vault-pki-intca"
#   source = "/home/mehanic/VAULT/3.PKI_vault/terraform-vault-pki-intca"

#   mesh_name          = "yellow"
#   root_ca_mount_path = "pki_root_ca"
# }

# module "orange" {
#   //source = "github.com/grantorchard/terraform-vault-pki-intca"
#   source = "/home/mehanic/VAULT/3.PKI_vault/terraform-vault-pki-intca"
#   mesh_name                 = "orange"
#   root_ca_mount_path        = "pki_root_ca"
#   common_name_suffix        = "service mesh"
#   default_certificate_ttl   = 24
#   maximum_certificate_ttl   = 72
#   token_role_ttl            = 24
#   additional_token_policies = ["manage_self"]
# }

#1.vault secrets enable -path=pki_root_ca pki
# 2. vault write pki_root_ca/root/generate/internal \
#     common_name="Root CA" \
#     ttl=87600h 
//3. vault list pki_root_ca/issuers                                         

//Keys
//----
//77b8144c-58d9-3412-af7f-f135bb95f1d9

//Set one of the issuer references as the default: vault write pki_root_ca/config/issuers/default \
//    issuer_ref="77b8144c-58d9-3412-af7f-f135bb95f1d9"
