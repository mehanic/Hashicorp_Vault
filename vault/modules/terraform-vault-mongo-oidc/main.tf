resource "vault_mount" "db" {
  path = "mongodb"
  type = "database"
}

resource "vault_database_secret_backend_connection" "mongodb" {
  backend       = vault_mount.db.path
  name          = "mongodb"
  allowed_roles = ["my-role"]

  mongodbatlas {
    public_key  = var.mongodb_public_key
    private_key = var.mongodb_private_key
    project_id  = var.mongodb_project_id
  }
}


resource "vault_identity_group" "mongodbuser" {
  name     = var.mongodb_users_groupname
  type     = "external"
  metadata = var.mongodb_users_metadata
  policies = [vault_policy.mongodb_user.name]
}

resource "vault_identity_group_alias" "default" {
  name           = var.oidc_group_alias_name
  mount_accessor = var.oidc_mount_accessor
  canonical_id   = vault_identity_group.mongodbuser.id
}



resource "vault_database_secret_backend_role" "role" {
  backend             = vault_mount.db.path
  name                = "my-role"
  db_name             = vault_database_secret_backend_connection.mongodb.name
  creation_statements = ["{\"database_name\": \"admin\",\"roles\": [{\"databaseName\":\"admin\",\"roleName\":\"atlasAdmin\"}]}"]
}

data "vault_policy_document" "mongodb_user_policy" {
  rule {
    description  = "Read system health check"
    path         = "mongodb/creds/my-role"
    capabilities = ["read"]
  }
}

resource "vault_policy" "mongodb_user" {
  name   = "mongodb-user"
  policy = data.vault_policy_document.mongodb_user_policy.hcl
}


//openssl genrsa -out private_key.pem 2048
//openssl rsa -in private_key.pem -pubout -out public_key.pem

//vault auth enable oidc
# vault auth list                                                        

# Path                 Type        Accessor                  Description                Version
# ----                 ----        --------                  -----------                -------
# oidc/                oidc        auth_oidc_4e7acdd8        n/a                        n/a
