
# Create a data subdirectory in m7
mkdir data

# Launch consul server instance
consul agent -bootstrap -config-file="consul-config.hcl" -bind="127.0.0.1"

# From a separate terminal window run the following
consul acl bootstrap

# Set CONSUL_HTTP_TOKEN to SecretID

# Linux and MacOS
export CONSUL_HTTP_TOKEN=SECRETID_VALUE

# Next we have to create a policy and role for new tokens
# that Vault will generate on Consul

consul acl policy create -name=web -rules @web-policy.hcl

# Now we'll configure out Consul secrets engine
vault path-help consul/

vault path-help consul/config/access

vault write consul/config/access address="http://127.0.0.1:8500" token=$CONSUL_HTTP_TOKEN



# And add a role to provision tokens with a ttl of 1 hour and a max of 2 hours

vault path-help consul/roles/web

vault write consul/roles/web name=web policies=web ttl=3600 max_ttl=7200

# Now how do we use this role to get a token? By using the creds path

vault path-help consul/creds/web

vault read consul/creds/web

# Check on the consul side and we can see the token created

consul acl token list -format=json | jq .[].AccessorID
