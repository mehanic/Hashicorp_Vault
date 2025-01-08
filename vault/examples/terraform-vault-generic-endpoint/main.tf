module "terraform-vault-generic-endpoint" {
  source = "../../modules/terraform-vault-generic-endpoint"
  # Database connection settings
  db_hostname                = "127.0.0.1"                 # Hostname of the database
  db_username                = "postgres"                  # Database username
  db_password                = "new_password"              # Database password
  db_tcp_port                = 5432                        # TCP port for PostgreSQL
  db_path                    = "vault_database_postgresql" # Path to mount the database secrets engine
  db_backend_role_name       = "dev"                       # Role name to create
  db_backend_connection_name = "postgres"                  # Name of the database connection

}




# vault read vault_database_postgresql/creds/dev
# Key                Value
# ---                -----
# lease_id           vault_database_postgresql/creds/dev/90eAWe8qaVS3tzpC4LhuyS9B
# lease_duration     768h
# lease_renewable    true
# password           B66BYw-pxBx5vLYnjOfJ
# username           v-root-dev-ukQow9kwa9oVTc1I38aW-1736367958


#  psql -U v-root-dev-5MjK6MSDBH5FDSaB3vKA-1736367225 -h 127.0.0.1 -d postgres
# Password for user v-root-dev-5MjK6MSDBH5FDSaB3vKA-1736367225: 
# psql (16.6 (Ubuntu 16.6-0ubuntu0.24.04.1))
# SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, compression: off)
# Type "help" for help.

# postgres=> 

# terraform output vault_connection_url                                  


# "postgres://{{username}}:{{password}}@127.0.0.1:5432/postgres"

# vault list sys/leases/lookup/vault_database_postgresql/creds/dev
# Keys
# ----
# 90eAWe8qaVS3tzpC4LhuyS9B
# A9otZYW0Ee0Uaybu1DNR1wGr
# GJo3CTZihacS4GEb4YgZlSVN

#  
#  └> $ vault lease revoke vault_database_postgresql/creds/dev/90eAWe8qaVS3tzpC4LhuyS9B
# All revocation operations queued successfully!

#  
#  └> $ vault lease revoke vault_database_postgresql/creds/dev/A9otZYW0Ee0Uaybu1DNR1wGr
# All revocation operations queued successfully!

#   
#  └> $ vault lease revoke vault_database_postgresql/creds/dev/GJo3CTZihacS4GEb4YgZlSVN
# All revocation operations queued successfully!

#  
#  └> $ vault secrets disable vault_database_postgresql

# vault lease revoke -force -prefix vault_database_postgresql/creds/dev/
# Warning! Force-removing leases can cause Vault to become out of sync with
# secret engines!
# Success! Force revoked any leases with prefix: vault_database_postgresql/creds/dev/

# vault read vault_database_postgresql/config/postgres                 

# Key                                   Value
# ---                                   -----
# allowed_roles                         [dev]
# connection_details                    map[connection_url:postgres://{{username}}:{{password}}@127.0.0.1:5432/postgres disable_escaping:false max_open_connections:2 username:postgres]
# password_policy                       n/a
# plugin_name                           postgresql-database-plugin
# plugin_version                        n/a
# root_credentials_rotate_statements    [ALTER ROLE "{{name}}" WITH PASSWORD '{{password}}';]

#vault write -force vault_database_postgresql/rotate-root/postgres   -rotation


#  ┌─────(mehanic)─────(/etc/vault) 
#  └> $ vault secrets disable vault_database_postgresql
# Success! Disabled the secrets engine (if it existed) at: vault_database_postgresql/
#---------------------------------
#sudo -u postgres psql
#ALTER USER postgres WITH PASSWORD 'new_password';

