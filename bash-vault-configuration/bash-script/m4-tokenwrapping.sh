#Export the Vault server running in AD environment
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=AddYourVaultTokenHere


#Log into Vault server as root
vault login

#Store a new application secret
vault kv put secret/app-server api-key=123456

#Create a wrapping token for 5 minutes
vault kv get -wrap-ttl=300 secret/app-server

#Retrieve the secret
curl --header "X-Vault-Token: WRAPPING_TOKEN" --request POST \
  $VAULT_ADDR/v1/sys/wrapping/unwrap | jq


#Add the webkv store if you haven't already
vault secrets enable -path=webkv kv

#Add a secret to webkv
vault kv put webkv/app-server api-key=123456

#Add a web policy if you haven't already
vault policy write web webpol.hcl

#Create a token for an account using the web policy and wrap it
vault token create -policy=web -wrap-ttl=300

#Retrieve the app token
curl --header "X-Vault-Token: WRAPPING_TOKEN" --request POST \
  $VAULT_ADDR/v1/sys/wrapping/unwrap | jq


#Retrieve a secret from webkv using new token
#For Linux
curl --header "X-Vault-Token: APP_TOKEN" $VAULT_ADDR/v1/webkv/app-server | jq

