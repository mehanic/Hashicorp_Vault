resource "vault_mount" "db" {
  path = "mongodb"
  type = "database"
}

//openssl genrsa -out private_key.pem 2048
//openssl rsa -in private_key.pem -pubout -out public_key.pem

//vault auth enable oidc
# vault auth list                                                        

# Path                 Type        Accessor                  Description                Version
# ----                 ----        --------                  -----------                -------
# oidc/                oidc        auth_oidc_4e7acdd8        n/a                        n/a
