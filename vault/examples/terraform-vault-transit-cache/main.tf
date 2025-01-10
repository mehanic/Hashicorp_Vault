module "terraform-vault-transit-cache" {
  source = "../../modules/terraform-vault-transit-cache"
  path   = "transit-vault"

  default_lease = 3600

  max_lease = 3600

  seal_wrap = true

  local_mount = true

  external_entropy_access = false

  transit_cache_size = 10

  transit_keys = [
    {
      name                   = "example-key-1"
      type                   = "aes256-gcm96"
      deletion_allowed       = true
      derived                = false
      convergent_encryption  = false
      exportable             = false
      allow_plaintext_backup = false
      min_decryption_version = 1
      min_encryption_version = 0
    },
    {
      name                   = "example-key-2"
      type                   = "rsa-2048"
      deletion_allowed       = false
      derived                = false # Updated
      convergent_encryption  = false # Updated
      exportable             = true
      allow_plaintext_backup = true
      min_decryption_version = 2
      min_encryption_version = 1
    }
  ]

}
