# write cert to KV
resource "vault_kv_secret_v2" "cert" {
  namespace = var.pki_namespace
  mount     = var.kv_path
  name      = "${var.kv_secret}/${var.common_name}"
  # cas                 = 1
  # delete_all_versions = true
  data_json = jsonencode(
    {
      "pub_key"  = vault_pki_secret_backend_cert.cert.certificate
      "priv_key" = vault_pki_secret_backend_cert.cert.private_key
    }
  )
  # custom_metadata {
  #   data = {
  #     CommonName       = vault_pki_secret_backend_cert.cert.common_name,
  #     SerialNumber     = vault_pki_secret_backend_cert.cert.serial_number,
  #   // Issuer           = data.tls_certificate.cert.certificates[0].issuer,
  #    ApplicationName  = local.metadata.ApplicationName
  #     ApplicationID    = local.metadata.ApplicationID,
  #     PrimaryOwnerID   = local.metadata.PrimaryOwnerID,
  #     SecondaryOwnerID = local.metadata.SecondaryOwnerID,
  #     CostCenter       = local.metadata.CostCenter,
  #     ServiceNowTicket = local.metadata.ServiceNowTicket
  #   }
  # }
}
