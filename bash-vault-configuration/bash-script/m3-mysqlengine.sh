
export VAULT_ADDR=http://127.0.0.1:8200
vault secrets enable database

mysql -u root -p
CREATE ROLE 'dev-role';
CREATE USER 'vault'@'<YourPublicIP>' IDENTIFIED BY 'AsYcUdOP426i';
CREATE DATABASE devdb;
GRANT ALL ON *.* TO 'vault'@'<YourPublicIP>';
GRANT GRANT OPTION ON devdb.* TO 'vault'@'<YourPublicIP>';


vault write database/config/dev-mysql-database \
    plugin_name=mysql-database-plugin \
    connection_url="{{username}}:{{password}}@tcp(MY_SQL_IP:3306)/" \
    allowed_roles="dev-role" \
    username="vault" \
    password="AsYcUdOP426i"

vault write database/roles/dev-role \
    db_name=dev-mysql-database \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON devdb.* TO '{{name}}'@'%';" \
    default_ttl="1h" \
    max_ttl="24h"

vault read database/creds/dev-role

SELECT User FROM mysql.user;
SHOW GRANTS FOR 'username';


vault lease renew -increment=3600 database/creds/dev-role/LEASE_ID

vault lease renew -increment=96400 database/creds/dev-role/LEASE_ID

vault lease revoke database/creds/dev-role/LEASE_ID

