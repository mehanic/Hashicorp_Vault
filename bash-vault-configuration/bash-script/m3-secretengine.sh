
vault secrets enable -path=dev-a kv

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request POST \
 --data @dev-b.json $VAULT_ADDR/v1/sys/mounts/dev-b

vault secrets list
vault secrets list -format=json

curl --header "X-Vault-Token: $VAULT_TOKEN" $VAULT_ADDR/v1/sys/mounts

vault kv put dev-a/arthur love=trillian friend=ford
vault kv get dev-a/arthur

#Alternate command
vault write dev-a/arthur enemy=zaphod
vault read dev-a/arthur

#Move the secrets engine path
vault secrets move dev-a dev-a-moved

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request POST \
 --data @dev-b-moved.json $VAULT_ADDR/v1/sys/remount


vault secrets list
vault read dev-a-moved/arthur

#Upgrade the secrets engine to v2
vault kv enable-versioning dev-a-moved

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request POST \
 --data @dev-b-moved-v2.json $VAULT_ADDR/v1/sys/mounts/dev-b-moved/tune

curl --header "X-Vault-Token: $VAULT_TOKEN" $VAULT_ADDR/v1/sys/mounts/dev-b-moved/tune

#Create a new secrets engine on v2
vault secrets enable -path=dev-c -version=2 kv 

#Disable the secrets engine
vault secrets disable dev-a

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request DELETE \
 $VAULT_ADDR/v1/sys/mounts/dev-b-moved

vault secrets list -format=json



